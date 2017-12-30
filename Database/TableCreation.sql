/* This creates the database, that stores all the data of the application */
/* CREATE DATABASE photoapp;

/*This is to use the photoapp database*/
USE 'photoapp';

drop table if exists comments;
drop table if exists votes;
drop table if exists post;
drop table if exists topic;
drop table if exists user;


/*Creates the user table, with 3 columns */
CREATE TABLE USER
(
	USER_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	MAIL_ID VARCHAR(254) UNIQUE, 
	FIRST_NAME VARCHAR(20), 
	LAST_NAME VARCHAR(20),
	NOOFPOSTS INTEGER DEFAULT 0, 
	IS_ACTIVE BOOLEAN DEFAULT 0
);


/*Creates the topic table*/
CREATE TABLE TOPIC
(
	TOPIC_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
	USER_ID INTEGER,
	TITLE VARCHAR(100),
	IS_ACTIVE BOOLEAN DEFAULT 0,
	UPLOADTIME TIMESTAMP,
	FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID)
);


/*Creates the post table, which holds all the information about the post.*/
CREATE TABLE POST
(
	POST_ID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	USER_ID INTEGER,
	TOPIC_ID INTEGER, 
	URL VARCHAR(100), 
	DESCRIPTION VARCHAR(100),
	UPLOADTIME TIMESTAMP,
	IS_ACTIVE BOOLEAN DEFAULT 0,
	FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID)
);


/*Creates the votes table*/
CREATE TABLE VOTES
(
	POST_ID INTEGER AUTO_INCREMENT,
	VOTER_MAILID VARCHAR(254),
	IS_ACTIVE BOOLEAN DEFAULT 0,
	VOTETIME TIMESTAMP,
	FOREIGN KEY(POST_ID) REFERENCES POST(POST_ID)
);


/* This query creates the table comments*/
CREATE TABLE COMMENTS
(
	POST_ID INTEGER,
	COMMENTID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	MAIL_ID VARCHAR(254), 
	USER_ID INTEGER,
	CONTENT VARCHAR(100),
	IS_ACTIVE BOOLEAN DEFAULT 0,
	UPLOADTIME TIMESTAMP,
	FOREIGN KEY(POST_ID) REFERENCES POST(POST_ID)
);

