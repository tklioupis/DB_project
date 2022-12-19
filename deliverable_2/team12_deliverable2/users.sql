#Create user admin_auth_erasmus_office with passwrod supperpass as the admin of the database with all the privileges 
#only when he is connetcted to the database locally
DROP USER IF EXISTS 'admin_auth_erasmus_office'@'localhost';
CREATE USER 'admin_auth_erasmus_office'@'localhost' IDENTIFIED BY 'superpass'; 
GRANT ALL PRIVILEGES ON erasmusdb.* TO 'admin_auth_erasmus_office'@'localhost';

#Create Role student with privileges to see applications, to see, insert and modify Learning Agreement
#to see the subjects, auth_ects_coordinators, erasmus_offices, accommodation
#access only remotely
DROP ROLE IF EXISTS 'student';
CREATE ROLE 'student';
GRANT SELECT ON erasmusdb.applications TO 'student';
GRANT SELECT, INSERT, UPDATE, DELETE ON erasmusdb.learning_agreements TO 'student';
GRANT SELECT ON erasmusdb.subjects TO 'student';
GRANT SELECT ON erasmusdb.auth_ects_coordinators TO 'student';
GRANT SELECT ON erasmusdb.erasmus_offices TO 'student';
GRANT SELECT ON erasmusdb.accommodation TO 'student';

#Create users with role student
DROP USER IF EXISTS 'zenia_stv'@'%';
CREATE USER 'zenia_stv'@'%' IDENTIFIED BY 'team12_zenia'; 
GRANT 'student' TO 'zenia_stv'@'%';
DROP USER IF EXISTS 'd.rousis'@'%';
CREATE USER 'd.rousis'@'%' IDENTIFIED BY 'team12_rousis'; 
GRANT 'student' TO 'd.rousis'@'%';
DROP USER IF EXISTS 'theo.lioupis'@'localhost';
CREATE USER 'theo.lioupis'@'localhost' IDENTIFIED BY 'team12_theo'; 
GRANT 'student' TO 'theo.lioupis'@'localhost';

#Create Role auth_ects_coordinatior with privileges to see and update Learning Agreement, see the subjects and students remotely
DROP ROLE IF EXISTS 'auth_ects_coordinator';
CREATE ROLE 'auth_ects_coordinator';
GRANT SELECT, UPDATE ON erasmusdb.learning_agreements TO 'auth_ects_coordinator';
GRANT SELECT ON erasmusdb.subjects TO 'auth_ects_coordinator';
GRANT SELECT ON erasmusdb.students TO 'auth_ects_coordinator';

#Create user with role auth_ects_coordinatior
DROP USER IF EXISTS 'hatzo'@'%';
CREATE USER 'hatzo'@'%' IDENTIFIED BY 'alkis_electronics'; 
GRANT 'auth_ects_coordinator' TO 'hatzo'@'%';

#Create Role staff_erasmus_office with privileges to see and update Learning Agreement and see auth_ects_coordinators remotely
DROP ROLE IF EXISTS 'staff_erasmus_office';
CREATE ROLE 'staff_erasmus_office';
GRANT SELECT, UPDATE ON erasmusdb.learning_agreements TO 'staff_erasmus_office';
GRANT SELECT ON erasmusdb.auth_ects_coordinators TO 'staff_erasmus_office';

#Create user with role staff_erasmus_office
DROP USER IF EXISTS 'carla_ester'@'%';
CREATE USER 'carla_ester'@'%' IDENTIFIED BY 'madrid_uc3m_carla'; 
GRANT 'staff_erasmus_office' TO 'carla_ester'@'%';





