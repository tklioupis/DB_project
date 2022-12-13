#Create user admin_auth_erasmus_office with passwrod supperpass as the admin of the database with all the privilages 
#only when he is connetcted to the database locally
CREATE USER 'admin_auth_erasmus_office'@'localhost' IDENTIFIED BY 'superpass'; 
GRANT ALL PRIVILEGES ON erasmusdb.* TO 'admin'@'localhost';

#CREATE TEMPORARY TABLE A
#SELECT*
#FROM learning_agreements JOIN students ON students_id = id
#WHERE email = 

# Create user student
CREATE USER 'student'@'%' IDENTIFIED BY 'mypassword';
GRANT SELECT ON applications.*  TO 'student'@'%';
GRANT SELECT, INSERT, UPDATE ON learning_agreements.*  TO 'student'@'%';
GRANT SELECT ON subjects.*  TO 'student'@'%';
GRANT SELECT ON ects_auth_coordinators.*  TO 'student'@'%';
GRANT SELECT ON erasmus_offices.*  TO 'student'@'%';
GRANT SELECT ON accommodation.*  TO 'student'@'%';



