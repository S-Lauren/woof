USE mydb; 
DROP procedure IF EXISTS `addActivityToWorksite`;
DELIMITER //
CREATE PROCEDURE addActivityToWorksite(IN hostId INT)

	BEGIN

		DECLARE activityId int; 
        DECLARE worksiteId int; 

		INSERT INTO activity(name) VALUES("Winery"); 
		SET activityId = LAST_INSERT_ID();
        
        INSERT INTO worksite(capacity_max,start_date, end_date, host_id, name ) VALUES(8, CURDATE(),'2021-06-15', hostId, "Château d'Esther"); 
        SET worksiteId = LAST_INSERT_ID();
        
		INSERT INTO worksite_activity (worksite_id, activity_id) VALUES(worksiteId, activityId); 
 
	END//
DELIMITER ;