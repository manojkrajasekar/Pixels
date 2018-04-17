USE pixels;		
		
 /* This is executed, when a new user is added. User details are stored in the USER table */		
 /* QUESTION: What if any one (or) all the input parameters are null ? */		
 DROP PROCEDURE IF EXISTS register_user;		
 DELIMITER		
     //		
 CREATE PROCEDURE register_user		
 (		
     IN _mail_id VARCHAR(254),		
     IN _first_name VARCHAR(50),		
     IN _last_name VARCHAR(50),		
     OUT _user_id INTEGER		
 )		
 BEGIN		
     INSERT INTO users		
     (		
         mail_id,		
         first_name,		
         last_name		
     )		
     VALUES		
     (		
         _mail_id,		
         _first_name,		
         _last_name		
     ) ;		
     SELECT LAST_INSERT_ID() INTO _user_id;		
 		
 END ; //		
 DELIMITER ;		
 		
 /* ----------------------------------------------------------------------------------------- */		
 		
 /* This stored procedure when executed, displays the user's details based on the given user_id */		
 /* QUESTION: What if the user_id is null ? */		
 DROP PROCEDURE IF EXISTS get_user_details;		
 DELIMITER		
 	//		
 CREATE PROCEDURE get_user_details		
 (		
 	IN _user_id INTEGER		
 )		
 BEGIN		
 	SELECT		
 			u.mail_id AS 'mail_id',		
 			u.first_name AS 'first_name', 		
 			u.last_name AS 'last_name',
            COUNT(DISTINCT p.post_id) AS 'no_of_posts'
 		FROM users u
        INNER JOIN posts p
        	ON u.user_id = p.user_id
                AND p.user_id = _user_id 		
                AND u.is_active = 1;
END ; //		
DELIMITER ;		
 		
 		
 /* ------------------------------------------------------------------------ */		
 		
 /* Updates the user's firstname and lastname */		
 /* QUESTION: What if any one (or) all the input parameters are null ? */		
 DROP PROCEDURE IF EXISTS update_user_details;		
 DELIMITER		
 	//		
 CREATE PROCEDURE update_user_details		
 (		
     IN _user_id INT,		
     IN _first_name VARCHAR(50),		
     IN _last_name VARCHAR(50),
     IN _mail_id VARCHAR(320)	
 )		
 BEGIN		
     UPDATE users u		
 		SET		
 			u.first_name = _first_name,		
 			u.last_name = _last_name,
            u.mail_id = _mail_id		
 		WHERE u.user_id = _user_id 		
 			AND u.is_active = 1;		
 END ; //		
 DELIMITER ;		
 		
 /* --------------------------------------------------------------------------------------- */		
 		
 		
 /* This when executed, toggles the is_active value of the user based on it's current value */		
 /* QUESTION: What if the user_id is null ? */		
 DROP PROCEDURE IF EXISTS toggle_user;		
 DELIMITER //		
 CREATE PROCEDURE toggle_user		
 (		
 	IN _user_id INTEGER		
 )		
 BEGIN		
 	UPDATE users u		
 		SET		
 			u.is_active = NOT u.is_active		
 		WHERE u.user_id = _user_id;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 