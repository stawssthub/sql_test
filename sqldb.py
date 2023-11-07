import mysql.connector
import os
import glob

# List of MySQL database connection parameters
databases = [
    {
        "host": os.getenv("DB_HOST_1"),
        "database": os.getenv("DB_NAME_1"),
        "user": os.getenv("DB_USER_1"),
        "password": os.getenv("DB_PASSWORD_1"),
    },
    {
        #"host": "db2.example.com",
        "host": os.getenv("DB_HOST_2"),
        "database": os.getenv("DB_NAME_2"),
        "user": os.getenv("DB_USER_2"),
        "password": os.getenv("DB_PASSWORD_2"),
    },
    # Add more database configurations as needed
]

# Directory containing SQL scripts
sql_script_dir = "hawthorn"  # Replace with your actual directory path

# Get a list of all SQL files in the directory
sql_scripts = glob.glob(os.path.join(sql_script_dir, "**.sql"))

for db_config in databases:
    connection = mysql.connector.connect(
        host=db_config["host"],
        user=db_config["user"],
        password=db_config["password"],
        database=db_config["database"],
    )

    cursor = connection.cursor()

    for script in sql_scripts:
        # Check if the script has already been deployed
        cursor.execute("SELECT script_name FROM deployed_scripts WHERE script_name = %s", (os.path.basename(script),))
        if not cursor.fetchone():
            with open(script, "r") as file:
                sql = file.read()
            cursor.execute(sql)
            cursor.execute("INSERT INTO deployed_scripts (script_name) VALUES (%s)", (os.path.basename(script),))
    
    connection.commit()
    cursor.close()
    connection.close()
