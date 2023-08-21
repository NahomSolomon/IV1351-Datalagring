INSERT INTO "person" ("id","name","age","adress","person_number","phone_number")
VALUES
    ('1',Jarrod Ryan','40','P.O. Box 873, 496 Phasellus Av.','1983010101','0781351831'),
    ('2','Katell Snider','55','4630 Ligula. Rd.','1968020202','0718721327'),
    ('3','Ryder Vinson','53','P.O. Box 214, 492 Erat, Av.','1970010104','0741835129'),
    ('4','Deacon Rivas','19','6985 Curabitur Street','2003031503','0757388621'),
    ('5','Danielle Cole','10','9973 A Avenue','2013020205','0774848674'),
    ('6','Nadean Offin'	,'15','9 Blackbird Plaza'	,'2008030306', '0781351856'),
    ('7','Dunstan Ewestace'	,'16','83839 Vera Drive','2007030307','0701-591-214'),
    ('8','Jessamyn MacAlinden','17','393 Trailsway Drive','2006030308','0701-591-163'),
    ('9','Bert Kulver','9','6985 Curabitur Street',	'2014020209',	'07692717666'),
    ('10','Méthode Besantie','24','773 Morning Park'	,'1999030310'	,'0781351831'),
    ('11','Erwin Barkess','23','5 Tony Alley','2000101011'	,'07187298789'),
    ('12','Mickie MacKain','22','115 Farragut Park','2001090912','0700005129'),
    ('13','Rockie Burdon','11','4774 Erie Alley','2012050513','0757388621'),
    ('14','Kym Cruikshanks','10','2 Huxley Road','2013020214','079001831'),
    ('15','Libbi DOrsay','20','5', 'Tony Alley','2003031515','071827987'),
    ('16','Dill Pash','10','473 Sloan Place','2013020216','070101529'),
    ('17','Hedwiga	Gilpin','14','33 Bunting Point','2012050517'	'075738891');

INSERT INTO student (skill_level, person_id, lesson_id)
OVERRIDING SYSTEM VALUE 
VALUES 
    ('Intermediate', 4,  1),
    ('Avanced', 6,  20),
    ('Advanced', 8, 21),
    ('Intermediate', 9,  19),
    ('Beginner', 5,  17),
    ('Beginner', 7,  18),
    ('Advanced', 10,  2),
    ('Advanced', 11,  3),
    ('Advanced', 12,  2),
    ('Intermediate', 13,  3),
    ('Beginner', 14,  18),
    ('Beginner', 15,  18),
    ('Beginner', 16, 17),
    ('Beginner', 17, 17);

INSERT INTO sibling (student_id, person_number) 
OVERRIDING SYSTEM VALUE
VALUES
    (5,'2008030306'),
    (13, '1999030310'),
    (12, '2003031503'),
    (3, '2013020214'),
    (3, '2012050517');


INSERT INTO student_payment (id,applied_discount, lesson_skill_level, student_id, type_of_lesson_attended) 
OVERRIDING SYSTEM VALUE
values
    ('1','5%', 'Intermediate', 1, 'individual_lesson'),
    ('2','5%', 'Advanced', 2, 'individual_lesson'),
    ('3','10%', 'Advanced', 3, 'individual_lesson'),
    ('4','', 'Intermediate', 4, 'individual_lesson'),
    ('5','5%', 'Beginner', 5, 'group_lesson'),
    ('6','', 'Beginner', 6, 'group_lesson'),
    ('7','5%', 'Advanced', 7, 'Ensemble'),
    ('8','', 'Advanced', 8, 'Ensemble'),
    ('9','', 'Advanced', 9, 'Ensemble'),
    ('10','', 'Intermediate', 10, 'Ensemble'),
    ('11','10%', 'Beginner', 11, 'group_lesson'),
    ('12','5%', 'Beginner', 12, 'group_lesson'),
    ('13','5%', 'Beginner', 13, 'group_lesson'),
    ('14','10%', 'Beginner', 14, 'group_lesson');


INSERT INTO "instructor" ("id", "instrument_arsenal","person_id") 
VALUES
    ('1','Piano ', 'Keyboard', 'Organ',1),
    ('2','Violin', 'Harp ', 'Flute',2),
    ('3','Guitar', 'Bass', 'Drums',3);

INSERT INTO instructor_payment (instructor_id, amount_of_lessons) VALUES
    (1, 3),
    (2, 2),
    (3, 3);

INSERT INTO instrument_stock (instrument_quantity, instrument) 
VALUES 
    (10, 'Guitar'),
    (5, 'Drums'),
    (7, 'Piano');

INSERT INTO instrument_rented (price, amount,renting_date, student_payment_id, instrument_stock_id) 
OVERRIDING SYSTEM VALUE
VALUES 
    (100, 1, '2023-04-19', 1, 1),
    (50, 2, '2023-04-20', 2, 2'),
    (100, 1, '2023-04-18', 3, 3),
    (500, 1, '2023-04-17', 4, 2);

INSERT INTO lesson (id, instrument_type, genre, date_and_time, price, instructor_id, skill_level) 
VALUES 
    ('1','Guitar', 'Individual lesson', '2023-02-07 12:00:00', 100, 1, Intermediate),
    ('2','Piano', 'Ensemble', '2023-05-05 10:00:00', 50, 2, NULL),
    ('3','Violin', 'Ensemble', '2023-08-27 09:00:00', 50, 3, NULL),
    ('17','Bass', 'Group lesson', '2023-11-08 11:00:00', 75, 3, Beginner),
    ('18','Flute', 'Group lesson', '2023-01-06 14:00:00', 75, 1, Beginner),
    ('19','Violin', 'Individual lesson','2023-09-01 11:00:00', 100, 2, Intermediate),
    ('20','Violin','Individual lesson',	'2023-12-01 11:00:00', 100,	2,	Advanced),
    ('21','Bass', 'Individual lesson','2023-05-06 11:00:00', 100, 3, Advanced);

INSERT INTO individual_lesson (id,lesson_id)
OVERRIDING SYSTEM VALUE
VALUES 
    (1,1),
    (2,19),
    (3,20),
    (4,21);

INSERT INTO group_lesson (lesson_id, minimum_place_limit)
OVERRIDING SYSTEM VALUE
VALUES 
    (18, '3 students'),
    (17, '3 students');

INSERT INTO ensembles (lesson_id, maximum_number_of_students, minimum_number_of_students, genre)
OVERRIDING SYSTEM VALUE
VALUES
    (2, 30, 2, 'Rock');
    (3, 20, 2, 'Jazz');