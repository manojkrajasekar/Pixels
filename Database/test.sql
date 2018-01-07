use photoapp;

/*USER TABLE*/

/*This stored procedure is executed, when a new user is added.*/
CALL REGISTER_USER('manoj.k.rajasekar@gmail.com','Manoj','Rajasekar', @USER_ID);
SELECT @USER_ID;

CALL REGISTER_USER('vignesh.rajasekar@gmail.com', 'Vignesh', 'Rajasekar',@USER_ID);
SELECT @USER_ID;

CALL REGISTER_USER('Dishen.Raana@gmail.com', 'Dishen', 'Raana',@USER_ID);
SELECT @USER_ID;

/* Retreives the user details, based on the given user_id */
CALL get_user_details('1');

/* This updates the user details */
CALL update_user_details('1','Mano','Rajasekar');

/* This stored procedure when executed, sets the IS_ACTIVE column to 0, thus deactivating the user */
CALL toggle_user('1');





/* TOPIC TABLE */

/*This stored procedure is executed when a new topic is added*/
CALL add_topic('Wildlife', '1', @TopicID);
SELECT @TopicID;

CALL add_topic('Beach', '2', @TopicID);
SELECT @TopicID;

CALL add_topic('Sunshine', '3', @TopicID);
SELECT @TopicID;

/*This stored procedure when executed retreives all the topics, which are active*/
CALL GET_TOPICS('1');



/* POSTS TABLE */

/*Stored procedure is executed, which stores the post details in the database */
CALL add_post('1', '2', 'manoj/wildlife/pics', 'life in danger', 'Moments', @postID);
SELECT @postID;

CALL add_post('2', '2', 'vicky/life/picall', 'Awesome', 'Thrill', @postID);
SELECT @postID;

CALL add_post('3', '1', 'Dishen/baby/picall', 'fast', 'pay', @postID);
SELECT @postID;


/* Teis when executed, displays all the posts for a */
CALL get_posts_by_topic('2');


/*This when executed, Updates the description of the post */
CALL update_post('5', '3', 'Cool');

/*This when executed, deletes the post by setting the IS_ACTIVE column to 0 */
CALL delete_post('6', '3');



/* VOTES TABLE */

/* This Stored procedure when called, registers the vote and its details for the post */
CALL add_vote('2','2', @vote_id);
SELECT @vote_id;

CALL add_vote('2','1', @vote_id);
SELECT @vote_id;

CALL add_vote('3','1', @vote_id);
SELECT @vote_id;

CALL add_vote('3','2', @vote_id);
SELECT @vote_id;


/* This stored procedure when called, updates the vote i.e changes the is_active value of vote */
CALL update_vote('2','2','7');


/* COMMENT TABLE */

/*When a commment is added for a post, it stores the details of that comment in the table. */
CALL add_comment('1','2','Cool pic', @comment_id);
SELECT @comment_id;

/*This when executed, fetches the comment for a particular post base don the given post id*/
CALL get_comments('1', '1');
CALL get_comments('7', '2');

/* Changes made in the comment by the user, are updated and stored in the comments table */
CALL update_comment('Interesting', '5', '7', '2');

/* This deletes the comment, by setting the IS_ACTIVE column to 0 */
CALL delete_comment('5','1,','7');











