USE mydb; 
DROP procedure IF EXISTS `updateWorksiteCapacity`;

SET SQL_SAFE_UPDATES = 0;
DELIMITER //
CREATE PROCEDURE updateWorksiteCapacity()

	BEGIN 
		UPDATE worksite set capacity_max = 4  WHERE id % 2 = 0;
	END//
   
DELIMITER ;