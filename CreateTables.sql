CREATE TABLE instrument_stock (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_quantity INT NOT NULL,
 instrument VARCHAR(500)
);

ALTER TABLE instrument_stock ADD CONSTRAINT PK_instrument_stock PRIMARY KEY (id);


CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name VARCHAR(500) NOT NULL,
 age VARCHAR(10) NOT NULL,
 address VARCHAR(500) NOT NULL,
 person_number VARCHAR(500) NOT NULL,
 phone_number VARCHAR(500) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_arsenal VARCHAR(500),
 person_id INT GENERATED ALWAYS AS IDENTITY
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_payment (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 amount_of_lessons INT NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instructor_payment ADD CONSTRAINT PK_instructor_payment PRIMARY KEY (id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_type VARCHAR(500),
 lesson_type VARCHAR(500),
 date_and_time VARCHAR(500),
 price INT NOT NULL,
 instructor_id INT GENERATED ALWAYS AS IDENTITY,
 skill_level VARCHAR(500)
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill_level VARCHAR(500) NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_payment (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 applied_discount VARCHAR(500),
 lesson_skill_level VARCHAR(500),
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 type_of_lesson_attended VARCHAR(500)
);

ALTER TABLE student_payment ADD CONSTRAINT PK_student_payment PRIMARY KEY (id);


CREATE TABLE ensembles (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 maximum_number_of_students INT,
 minimum_number_of_students INT,
 genre VARCHAR(500)
);

ALTER TABLE ensembles ADD CONSTRAINT PK_ensembles PRIMARY KEY (id,lesson_id);


CREATE TABLE group_lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 minimum_place_limit VARCHAR(500)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id,lesson_id);


CREATE TABLE individual_lesson (
 id INT NOT NULL,
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (id,lesson_id);


CREATE TABLE instrument_rented (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price VARCHAR(10000000) NOT NULL,
 amount VARCHAR(500),
 renting_date VARCHAR(500),
 student_payment_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_stock_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instrument_rented ADD CONSTRAINT PK_instrument_rented PRIMARY KEY (id);


CREATE TABLE schedueled_time_slots (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 date_and_time VARCHAR(500),
 class_room_number VARCHAR(500),
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE schedueled_time_slots ADD CONSTRAINT PK_schedueled_time_slots PRIMARY KEY (id);


CREATE TABLE sibling (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_number VARCHAR(500) NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE instructor_payment ADD CONSTRAINT FK_instructor_payment_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE student ADD CONSTRAINT FK_student_1 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE student_payment ADD CONSTRAINT FK_student_payment_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE ensembles ADD CONSTRAINT FK_ensembles_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE instrument_rented ADD CONSTRAINT FK_instrument_rented_0 FOREIGN KEY (student_payment_id) REFERENCES student_payment (id);
ALTER TABLE instrument_rented ADD CONSTRAINT FK_instrument_rented_1 FOREIGN KEY (instrument_stock_id) REFERENCES instrument_stock (id);


ALTER TABLE schedueled_time_slots ADD CONSTRAINT FK_schedueled_time_slots_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);


