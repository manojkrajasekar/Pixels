USE photoapp;		
		
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
 			u.mail_id AS 'Mail ID',		
 			u.first_name AS 'First Name', 		
 			u.last_name AS 'Last Name',		
 			u.no_of_posts AS 'Total Number of posts'		
 		FROM users u		
 		WHERE u.user_id = _user_id 		
 			AND u.is_active = 1;		
 END;		
 //		
 DELIMITER ;		
 		
 		
 /* ------------------------------------------------------------------------ */		
 		
 /* Updates the user's firstname and lastname */		
 /* QUESTION: What if any one (or) all the input parameters are null ? */		
 DROP PROCEDURE IF EXISTS update_user_details;		
 DELIMITER		
 	//		
 CREATE PROCEDURE update_user_details		
 (		
     IN _user_id VARCHAR(254),		
     IN _first_name VARCHAR(50),		
     IN _last_name VARCHAR(50)		
 )		
 BEGIN		
     UPDATE users u		
 		SET		
 			u.first_name = _first_name,		
 			u.last_name = _last_name		
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
 		
 		
 /* Gets the initial information of the logged in user and the current topic */		
 /* QUESTION: What if the logged_in_user_id is null ? */		
 DROP PROCEDURE IF EXISTS get_initial_info;		
 DELIMITER //		
 CREATE PROCEDURE get_initial_info		
 (		
 	IN logged_in_user_id INTEGER 		
 )		
 BEGIN		
 	SELECT  first_name AS 'user', last_name AS 'Last Name', mail_id AS 'email', no_of_posts AS 'no_of_posts' from users WHERE user_id = logged_in_user_id AND users.is_active = 1		
 	UNION		
 	SELECT  topic_title AS 'current topic', null, null, null from topics WHERE topics.is_current = 1;		
 END;		
 //		
 DELIMITER ;		
 