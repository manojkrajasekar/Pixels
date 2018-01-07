/* On execution, stores the topic details in the TOPIC table */
/* What if all these fields or one among these: topic_id and user_id are null, when this stored procedure is called. */
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
		SELECT
			'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails' ;
		INSERT INTO topic
		(
			topic_title,
			user_id
		)
		VALUES
		(
			_topic_title,
			_user_id
		) ;
		SELECT last_insert_id() INTO _topic_id ;
END ; //
DELIMITER ;


/* ------------------------------------------------------------------------------------------ */

/* This stored procedure when executed, displays either the current topic or previous topic based on the passed value */
/* What if the limit value is null, when this stored procedure is called. */
DROP PROCEDURE IF EXISTS get_topics;
DELIMITER
    //
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
    IF _is_current = 1 THEN
        SELECT
            t.topic_id AS 'Topic ID',
            t.topic_title AS 'Topic title',
            t.user_id AS 'User ID',
            t.start_time AS 'Start Time',
            t.end_time AS 'End Time'
        FROM topic t
        WHERE t.is_current = _is_current ;
    ELSEIF _is_current = 0 THEN
        SELECT
            t.topic_id AS 'Topic ID',
            t.topic_title AS 'Topic title',
            t.user_id AS 'User ID',
            t.start_time 'Start Time',
            t.end_time 'End Time'
        FROM topic t
        ORDER BY t.start_time
        DESC LIMIT _limit;
    END IF ;
END ; //
DELIMITER ;