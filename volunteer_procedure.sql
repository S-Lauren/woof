USE mydb; 
DROP procedure IF EXISTS `addVolunteerToWorksite`;
DELIMITER //
CREATE PROCEDURE addVolunteerToWorksite(IN userAccount INT, IN hostId INT)

	BEGIN

		DECLARE volunteerId int; 
        DECLARE worksiteId int; 

		INSERT INTO volunteer(user_account_id, name ) VALUES(userAccount, "Kevin"); 
		SET volunteerId = LAST_INSERT_ID();
        
        INSERT INTO worksite(capacity_max,start_date, end_date, host_id, name ) VALUES(2, CURDATE(),'2021-04-25', hostId, "La Bruyère"  ); 
        SET worksiteId = LAST_INSERT_ID();
        
		INSERT INTO request_subscription (volunteer_id, worksite_id, presence) VALUES(volunteerId, worksiteId, true); 
 
	END//
DELIMITER ;