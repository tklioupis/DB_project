DROP TEMPORARY TABLE IF EXISTS `A`;

CREATE TEMPORARY TABLE A 
SELECT Learning_Agreements_la_no AS la_no, subjects.subject_code AS subject_code, ECTS 
FROM learning_agreements_has_subjects JOIN subjects ON Subjects_subject_code = subjects.subject_code AND Subjects_field_of_study = subjects.field_of_study AND Subjects_erasmus_code = subjects.erasmus_code
WHERE Learning_Agreements_la_no = 1685135;

SELECT la_no, SUM(ECTS) AS total_ects
FROM A
GROUP BY la_no;

DROP TEMPORARY TABLE `A`;