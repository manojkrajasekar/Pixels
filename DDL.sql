/* This creates the database, that stores all the data of the application */
CREATE DATABASE photoapp;

/*This is to use the photoapp database*/
USE photoapp;

/*Creates the user table, with 3 columns */
CREATE TABLE USER(MAIL_ID VARCHAR(320) NOT NULL PRIMARY KEY, FIRST_NAME VARCHAR(20), LAST_NAME VARCHAR(20));

/*Creates the post table, which holds all the information about the post*/
CREATE TABLE POST(POST_ID INTEGER NOT NULL PRIMARY KEY, MAIL_ID VARCHAR(320), TOPIC_ID INTEGER, URL VARCHAR(100), DESCRIPTION VARCHAR(100));

/*This query adds foreign key references for the MAILID*/
ALTER TABLE POST ADD FOREIGN KEY(MAIL_ID) REFERENCES USER(MAIL_ID);

/*Creates the votes table*/
CREATE TABLE VOTES(POST_ID INTEGER, VOTECOUNT INTEGER);

/* Adds the Foreign key constraints*/
ALTER TABLE VOTES ADD FOREIGN KEY(POST_ID) REFERENCES POST(POST_ID);

/*Creates the 'topic' table*/
CREATE TABLE TOPIC(TOPIC_ID INTEGER NOT NULL PRIMARY KEY, MAIL_ID VARCHAR(320), TITLE VARCHAR(50));

/*Adding the foreign key constraints*/
ALTER TABLE POST ADD FOREIGN KEY(TOPIC_ID) REFERENCES TOPIC(TOPIC_ID);

/* This query creates the table comments*/
CREATE TABLE COMMENTS(POST_ID INTEGER, COMMENTID INTEGER NOT NULL PRIMARY KEY, MAIL_ID VARCHAR(320), CONTENT VARCHAR(100));

/* Adds the Foreign key reference */
ALTER TABLE COMMENTS ADD FOREIGN KEY(POST_ID) REFERENCES POST(POST_ID);