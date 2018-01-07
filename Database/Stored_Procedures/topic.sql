/* On execution, stores the topic details in the TOPIC table */
DROP PROCEDURE IF EXISTS ADD_TOPIC;
DELIMITER
    //
CREATE PROCEDURE ADD_TOPIC
(
    IN _TOPIC_TITLE VARCHAR(100),
    IN _USER_ID INTEGER,
    OUT _TOPIC_ID INTEGER
)
BEGIN
    DECLARE EXIT HANDLER FOR 1452
	SELECT
		'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails' ;
	INSERT INTO TOPIC(TOPIC_TITLE, USER_ID)
	VALUES(_TOPIC_TITLE, _USER_ID) ;
	SELECT
		LAST_INSERT_ID()
	INTO _TOPIC_ID
	FROM
		TOPIC T
	WHERE
		T.USER_ID = _USER_ID ;
END ; //
DELIMITER ;

/* ------------------------------------------------------------------------------------------ */

/* This stored procedure when executed, displays either the current topic or previous topic based on the passed value */
DROP PROCEDURE IF EXISTS GET_TOPICS;
DELIMITER
    //
CREATE PROCEDURE GET_TOPICS
(
    IN _IS_CURRENT BOOLEAN
)
BEGIN
    DECLARE EXIT HANDLER FOR 1452
    SELECT 'MySQL error 1452: Cannot add or update a child row: a foreign key constraint fails' ;
    IF _IS_CURRENT = 1 THEN
        SELECT
            T.TOPIC_ID,
            T.TOPIC_TITLE,
            T.USER_ID,
            T.START_TIME,
            T.END_TIME
        FROM
            TOPIC T
        WHERE
            T.IS_CURRENT = _IS_CURRENT ;
    ELSEIF _IS_CURRENT = 0 THEN
        SELECT
            T.TOPIC_ID,
            T.TOPIC_TITLE,
            T.USER_ID,
            T.START_TIME,
            T.END_TIME
        FROM
            TOPIC
        ORDER BY
            START_TIME
        DESC LIMIT 2 ;
    END IF ;
END ; //
DELIMITER ;