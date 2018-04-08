USE photoapp;

/* When a user wins, his/her submitted topic's details are stored in the topics table */
/* QUESTION: What if any one (or) all the input parameters are null ? */
DROP PROCEDURE IF EXISTS add_topic;
DELIMITER
    //
CREATE PROCEDURE add_topic
(
    IN _topic_title VARCHAR(100),
    IN _user_id INTEGER,
    OUT _topic_id INTEGER
)
BEGIN
    DECLARE EXIT HANDLER FOR 1452
		
	SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails' ;
	
	INSERT INTO topics
	(
		topic_title,
		user_id
	)
	VALUES
	(
		_topic_title,
		_user_id
	) ;
	
	SELECT LAST_INSERT_ID() INTO _topic_id ;
END ; //
DELIMITER ;


/* ------------------------------------------------------------------------------------------ */

/* It displays either the current topic or the previous topic based on the is_current value */
/* QUESTION: What if the limit value (or) is_current is null, when this stored procedure is called. */
DROP PROCEDURE IF EXISTS get_topics;
DELIMITER
    //
CREATE PROCEDURE get_topics
(
    IN _is_current BOOLEAN,
    IN _limit INTEGER 
)
BEGIN
	DECLARE EXIT HANDLER FOR 1452

    SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails' ;
	
	IF _limit IS NULL THEN
		SET _limit = 1;
	END IF;
       
    IF _is_current IS NULL THEN
		SET _is_current = 1;
	END IF;
    
    IF _limit = 0 THEN
    	SET _limit = 1;
	END IF;
    
	
	SELECT
			t.topic_id AS 'Topic ID',
			t.topic_title AS 'Topic title',
			t.user_id AS 'Topic posted by',
			t.start_time 'Start Time',
			t.end_time 'End Time'
		FROM topics t
		WHERE t.is_current = _is_current 
		ORDER BY t.start_time DESC
		LIMIT _limit;
	END ;
//
DELIMITER ;