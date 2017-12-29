USE photoapp;

/*A new user is added*/
CALL Register_user('Dishen@gmail.com', 'Dishen', 'Raana');

/* New user posts a pic and the data is saved in the database */
CALL Insert_postdetails('3', 'Dishen@gmail.com', '01', 'Dishen/Cheetah','Fast');

/*This updates the votecount for a POST_ID*/
UPDATE VOTES SET VOTECOUNT = VOTECOUNT + 1;

/* Displays all the data of the user from the user table */
SELECT MAIL_ID, FIRST_NAME, LAST_NAME FROM USER;

/* Displays all the data of the post from the post table */
SELECT POST_ID, MAIL_ID, TOPIC_ID, URL, DESCRIPTION FROM POST;

/* Displays the votecount for the corresponding post from the post table */
SELECT POST_ID, VOTECOUNT FROM VOTES;




