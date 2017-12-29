USE photoapp;

/* Trigger that initialises the votecount value, for every post*/
DELIMITER $$
CREATE TRIGGER set_vote
    AFTER INSERT 
    ON post
    FOR EACH ROW 
BEGIN
    INSERT INTO votes
	SET POST_ID ='1', 
    VOTECOUNT = '0';
END $$
DELIMITER ;