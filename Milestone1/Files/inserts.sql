
-- Script name: inserts.sql
-- Author:      Yasson Haddish
-- Purpose:     insert sample data to test the integrity of this database system




USE LearningManagementDB;



-- Support insert
-- INSERT INTO support(support_id, support_info) VALUES (1, 'Contact me with 123-00-000'), (2, 'Contact me with 000-00-100'), (3, 'Contact me with 100-20-001');


-- Student insert
INSERT INTO student(student_id, student_name, student_major, course_enrolled, Account_account_id, Account_Parent_parent_id) VALUES (1, 'Yasson', 'CS', 'Summer', 1, 1), (2, 'Nowa', 'CS', 'Summer', 2, 2), (3, 'David', 'CS', 'Summer', 3, 3);

-- Resource insert
INSERT INTO resource(resource_id, resource_name, resource_description) VALUES (1, 'Link', 'Crypto book pdf'), (2, 'Links', 'DB books pdf'), (3, 'Link', 'Network book pdf');


-- Quiz insert
INSERT INTO quiz(quiz_id, quiz_content, quiz_answer) VALUES (1, '2 + 2 = ?', '4'), (2, '2 + 3 = ?', '5'), (3, '3 + 3 = ?', '6');



-- Parent insert
INSERT INTO parent(parent_id, parent_name) VALUES (1, 'Mr. Bob'), (2, 'Mr. Rob'), (3, 'Mr. Charles');


-- Instructor insert
INSERT INTO instructor(instractors_id, Instructor_name, course_teaching, Account_account_id) VALUES (1, 'Jose', '674', 1), (2, 'Robert', '410', 2), (2, 'Soza', '410', 3);


-- Grade insert
INSERT INTO grade(grade_id, grade_result, grade_comment) VALUES (1, 'A', 'Excellent work'), (2, 'B', 'Good JOb'), (3, 'C', 'Not bad');


-- Gender insert
INSERT INTO gender(gender_type, Account_account_id, Account_Parent_parent_id, Account_feedback_feedback_id) VALUES ('M', 1, 1, 1), ('F', 2, 2, 2), ('M', 3, 3, 3);


-- Feedback insert
INSERT INTO feedback(feedback_id, feedback_name, feedback_time, feedback_content) VALUES (1, 'Marry', '2023-04-11 15:20:31', 'you are the best' ), (2, 'Tobby', '2023-03-12 11:10:31', 'best one ever' ), (3, 'John', '2023-04-09 15:20:31', 'I like it' );



-- Discussion insert
INSERT INTO discussion(discussion_id, discussion_name, discussion_datel, discussion_content) VALUES (1, 'new discussion', '2023-04-11', 'I need help with a task'), (2, 'another new discussion', '2023-04-12', 'Group work'), (3, 'final discussion', '2023-05-11', 'Must submit');


-- Contact table inserts
INSERT INTO contact (contact_id, contact_name, contact_info ) VALUES (1, 'Moe', 'email'), (2, 'Joe', 'phone number'), (1, 'Michel', 'info ');


-- Course insert
INSERT INTO course(course_id, course_schedule, course_description, course_name) VALUES (1, '2023-04-11', 'Tuesday', 'DBMS'), (2, '2023-04-01', 'Monday', 'Maths'), (3, '2023-04-11', 'Friday', 'English');


-- Certificate insert 
INSERT INTO certificate(certificate_id, certificate_name, certificate_date, certificate_content) VALUES (1, 'Leo', '2023-04-11', 'Congrats' ), (2, 'Aron', '2023-03-17', 'Congrats'  ), (3, 'Leo', '2021-04-07', 'Congrats'  );


-- Attendance insert
INSERT INTO attendance(attendance_name, attendance_time, attendance_check, Student_student_id, Student_Account_account_id, Student_Account_Parent_parent_id) VALUES ('Mark','2023-04-11 15:20:31', '1', 1, 1, 1  ), ('Lia','2023-05-11 15:20:31', '0', 2, 2, 2  ), ('Robin','2023-04-11 15:20:31', '1', 3, 3, 3  );



-- Assignment insert
INSERT INTO assignment (assignment_id, assignment_name, assignment_description, Assignmentcol, Assignmentcol1) VALUES (1, 'Final exam', 'Due tonight', '2023-04-11 15:20:30', '2023-04-11 15:20:31'), (2, 'Mid -Term', 'Take Home', '2023-03-30 15:12:30', '2023-04-11 15:20:31'), (3, 'Final exam', 'Due tonight', '2023-04-11 15:20:30', '2023-04-11 15:20:31');



-- Annoucement insert
INSERT INTO annoucement (annoucement_id, annoucement_name, annoucement_date, annoucement_content) VALUES (1, 'Harry', '2023-04-11', 'This content part' ), (2, 'Shrake', '2023-04-10', 'This is here' ), (3, 'Noha', '2023-04-09', 'My part' );


-- Insert account insert
INSERT INTO account (account_type, account_id, Parent_parent_id, feedback_feedback_id) VALUES ('Admin', 1, 1, 1), ('Student', 2, 2, 2), ('Parent', 3, 3, 3);

-- Insert a new row into the administrator table
INSERT INTO administrator (administrator_id, administrator_name, Account_account_id, Account_Parent_parent_id) VALUES (1, 'Tom', 1, 1  ), (2, 'Jarry', 2, 2  ), (3, 'Spike', 3, 3 );
