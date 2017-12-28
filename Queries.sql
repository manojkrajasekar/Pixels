USER TABLE



CREATE TABLE USER(MAILID VARCHAR(320) NOT NULL PRIMARY KEY, FIRSTNAME VARCHAR(10), LASTNAME VARCHAR(20), NOOFPOSTS VARCHAR(10));



STORED PROCEDURES

//This Stored procedure is executed and it displays all the user details based on the given MAILID.
USE `photoapp`;
DROP procedure IF EXISTS `insertdetails`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `getuserdetails`(IN Mail varchar(320))
BEGIN
	Select * from user 
    where MailID = Mail;
END$$
DELIMITER ;


//This Stored procedure is executed whenever a new user registers.
USE `photoapp`;
DROP procedure IF EXISTS `insertdetails`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `insertdetails` (IN MAIL VARCHAR(320), IN FIRSTNAME VARCHAR(20), IN LASTNAME VARCHAR(20), IN NOOFPOSTS VARCHAR(20))
BEGIN
	insert into user values(MAIL, FIRSTNAME, LASTNAME, NOOFPOSTS);
END$$
DELIMITER ;



POST TABLE

//This query creates the post tbale, which holds all the information about the post.
Create table post(postID varchar(20) NOT NULL PRIMARY KEY, MailID varchar(10), TopicID varchar(10), URL varchar(20), UploadTime DATETIME, Description varchar(100));

//This query adds foreign key references for the MAILID
alter table post add Foreign key(MailID) REFERENCES user(MailID);



//This stored procedure is executed, when a photo is posted and the details are stored in the database.
USE `photoapp`;
DROP procedure IF EXISTS `insertpostdetails`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `insertpostdetails` (postID varchar(20), MailID varchar(10), TopicID varchar(10), URL varchar(20), UploadTime DATETIME, Description varchar(100))
BEGIN
	insert into post values(postID, MailID, TopicID, URL, UploadTime, Description);
END$$
DELIMITER ;



//This stored procedure fetches the post with maximum number of votes.
USE `photoapp`;
DROP procedure IF EXISTS `SubmitVotes`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `SubmitVotes` (PostID varchar(10))
BEGIN
	select TopicID, URl, MAX(voteID) from post JOIN votes WHERE post.postID = votes.postID;
END$$
DELIMITER ;



//This stored procedure is executed, and it displays all the posts.
USE `photoapp`;
DROP procedure IF EXISTS `Displayposts`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `Displayposts` (IN MailID varchar(320))
BEGIN
 select TopicID, URL, UploadTime from post p JOIN votes v on p.postID = v.postID  WHERE MailID = MailID;
END$$
DELIMITER ;


VOTES TABLE

//Creates the TABLE
create table votes(voteID varchar(20) primary key, PostID varchar(20), MailID_voter  varchar(20));




TOPIC TABLE


//Creates the 'topic' table
Create table topic(TopicID varchar(20) PRIMARY KEY, MailID varchar(320), Title varchar(20));

//Adding the foreign key constraints
Alter table post add foreign key(TopicID) REFERENCES topic(TopicID);



//This procedure is executed whenever a topic is added
USE `photoapp`;
DROP procedure IF EXISTS `add_topic`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `add_topic` (TopicID varchar(20), MailID varchar(320), Title varchar(20), PostedDate DATE)
BEGIN
	insert into topic values(TopicID, MailID, Title, PostedDate);
END$$
DELIMITER ;



COMMENTS TABLE

//This query creates the table comments
create table comments(postID varchar(10), CommentID varchar(10) NOT NULL Primary key, MailID varchar(320), content varchar(100), uploadTime datetime);

//Adds the Foreign key reference
Alter table comments add Foreign key(postID) REFERENCES post(postID);


//This stored procedure is executed, whenever a comment is added to a post, and the comment is saved in the comments table.
USE `photoapp`;
DROP procedure IF EXISTS `add_comment`;
DELIMITER $$
USE `photoapp`$$
CREATE PROCEDURE `add_comment` (postID varchar(10), CommentID varchar(10), MailID varchar(320), content varchar(100), uploadTime datetime)
BEGIN
	insert into comments values(postID, CommentID, MailID, content, uploadTime);
END$$
DELIMITER ;







