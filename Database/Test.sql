use photoapp;

/*USER TABLE*/

/*This stored procedure is executed, when a new user is added.*/
CALL REGISTER_USER('manoj.k.rajasekar@gmail.com','Manoj','Rajasekar', @USER_ID);
CALL REGISTER_USER('vignesh.rajasekar@gmail.com', 'Vignesh', 'Rajasekar',@USER_ID);

/* Retreives the user details, based on the given user_id */
CALL GET_USERDETAILS('4');

/* This updates the user details */
CALL UPDATE_USER_DETAILS('6', 'Mano', 'Rajasek');

/* This stored procedure when executed, sets the IS_ACTIVE column to 0, thus deactivating the user */
CALL DEACTIVATE_USER('6');



/* TOPIC TABLE */

/*This stored procedure is executed when a new topic is added*/
CALL ADD_TOPIC('Wildlife', @TopicID);
SELECT @TopicID; 

/*This stored procedure when executed retreives all the topics, which are active*/
CALL GET_TOPICS('1');



/* POSTS TABLE */

/*Stored procedure is executed, which stores the post details in the database */
CALL ADD_POST('3', '3', 'manoj/wildlife/pics', 'life in danger', 'Moments', @postID);
SELECT @postID;

/*This when executed, Updates the description of the post */
CALL UPDATE_DESCRIPTION('5', '3', 'Cool');

/*This when executed, deletes the post by setting the IS_ACTIVE column to 0 */
CALL DELETE_POST('6', '3');



/* VOTES TABLE */

/* This Stored procedure when called, registers the vote and its details for the post */
CALL ADD_VOTE('2','2', @VOTE_ID);



/* COMMENT TABLE */

/*When a commment is added for a post, it stores the details of that comment in the table. */
CALL ADD_COMMENT('1','2','Cool pic', @COMMENT_ID);

/*This when executed, fetches the comment for a particular post base don the given post id*/
CALL GET_COMMENTS('1', '2');

/* Changes made in the comment by the user, are updated and stored in the comments table */
CALL UPDATE_COMMENT('Interesting', '2', '1');

/* This deletes the comment, by setting the IS_ACTIVE column to 0 */
CALL DELETE_COMMENT('4','1');











