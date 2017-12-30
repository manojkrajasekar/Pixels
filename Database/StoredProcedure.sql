USE photoapp;

DROP PROCEDURE IF EXISTS Register_user;
/*This is executed, when a new user is added.User details are added to into the user table*/
DELIMITER //
CREATE PROCEDURE Register_user
(USER_ID INTEGER, MAIL_ID VARCHAR(254), FIRST_NAME VARCHAR(20), LAST_NAME VARCHAR(20), NOOFPOSTS INTEGER, IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO USER VALUES(USER_ID, MAIL_ID, FIRST_NAME, LAST_NAME, NOOFPOSTS, IS_ACTIVE);
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Get_userdetails;
/*This is executed, to display the user's details*/
DELIMITER //
CREATE PROCEDURE Get_userdetails
(MAIL_ID varchar(254))
BEGIN
	SELECT MAIL_ID, FIRST_NAME, LAST_NAME, NOOFPOSTS FROM USER U
    WHERE U.MAIL_ID = MAIL_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Update_firstname;
/*This is executed, to update the user's firstname*/
DELIMITER //
CREATE PROCEDURE Update_firstname
(USER_ID INTEGER, FIRST_NAME varchar(20))
BEGIN
	UPDATE USER U
		SET FIRST_NAME = FIRST_NAME
		WHERE U.USER_ID = USER_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Update_lastname; 
/*This is executed, to display the user's lastname*/
DELIMITER //
CREATE PROCEDURE Update_lastname
(USER_ID INTEGER, LAST_NAME varchar(20))
BEGIN
	UPDATE USER U
		SET LAST_NAME = LAST_NAME
		WHERE U.USER_ID = USER_ID;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Deactivate_user;
/*This is executed, to display the user's lastname*/
DELIMITER //
CREATE PROCEDURE Deactivate_user
(USER_ID INTEGER, IS_ACTIVE BOOLEAN)
BEGIN
	UPDATE USER U
		SET IS_ACTIVE = IS_ACTIVE
		WHERE U.USER_ID = USER_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Insert_postdetails;
/*This stored procedure is executed, when a photo is posted and the details are stored in the database*/
DELIMITER //
CREATE PROCEDURE Insert_postdetails 
(POST_ID INTEGER, USER_ID INTEGER, TOPIC_ID INTEGER, URL VARCHAR(254), DESCRIPTION VARCHAR(100),IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO POST VALUES(POST_ID, USER_ID, TOPIC_ID, URL, DESCRIPTION, IS_ACTIVE);
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Update_topic_url;
/*This stored procedure when executed, the URL for the post is updated*/
DELIMITER //
CREATE PROCEDURE Update_topic_url 
(POST_ID INTEGER, USER_ID INTEGER, URL VARCHAR(20), IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	IF(IS_ACTIVE = 0) THEN
	UPDATE POST P
		SET URL = URL
		WHERE P.POST_ID = P.POST_ID;
	END IF;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Update_description;
/*This stored procedure when executed, the description for the post is updated*/
DELIMITER //
CREATE PROCEDURE Update_description
(POST_ID INTEGER, USER_ID INTEGER, DESCRIPTION VARCHAR(100))
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE POST P
		SET DESCRIPTION = DESCRIPTION
		WHERE P.POST_ID = P.POST_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Activate_post;
/*This stored procedure when executed, activates the post */
DELIMITER //
CREATE PROCEDURE Activate_post
(IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE POST P
		SET IS_ACTIVE = 1
		WHERE P.POST_ID = P.POST_ID;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Deactivate_post;
/*This stored procedure when executed, deactivates the post */
DELIMITER //
CREATE PROCEDURE Deactivate_post
(IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE POST P
		SET IS_ACTIVE = 0
		WHERE P.POST_ID = P.POST_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Display_posts;
/*This stored procedure is executed, and it displays all the posts*/
DELIMITER //
CREATE PROCEDURE Display_posts
(USER_ID INTEGER, TOPIC_ID INTEGER)
BEGIN
	SELECT POST_ID, DESCRIPTION, URL FROM POST P JOIN TOPIC T ON P.TOPIC_ID = T.TOPIC_ID WHERE T.IS_ACTIVE = 1;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Add_topic;
/*This stored procedure is executed, whenever a topic is posted*/
DELIMITER //
CREATE PROCEDURE Add_topic 
(TOPIC_ID INTEGER, USER_ID INTEGER,  TITLE VARCHAR(20), IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	INSERT INTO TOPIC VALUES(TOPIC_ID, USER_ID, TITLE, IS_ACTIVE);
END;
//
DELIMITER ;




DROP PROCEDURE IF EXISTS Update_topic;
/*This stored procedure when executed, updates the title of the topic already posted*/
DELIMITER //
CREATE PROCEDURE Update_topic 
(TOPIC_ID INTEGER, USER_ID INTEGER, TITLE VARCHAR(20), IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	IF(IS_ACTIVE = 0) THEN
	UPDATE TOPIC T
		SET TITLE = TITLE
		WHERE T.USER_ID = USER_ID;
	END IF;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Activate_topic;
/*This stored procedure when executed, activates the topic making it current topic*/
DELIMITER //
CREATE PROCEDURE Activate_topic 
(TOPIC_IS INTEGER, USER_ID INTEGER, IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE TOPIC T
		SET IS_ACTIVE = 1
		WHERE T.USER_ID = USER_ID AND T.TOPIC_ID = TOPIC_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Deactivate_topic;
/*This stored procedure when executed, activates the topic making it current topic*/
DELIMITER //
CREATE PROCEDURE Deactivate_topic 
(TOPIC_IS INTEGER, USER_ID INTEGER, IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	UPDATE TOPIC T
		SET IS_ACTIVE = 0
		WHERE T.USER_ID = USER_ID AND T.TOPIC_ID = TOPIC_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Display_topic;
/*This stored procedure when executed, displays all the topics */
DELIMITER //
CREATE PROCEDURE Display_topic 
(TOPIC_IS INTEGER, USER_ID INTEGER, IS_ACTIVE BOOLEAN)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	SELECT TOPIC_ID, TITLE, USER_ID FROM TOPIC;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS getcurrenttopic;
/*This stored procedure when executed, displays all the topics */
DELIMITER //
CREATE PROCEDURE getcurrenttopic 
(TOPIC_IS INTEGER, USER_ID INTEGER)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	SELECT TITLE FROM TOPIC WHERE IS_ACTIVE = 1;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS getprevioustopic;
/*This stored procedure when executed, displays all the topics */
DELIMITER //
CREATE PROCEDURE getprevioustopic 
(TOPIC_IS INTEGER, USER_ID INTEGER)
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	SELECT TITLE FROM TOPIC WHERE IS_ACTIVE = 0;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Add_votes;
/*This stored procedure when executed, adds a vote for a particular post*/
DELIMITER //
CREATE PROCEDURE Add_votes
(POST_ID INTEGER, VOTER_MAILID VARCHAR(254),IS_ACTIVE BOOLEAN, VOTETIME TIMESTAMP)
BEGIN
	INSERT INTO VOTES VALUES(POST_ID, VOTER_MAILID, IS_ACTIVE, VOTETIME);
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Display_votes;
/*This stored procedure when executed, Displays the recently casted votes for a particular post */
DELIMITER //
CREATE PROCEDURE Display_votes
(POST_ID INTEGER)
BEGIN
	SELECT VOTER_MAILID FROM VOTES 
		WHERE IS_ACTIVE = 1
		ORDER BY VOTETIME DESC;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Update_votes;
/*This stored procedure when executed, Displays the recently casted votes for a particular post */
DELIMITER //
CREATE PROCEDURE Update_votes
(POST_ID INTEGER, VOTER_MAILID VARCHAR(254))
BEGIN
	UPDATE VOTES V
		SET IS_ACTIVE = 1
		WHERE V.VOTER_MAILID = VOTER_MAILID;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Delete_votes;
/*This stored procedure when executed, Displays the recently casted votes for a particular post */
DELIMITER //
CREATE PROCEDURE Delete_votes
(POST_ID INTEGER, VOTER_MAILID VARCHAR(254))
BEGIN
	UPDATE VOTES V
		SET IS_ACTIVE = 0
		WHERE V.VOTER_MAILID = VOTER_MAILID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Votecount;
/*This stored procedure when executed, displays the votecount for a particular post*/
DELIMITER //
CREATE PROCEDURE Votecount
(POST_ID INTEGER)
BEGIN
	SELECT MAX(VOTECOUNT) FROM VOTES V WHERE V.POST_ID = POST_ID;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Display_comments;
/*This stored procedure when executed, displays all the comments for a particular post*/
DELIMITER //
CREATE PROCEDURE Display_comments 
(USER_ID INTEGER, POST_ID INTEGER)
BEGIN
	SELECT MAIL_ID, CONTENT FROM COMMENTS C WHERE C.POST_ID = POST_ID; 
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS Add_comment;
/*This stored procedure when executed, saves the added comment in the comments table*/
DELIMITER //
CREATE PROCEDURE Add_comment
(POST_ID INTEGER, COMMENT_ID INTEGER, MAIL_ID INTEGER, USER_ID INTEGER, CONTENT VARCHAR(100), ISACTIVE BOOLEAN)
BEGIN
	INSERT INTO COMMENTS VALUES(POST_ID, COMMENT_ID, MAIL_ID, USER_ID, CONTENT, ISACTIVE);
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Edit_comment;
/*This stored procedure when executed, updates the comment*/
DELIMITER //
CREATE PROCEDURE Edit_comment
(POST_ID INTEGER, USER_ID INTEGER, CONTENT VARCHAR(100))
BEGIN
	UPDATE COMMENTS C
		SET CONTENT = CONTENT
		WHERE C.POST_ID = POST_ID;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS Delete_comment;
/*This stored procedure when executed, Deactivates the comment*/
DELIMITER //
CREATE PROCEDURE Delete_comment
(POST_ID INTEGER, COMMENT_ID INTEGER)
BEGIN
	UPDATE COMMENTS C
		SET IS_ACTIVE = 0
		WHERE C.POST_ID = POST_ID;
END;
//
DELIMITER ;





