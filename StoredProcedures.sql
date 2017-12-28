USE photoapp;

/*This is executed, when a new user is added.User details are added to into the user table*/
DELIMITER //
CREATE PROCEDURE Register_user
(IN MAIL_ID VARCHAR(320), IN FIRST_NAME VARCHAR(20), IN LAST_NAME VARCHAR(20))
BEGIN
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO USER VALUES(MAIL_ID, FIRST_NAME, LAST_NAME);
END;
//
DELIMITER ;


/*This is executed, to display the user's details*/
DELIMITER //
CREATE PROCEDURE Get_userdetails
(MAIL_ID varchar(320))
BEGIN
	SELECT MAIL_ID, FIRST_NAME, LAST_NAME FROM USER U
    WHERE U.MAIL_ID = MAIL_ID;
END;
//
DELIMITER ;


/*This stored procedure is executed, when a photo is posted and the details are stored in the database*/
DELIMITER //
CREATE PROCEDURE Insert_postdetails 
(POST_ID INTEGER, MAIL_ID VARCHAR(320), TOPIC_ID INTEGER, URL VARCHAR(320), DESCRIPTION VARCHAR(100))
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	DECLARE EXIT HANDLER FOR 1062
	SELECT 'MySQL error 1062: Duplicate ket entry for primary key';
	
	INSERT INTO POST VALUES(POST_ID, MAIL_ID, TOPIC_ID, URL, DESCRIPTION);
END;
//
DELIMITER ;


/*This stored procedure is executed, and it displays all the posts*/
DELIMITER //
CREATE PROCEDURE Display_posts
(MAIL_ID VARCHAR(320))
BEGIN
	SELECT TOPIC_ID, URL, VOTECOUNT FROM POST P JOIN VOTES V ON P.POST_ID = V.POST_ID WHERE P.MAIL_ID = MAIL_ID;
END;
//
DELIMITER ;


/*This stored procedure is executed, whenever a topic is posted*/
DELIMITER //
CREATE PROCEDURE Add_topic 
(TOPIC_ID INTEGER, MAIL_ID VARCHAR(320), TITLE VARCHAR(20))
BEGIN
	DECLARE EXIT HANDLER FOR 1452
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails';
	
	INSERT INTO TOPIC VALUES(TOPIC_ID, MAIL_ID, TITLE);
END;
//
DELIMITER ;


/*This stored procedure when executed, saves the added comment int the comments table.*/
DELIMITER //
CREATE PROCEDURE Add_comment
(POST_ID INTEGER, COMMENT_ID INTEGER, MAIL_ID VARCHAR(320), CONTENT VARCHAR(100))
BEGIN
	INSERT INTO COMMENTS VALUES(POST_ID, COMMENT_ID, MAIL_ID, CONTENT);
END;
//
DELIMITER ;

/*This stored procedure when executed, displays the votecount for a particular post*/
DELIMITER //
CREATE PROCEDURE Display_votes(POST_ID INTEGER)
BEGIN
	SELECT MAX(VOTECOUNT) FROM VOTES V WHERE V.POST_ID = POST_ID;
END;
//
DELIMITER ;


/*This stored procedure when executed, displays all the comments for a particular post*/
DELIMITER //
CREATE PROCEDURE `Display_comments` (POST_ID INTEGER)
BEGIN
	SELECT MAIL_ID, CONTENT FROM COMMENTS C WHERE C.POST_ID = POST_ID; 
END;
//
DELIMITER ;



