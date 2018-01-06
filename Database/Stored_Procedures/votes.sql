DROP PROCEDURE IF EXISTS add_vote;
/* This stored procedure when executed, adds a vote for a particular post */
DELIMITER //
CREATE PROCEDURE add_vote
(
	IN _post_id INTEGER,
	IN _user_id INTEGER,
	OUT _vote_id INTEGER
)
BEGIN
	INSERT INTO votes(post_id, user_id) VALUES(_post_id, _user_id);
	
	SELECT last_insert_id() INTO _vote_id;
END;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS update_vote;
/* This stored procedure when executed, Displays the recently casted votes for a particular post */
DELIMITER //
CREATE PROCEDURE update_vote
(
	IN _vote_id INTEGER,
	IN _post_id INTEGER, 
	IN _user_id INTEGER
)
BEGIN
	INSERT INTO votes(post_id, user_id) VALUES(_post_id, _user_id);
	
	UPDATE votes v
		SET v.is_active = NOT v.is_active
		WHERE v.vote_id = _vote_id;
END;
//
DELIMITER ;
