/*
Lesson 06
MySQL
*/

CREATE TABLE person (
  person_id INT NOT NULL AUTO_INCREMENT,
  company_id INT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  CONSTRAINT pk_person PRIMARY KEY (person_id),
  CONSTRAINT fk_person_cid FOREIGN KEY (company_id) REFERENCES company(company_id)
);
