/* Database schema to keep the structure of entire database. */

DROP TABLE IF EXISTS patients;
CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS medical_histories;
CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  patient_id INT,
  PRIMARY KEY (id),
  CONSTRAINT FK_patient_id
  FOREIGN KEY (patient_id)
  REFERENCES patients(id)
);

DROP TABLE IF EXISTS treatments;
CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(50),
  name VARCHAR(100),
  PRIMARY KEY (id),
  CONSTRAINT FK_medical_histories_id
  FOREIGN KEY (id)
  REFERENCES medical_histories(id)
);

DROP TABLE IF EXISTS medical_histories_treatments;
CREATE TABLE medical_histories_treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  medical_histories_id INT,
  treatments_id INT,
  CONSTRAINT FK_medical_histories_id
  FOREIGN KEY (medical_histories_id)
  REFERENCES medical_histories(id),
  CONSTRAINT FK_treatments_id
  FOREIGN KEY (treatments_id)
  REFERENCES treatments(id)
);