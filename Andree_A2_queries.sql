/* Question 1 */
USE ischool_v2;
SELECT CONCAT(c.course_code,c.course_number) AS 'course_name', section_number,
	CONCAT(semester,' ', year) AS 'semester', course_description, delivery_type
    FROM courses c 
			JOIN course_sections c1 
				ON c.course_id = c1.course_id
            JOIN delivery d
				ON d.delivery_id = c1.delivery_id
                WHERE d.delivery_id = 1
UNION 
SELECT CONCAT(c.course_code,c.course_number) AS 'course_name', section_number,
	CONCAT(semester,' ', year) AS 'semester', course_description, 'Hybrid/Online' AS delivery_type
    FROM courses c 
			JOIN course_sections c1 
				ON c.course_id = c1.course_id
            JOIN delivery d
				ON d.delivery_id = c1.delivery_id
			WHERE d.delivery_id = 2 OR d.delivery_id = 3
			ORDER BY course_name;
                
/* Question 2*/
USE ischool_v2;
SELECT CONCAT(p.fname, ' ', p.lname) AS 'name', race, pronoun
    FROM people p
	LEFT JOIN person_race pr
		USING(person_id)
	LEFT JOIN race 
		USING(race_id)
	JOIN person_pronoun pp
		USING(person_id)
	JOIN pronouns 
		USING(pronoun_id)
	ORDER BY name;