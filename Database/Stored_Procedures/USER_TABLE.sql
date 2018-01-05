USE photoapp;

/* This is executed, when a new user is added. User details are stored in the USER table */
DROP PROCEDURE IF EXISTS REGISTER_USER;
DELIMITER //
CREATE PROCEDURE REGISTER_USER
(
	 IN _MAIL_ID VARCHAR(254),
	 IN _FIRST_NAME VARCHAR(50), 
	 IN _LAST_NAME VARCHAR(50),
	 OUT  _USER_ID INTEGER
)
BEGIN
	INSERT INTO USER(MAIL_ID, FIRST_NAME, LAST_NAME) VALUES(_MAIL_ID, _FIRST_NAME, _LAST_NAME);
	
	SELECT LAST_INSERT_ID() 
		INTO _USER_ID 
			FROM USER U 
	WHERE U.MAIL_ID = _MAIL_ID;
END;
//
DELIMITER ;

/* ------------------------------------------------------------------------------------------ */

/* This stored procedure when executed, displays the user's details based on the passed USER_ID */
DROP PROCEDURE IF EXISTS GET_USER_DETAILS;
DELIMITER //
CREATE PROCEDURE GET_USER_DETAILS
(
	IN _USER_ID INTEGER
)
BEGIN
	SELECT
		U.MAIL_ID,
		U.FIRST_NAME, 
		U.LAST_NAME,
		U.NO_OF_POSTS
			FROM USER U
	WHERE U.USER_ID = _USER_ID;
END;
//
DELIMITER ;


/* ------------------------------------------------------------------------------------------ */

/* Updates the user's firstname or lastname, or both */
DROP PROCEDURE IF EXISTS UPDATE_USER_DETAILS; 
DELIMITER //
CREATE PROCEDURE UPDATE_USER_DETAILS
(
	IN _USER_ID VARCHAR(254),
	IN _FIRST_NAME VARCHAR(50), 
	IN _LAST_NAME VARCHAR(50)
)
BEGIN
	UPDATE USER U
		SET 
			U.FIRST_NAME = _FIRST_NAME,
			U.LAST_NAME = _LAST_NAME
		WHERE U.USER_ID = _USER_ID;
END;
//
DELIMITER ;


/* ------------------------------------------------------------------------------------------ */


/* This when executed, toggles the IS_ACTIVE value of the user based on it's current value */
DROP PROCEDURE IF EXISTS TOGGLE_USER;
DELIMITER //
CREATE PROCEDURE TOGGLE_USER
(
	IN _USER_ID INTEGER
)
BEGIN
	DECLARE ACTIVE BOOLEAN;
	
	SELECT IS_ACTIVE INTO ACTIVE
		FROM USER U
	WHERE U.USER_ID = _USER_ID;
	
	IF ACTIVE = 0 THEN
		UPDATE USER U
			SET
				U.IS_ACTIVE = 1
			WHERE U.USER_ID = _USER_ID;
	ELSEIF ACTIVE = 1 THEN
		UPDATE USER U
			SET
				U.IS_ACTIVE = 0
			WHERE U.USER_ID = _USER_ID;
	END IF;
END;
//
DELIMITER ;

