USE photoapp;

DROP PROCEDURE IF EXISTS REGISTER_USER;
/* This is executed, when a new user is added.User details are added to into the user table */
DELIMITER //
CREATE PROCEDURE REGISTER_USER
(
	 IN _MAIL_ID VARCHAR(254),
	 IN _FIRST_NAME VARCHAR(20), 
	 IN _LAST_NAME VARCHAR(20),
	 OUT  _USER_ID INTEGER
)
BEGIN
	INSERT INTO USER(MAIL_ID, FIRST_NAME, LAST_NAME) VALUES(_MAIL_ID, _FIRST_NAME, _LAST_NAME);
	
	SELECT LAST_INSERT_ID() INTO _USER_ID FROM USER U 
		WHERE U.MAIL_ID = _MAIL_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS GET_USER_DETAILS;
/* This stored procedure when executed, displays the user details */
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


DROP PROCEDURE IF EXISTS UPDATE_USER_DETAILS; 
/* This is executed, to display the user's lastname */
DELIMITER //
CREATE PROCEDURE UPDATE_USER_DETAILS
(
	IN _USER_ID VARCHAR(254),
	IN _FIRST_NAME VARCHAR(20), 
	IN _LAST_NAME VARCHAR(20)
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


DROP PROCEDURE IF EXISTS DEACTIVATE_USER;
/* This is executed, to display the user's lastname */
DELIMITER //
CREATE PROCEDURE DEACTIVATE_USER
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





DROP PROCEDURE IF EXISTS ADD_TOPIC;
/* This stored procedure is executed, whenever a topic is posted */
DELIMITER //
CREATE PROCEDURE ADD_TOPIC 
(
	IN _TOPIC_TITLE VARCHAR(100),
	IN _USER_ID INTEGER,
	OUT _TOPIC_ID INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	INSERT INTO TOPIC(TOPIC_TITLE, USER_ID) VALUES(_TOPIC_TITLE, _USER_ID);
	
	SELECT LAST_INSERT_ID() INTO _TOPIC_ID FROM TOPIC T WHERE T.USER_ID = _USER_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS GET_TOPICS;
/* This stored procedure when executed, displays all the topics */
DELIMITER //
CREATE PROCEDURE GET_TOPICS
(
	IN _IS_CURRENT BOOLEAN
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	IF _IS_CURRENT = 1 THEN
		SELECT 
			T.TOPIC_ID,
			T.TOPIC_TITLE, 
			T.USER_ID, 
			T.START_TIME,
			T.END_TIME 
			FROM TOPIC T
		WHERE T.IS_CURRENT = _IS_CURRENT ;
	ELSEIF _IS_CURRENT = 0 THEN
		SELECT 
			T.TOPIC_ID,
			T.TOPIC_TITLE, 
			T.USER_ID, 
			T.START_TIME,
			T.END_TIME
			FROM TOPIC
		ORDER BY START_TIME DESC LIMIT 2;
	END IF;
END;
//
DELIMITER ;


/* This stored procedure is executed, when a photo is posted and the details are stored in the database */
DROP PROCEDURE IF EXISTS add_post;
DELIMITER //
CREATE PROCEDURE add_post
(
	IN _user_id INTEGER,
	IN _topic_id INTEGER,
	IN _url text,
	IN _description VARCHAR(100),
	IN _next_topic VARCHAR(100),
	OUT _post_id INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO post(user_id, topic_id, url, description, next_topic) VALUES(_user_id, _topic_id, _url, _description, _next_topic);
	
	SELECT last_insert_id() INTO _post_id;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS update_post;
/* This stored procedure when executed, the description for the post is updated */
DELIMITER //
CREATE PROCEDURE update_post
(
	IN _post_id INTEGER,
	IN _user_id INTEGER, 
	IN _description VARCHAR(200)
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE post p
		SET description = _description
			WHERE p.post_id = _post_id;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_post;
/* This stored procedure when executed, deactivates the post */
DELIMITER //
CREATE PROCEDURE delete_post
(
	IN _post_id INTEGER,
	IN _user_id INTEGER
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE post p
		SET is_activE = 0
			WHERE p.post_id = _post_id;
END;
//
DELIMITER ;



/* This stored procedure when executed, adds a vote for a particular post */
DROP PROCEDURE IF EXISTS add_vote;
DELIMITER //
CREATE PROCEDURE add_vote
(
	IN _post_id INTEGER,
	OUT _vote_id INTEGER
)
BEGIN
	INSERT INTO votes(post_id) VALUES(_post_id);
	
	SELECT last_insert_id() INTO _vote_id;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS UPDATE_VOTE;
/* This stored procedure when executed, Displays the recently casted votes for a particular post */
DELIMITER //
CREATE PROCEDURE UPDATE_VOTE
(
	IN _VOTE_ID INTEGER,
	IN _POST_ID INTEGER, 
	IN _USER_ID INTEGER
)
BEGIN
	SELECT V.IS_ACTIVE FROM VOTES V WHERE V.VOTE_ID = VOTE_ID; 
	IF V.IS_ACTIVE = 0 THEN
		UPDATE VOTES V
			SET V.IS_ACTIVE = 1
				WHERE V.VOTE_ID = _VOTE_ID;
	ELSE
		UPDATE VOTES V
			SET V.IS_ACTIVE = 0
				WHERE V.VOTE_ID = _VOTE_ID;
	END IF;
END;
//
DELIMITER ;






