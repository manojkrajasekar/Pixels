DROP PROCEDURE IF EXISTS ADD_POST;
/* This stored procedure is executed, when a photo is posted and the details are stored in the database */
DELIMITER //
CREATE PROCEDURE ADD_POST
(
	IN _USER_ID INTEGER,
	IN _TOPIC_ID INTEGER,
	IN _URL VARCHAR(254),
	IN _DESCRIPTION VARCHAR(100),
	IN _NEXT_TOPIC VARCHAR(100),
	OUT _POST_ID INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO POST(USER_ID, TOPIC_ID, URL, DESCRIPTION, NEXT_TOPIC) VALUES(_USER_ID, _TOPIC_ID, _URL, _DESCRIPTION, _NEXT_TOPIC);
	
	SELECT P.POST_ID FROM POST P;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS UPDATE_POST;
/* This stored procedure when executed, the description for the post is updated */
DELIMITER //
CREATE PROCEDURE UPDATE_POST
(
	IN _POST_ID INTEGER,
	IN _USER_ID INTEGER, 
	IN _DESCRIPTION VARCHAR(100)
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE POST P
		SET DESCRIPTION = _DESCRIPTION
			WHERE P.POST_ID = _POST_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS DELETE_POST;
/* This stored procedure when executed, deactivates the post */
DELIMITER //
CREATE PROCEDURE DELETE_POST
(
	IN _POST_ID INTEGER,
	IN _USER_ID INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE POST P
		SET IS_ACTIVE = 0
			WHERE P.POST_ID = _POST_ID;
END;
//
DELIMITER ;
