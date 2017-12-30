use photoapp;

/*This stored procedure is executed, when a new user is added.*/
CALL Register_user('1', 'manoj.k.rajasekar@gmail.com', 'Manoj', 'Rajasekar', '0', '1');
CALL Register_user('2','vignesh.sekar@gmail.com', 'Vignesh', 'Rajasekar','0','1');
CALL Register_user('3','venkat@gmail.com', 'venkat', 'vellaichamy','0','1');
CALL Register_user('4','Abhinav@gmail.com', 'Abhi', 'Karthikeyan','0','1');

/*This stored procedure is executed when a new topic is posted*/
CALL Add_topic('01','1', 'Wildlife', '0');

/*Stored procedure is executed, which stores the post details in the database */
CALL Insert_postdetails('1','1', '01', 'vignesh/tiger', 'Brave', '1');
CALL Insert_postdetails('2', '2', '01', 'venkat/lion', 'King', '1');
CALL Insert_postdetails('1,','3', '01', 'Abhinav/zebra', 'zebra', '1');

/*USER TABLE */

/*This calls the stored procedure, to update the first name of the user*/
CALL Update_firstname('1', 'Mano');

/*This calls the stored procedure, to update the last name of the user*/
CALL Update_lastname('1', 'Rajasekar');

/* This calls the stored procedure, and makes the user inactive*/
CALL Deactivate_user('1', '0');


/* TOPIC TABLE */

/*This stored procedure when executed, addds a topic given by the user*/
CALL Add_topic('01','1', 'Wildlife', '0');

/*This stored procedure when executed, Updates the title*/
CALL Update_topic('01','1', 'Bird', '0');

/*This Stored procedure is called, when an user wins, and his topic is made active */
CALL Activate_topic('01', '1', '1');

/*This Stored procedure when called, deactivates the topic by setting the IS_ACTIVE to 0*/
CALL Deactivate_topic('01', '1', '0');

/*This stored procedure when executed, displays all the topics which were active */
CALL Display_topic('01', '1', '0');


/* POST TABLE */

/* This stored procedure when called, updates the Topic URL */
CALL Update_topic_url('1','1','nassygs/kajajaia', '0');

/* This stored procedure when called, updates the Description of the post */
CALL Update_description('1','1','Interesting');

/* This stored procedure when called, activates the post*/
CALL Activate_post('1');

/* This stored procedure when called, deactivates the post */
CALL Deactivate_post('0');


/* VOTES TABLE */

/* This Stored procedure when called, registers the vote and its details for the post */
CALL Add_votes('1', 'venkat@gmail.com', '1', '0000:00:00 00:00:00');
CALL Add_votes('1', 'Dishen@gmail.com', '1', '2018:12:24 00:00:11');


CALL Display_votes('1');

/* This Stored procedure when called, Deactivates the vote */
CALL Delete_votes('1', 'venkat@gmail.com');




/* COMMENT TABLE */

/*This Stored procedure when executed, saves the added comment in the table */
CALL Add_comment('1', '1', '1', 'Fantasticpic', '1', '0000:00:00 00:00:00');

/*This Stored procedure when executed, edits the comment and saves it */
CALL Edit_comment('1', '1', 'Best pic');

/* This Stored procedure deactivates the isactivate status of comment */ 
CALL Delete_comment('1', '1');











