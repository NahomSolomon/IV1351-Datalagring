INSERT INTO "person" ("id","name","age","person_number","adress","phone_number")
VALUES
  ('1',Jarrod Ryan','47','P.O. Box 873, 496 Phasellus Av.','19450101','0781351831'),
  ('2','Katell Snider','33','4630 Ligula. Rd.','19450111','0718721327'),
  ('3','Ryder Vinson','75','P.O. Box 214, 492 Erat, Av.','19450121','0741835129'),
  ('4','Deacon Rivas','9','6985 Curabitur Street','19450131','0757388621'),
  ('5','Danielle Cole','87','9973 A Avenue','19450141','0774848674'),
  ('6','Méthode Besantie','24','1999030310','773 Morning Park','0781351831'),
  ('7','Erwin Barkess','23','2000101011','5 Tony Alley','071872987'),
  ('8','Mickie MacKain','22','2001090912','115 Farragut Park','0700005129'),
  ('9','Rockie Burdon','11','2012050513','4774 Erie Alley','0757388621');

INSERT INTO student (skill_level, person_id, sibling_person_number, lesson_id)
OVERRIDING SYSTEM VALUE 
VALUES 
('Intermediate', 4, 'NULL', 1),
('Beginner', 5, '20030315', 17),
('Avanced', 6, 'NULL', 20),
('Beginner', 7, 'NULL', 18),
('Advanced', 8, '2013020214&2012050517', 21),
('Intermediate', 9, 'NULL', 19),
('Advanced', 10, '20130202', 2),
('Advanced', 11, 'NULL', 3),
('Advanced', 12, 'NULL', 2),
('Intermediate', 13, 'NULL', 3),
('Beginner', 14, '2013020208&2012050517', 18),
('Beginner', 15, '2006030305', 18),
('Beginner', 16, '1999030310', 17),
('Beginner', 17, '2013020208&2013020214', 17);

INSERT INTO student_payment (id,applied_discount, lesson_skill_level, student_id, type_of_lesson_attended) 
OVERRIDING SYSTEM VALUE
values
('1','', 'Intermediate', 1, 'individual_lesson'),
('2','', 'Advanced', 2, 'individual_lesson'),
('3','5%', 'Advanced', 3, 'individual_lesson'),
('4','', 'Intermediate', 4, 'individual_lesson'),
('5','5%', 'Beginner', 5, 'group_lesson'),
('6','', 'Beginner', 6, 'group_lesson'),
('7','', 'Advanced', 7, 'Ensemble'),
('8','5%', 'Advanced', 8, 'Ensemble'),
('9','', 'Advanced', 9, 'Ensemble'),
('10','', 'Intermediate', 10, 'Ensemble'),
('11','5%', 'Beginner', 11, 'group_lesson'),
('12','5%', 'Beginner', 12, 'group_lesson'),
('13','5%', 'Beginner', 13, 'group_lesson'),
('14','', 'Beginner', 14, 'group_lesson');


INSERT INTO "instructor" ("id", "instrument_arsenal") 
VALUES
    ('1','Piano ', 'Keyboard', 'Organ'),
    ('2','Violin', 'Harp ', 'Flute'),
    ('3','Guitar', 'Bass', 'Drums');

INSERT INTO instructor_payment (instructor_id, amount_of_lessons) VALUES
    (1, 10),
    (2, 15),
    (3, 20);

INSERT INTO instrument_stock (instrument_quantity, instrument) 
VALUES 
    (10, 'Guitar'),
    (5, 'Drums'),
    (7, 'Piano');

INSERT INTO instrument_rented (price, amount,student_payment_id,instrument_stock_id,renting_date) 
OVERRIDING SYSTEM VALUE
VALUES 
(100, 1, 1, 1, '2023-04-19'),
(50, 2, 2, 2, '2023-04-20'),
(100, 1, 3, 3, '2023-04-18'),
(500, 1, 4, 2, '2023-04-17');

INSERT INTO lesson (instrument_type, genre, date_and_time, price, instructor_id, skill_level) 
VALUES 
    ('Guitar', 'Individual lesson', '2023-02-07 12:00:00', 100, 1, Intermediate),
    ('Piano', 'Ensemble', '2023-05-05 10:00:00', 50, 2, Beginner, NULL),
    ('Violin', 'Individual lesson', '2023-09-01 11:00:00', 100, 2, Intermediate),
    ('Violin', 'Individual lesson', '2023-12-01 11:00:00', 100, 2, Intermediate),
    ('Violin', 'Ensemble', '2023-03-07 09:00:00', 50, 3, NULL),
    ('Bass', 'Group lesson','2023-11-08 11:00:00', 75, 3, Beginner),
    ('Bass', 'Individual lesson','2023-05-06 11:00:00', 100, 3, Advanced);

INSERT INTO individual_lesson (id,lesson_id)
OVERRIDING SYSTEM VALUE
VALUES (1,1),
(2,19),
(3,20),
(4,21);


INSERT INTO group_lesson (lesson_id, minimum_place_limit)
OVERRIDING SYSTEM VALUE
VALUES (18, '3 students'),
(17, '5 students');

INSERT INTO ensembles (lesson_id, maximum_number_of_students, minimum_number_of_students, genre)
OVERRIDING SYSTEM VALUE
VALUES (3, 20, 2, 'Jazz');
INSERT INTO ensembles (lesson_id, maximum_number_of_students, minimum_number_of_students, genre)
OVERRIDING SYSTEM VALUE
VALUES (2, 30, 3, 'Rock');