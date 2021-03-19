USE mydb; 
DROP procedure IF EXISTS `addActivitiesToVolunteer`;

DELIMITER //
CREATE PROCEDURE addActivitiesToVolunteer()
	BEGIN
		-- Take an volunteer that is present in a particular worksite
        -- Take an activity from this particular worksite
        -- Insert in many to many table relation-ship and raise the level skill of the volunteer.
        INSERT INTO skill_level(level, volunteer_id, activity_id) VALUES (1, 
		(SELECT volunteer_id FROM request_subscription WHERE worksite_id = 1),
        (SELECT id FROM activity WHERE activity.id = 5)
		);
        
	END//
DELIMITER ;