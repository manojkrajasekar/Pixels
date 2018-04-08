use photoapp;

/*USER TABLE*/

/*This stored procedure is executed, when a new user is added.*/
CALL REGISTER_USER('manoj.k.rajasekar@gmail.com','Manoj','Rajasekar', @USER_ID);
SELECT @USER_ID;

CALL REGISTER_USER('vignesh.rajasekar@gmail.com', 'Vignesh', 'Rajasekar',@USER_ID);
SELECT @USER_ID;

CALL REGISTER_USER('Dishen.Raana@gmail.com', 'Dishen', 'Raana',@USER_ID);
SELECT @USER_ID;

CALL REGISTER_USER('Abhinav.Karthikeyan@gmail.com', 'Abhinav', 'karthieyan',@USER_ID);
SELECT @USER_ID;

CALL REGISTER_USER('venkat.vellaichamyan@gmail.com', 'VenakataSubramani', 'Vellaichamy',@USER_ID);
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

CALL add_topic('Race', '3', @TopicID);
SELECT @TopicID;

CALL add_topic('Sunshine', '4', @TopicID);
SELECT @TopicID;

CALL add_topic('Dream', '5', @TopicID);
SELECT @TopicID;





/*This stored procedure when executed retreives all the topics, which are active*/
CALL GET_TOPICS('1');



/* POSTS TABLE */

/*Stored procedure is executed, which stores the post details in the database */
CALL add_post('1', '1', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522615205/Topic1_Picture1.png', 'life in danger', 'Moments', @postID);
SELECT @postID;

CALL add_post('1', '2', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic2_Picture1.png', 'life in danger', 'Moments', @postID);
SELECT @postID;

CALL add_post('1', '3', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic3_Picture1.png', 'Demo', 'life', @postID);
SELECT @postID;

CALL add_post('2', '1', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522615205/Topic1_Picture2.png', 'Awesome', 'Thrill', @postID);
SELECT @postID;

CALL add_post('2', '2', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic2_Picture2.png', 'Silence', 'Threat', @postID);
SELECT @postID;

CALL add_post('2', '3', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic3_Picture2.png', 'Awesome', 'Thrill', @postID);
SELECT @postID;

CALL add_post('3', '1', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522615205/Topic1_Picture3.png', 'fast', 'pay', @postID);
SELECT @postID;

CALL add_post('3', '2', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic2_Picture3.png', 'pursuit', 'cool', @postID);
SELECT @postID;

CALL add_post('3', '3', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic3_Picture3.png', 'fast', 'pay', @postID);
SELECT @postID;

CALL add_post('4', '1', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522615205/Topic1_Picture4.png', 'fast', 'pay', @postID);
SELECT @postID;

CALL add_post('4', '2', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic2_Picture4.png', 'pursuit', 'cool', @postID);
SELECT @postID;

CALL add_post('4', '3', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic3_Picture4.png', 'fast', 'pay', @postID);
SELECT @postID;

CALL add_post('5', '1', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522615205/Topic1_Picture5.png', 'pursuit', 'cool', @postID);
SELECT @postID;

CALL add_post('5', '2', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic2_Picture5.png', 'pursuit', 'cool', @postID);
SELECT @postID;

CALL add_post('5', '3', 'http://res.cloudinary.com/pixelsapp/image/upload/v1522616239/Topic3_Picture5.png', 'pursuit', 'cool', @postID);
SELECT @postID;


/* This when executed, displays all the posts for a */
CALL get_posts_by_topic('3');


/*This when executed, Updates the description of the post */
CALL update_post('5', '3', 'Cool');

/*This when executed, deletes the post by setting the IS_ACTIVE column to 0 */
CALL delete_post('6', '3');



/* VOTES TABLE */

/* This Stored procedure when called, registers the vote and its details for the post */
CALL add_vote('1','2', @vote_id);
SELECT @vote_id;

CALL add_vote('1','3', @vote_id);
SELECT @vote_id;

CALL add_vote('1','4', @vote_id);
SELECT @vote_id;

CALL add_vote('2','2', @vote_id);
SELECT @vote_id;

CALL add_vote('2','3', @vote_id);
SELECT @vote_id;

CALL add_vote('2','4', @vote_id);
SELECT @vote_id;

CALL add_vote('2','5', @vote_id);
SELECT @vote_id;

CALL add_vote('3','2', @vote_id);
SELECT @vote_id;

CALL add_vote('3','3', @vote_id);
SELECT @vote_id;

CALL add_vote('3','4', @vote_id);
SELECT @vote_id;

CALL add_vote('3','5', @vote_id);
SELECT @vote_id;

CALL add_vote('4','1', @vote_id);
SELECT @vote_id;

CALL add_vote('4','3', @vote_id);
SELECT @vote_id;

CALL add_vote('4','4', @vote_id);
SELECT @vote_id;

CALL add_vote('5','1', @vote_id);
SELECT @vote_id;

CALL add_vote('5','3', @vote_id);
SELECT @vote_id;

CALL add_vote('5','4', @vote_id);
SELECT @vote_id;



CALL get_vote_info_by_post('2');

/* This stored procedure when called, updates the vote i.e changes the is_active value of vote */
CALL update_vote('2','2','7');


/* COMMENT TABLE */

/*When a commment is added for a post, it stores the details of that comment in the table. */
CALL add_comment('2','1','Cool pic', @comment_id);
SELECT @comment_id;

CALL add_comment('3','1','Interesting', @comment_id);
SELECT @comment_id;

CALL add_comment('4','1','Awesome', @comment_id);
SELECT @comment_id;

CALL add_comment('1','2','Dashing', @comment_id);
SELECT @comment_id;

CALL add_comment('3','2','Very good snap', @comment_id);
SELECT @comment_id;

CALL add_comment('4','2','Lovely', @comment_id);
SELECT @comment_id;

CALL add_comment('5','2','Adorable', @comment_id);
SELECT @comment_id;


/*This when executed, fetches the comment for a particular post base don the given post id*/
CALL get_comments('3', '1');
CALL get_comments('3', '2');

/* Changes made in the comment by the user, are updated and stored in the comments table */
CALL update_comment('Interesting', '1');

/* This deletes the comment, by setting the IS_ACTIVE column to 0 */
CALL delete_comment('5','1,','7');











