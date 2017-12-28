USE photoapp;

/*This is executed, when a new user is added.User details are added to into the user table*/
DELIMITER //
CREATE PROCEDURE Register_user
(IN MAIL_ID VARCHAR(320), IN FIRST_NAME VARCHAR(20), IN LAST_NAME VARCHAR(20))
BEGIN
	INSERT INTO USER VALUES(MAIL_ID, FIRST_NAME, LAST_NAME);
END;
//
DELIMITER ;


/*This is executed, to display the user's details*/
DELIMITER //
CREATE PROCEDURE Get_userdetails
(IN MAIL_ID varchar(320))
BEGIN
	SELECT MAIL_ID, FIRST_NAME, LAST_NAME FROM USER
    WHERE MAIL_ID = MAIL_ID;
END;
//
DELIMITER ;


/* This stored procedure is executed, when a photo is posted and the details are stored in the database*/
DELIMITER //
CREATE PROCEDURE Insert_postdetails 
(POST_ID INTEGER, MAIL_ID INTEGER, TOPIC_ID INTEGER, URL VARCHAR(320), DESCRIPTION VARCHAR(100))
BEGIN
	INSERT INTO POST VALUES(POST_ID, MAIL_ID, TOPIC_ID, URL, DESCRIPTION);
END;
//
DELIMITER ;


/* This stored procedure is executed, and it displays all the posts*/
DELIMITER //
CREATE PROCEDURE Display_posts
(IN MAIL_ID VARCHAR(320))
BEGIN
 SELECT TOPIC_ID, URL FROM POST P JOIN VOTES V ON P.POST_ID = V.POST_ID WHERE MAIL_ID = MAIL_ID;
END;
//
DELIMITER ;


/* This stored procedure is executed, whenever a topic is posted*/
DELIMITER //
CREATE PROCEDURE Add_topic 
(TOPIC_ID INTEGER, MAIL_ID VARCHAR(320), TITLE VARCHAR(20))
BEGIN
	INSERT INTO TOPIC VALUES(TOPIC_ID, MAIL_ID, TITLE);
END;
//
DELIMITER ;


/* This stored procedure is executed, whenever a comment is added to a post, and the comment is saved in the comments table */
DELIMITER //
CREATE PROCEDURE Add_comment
(POST_ID INTEGER, COMMENT_ID INTEGER, MAIL_ID VARCHAR(320), CONTENT VARCHAR(100))
BEGIN
	INSERT INTO COMMENTS VALUES(POST_ID, COMMENT_ID, MAIL_ID, CONTENT);
END;
//
DELIMITER ;


