USE pixels;	
 		
 /* Based on the passed vote id, checks whether  it is null or not null */
 /* If the vote id is null, a new vote is inserted in the votes table based on the given post id and user id */
 /* If the vote id is not null, then it's is_active value is toggled */
 DROP PROCEDURE IF EXISTS update_vote;		
 		
 DELIMITER //
 CREATE PROCEDURE update_vote		
 (	
	IN _post_id INTEGER,
	IN _user_id INTEGER,	
 	INOUT _vote_id INTEGER		
 )			
 
 BEGIN 
		IF (_vote_id IS NULL) THEN
			INSERT INTO votes		
				(		
					post_id,		
					user_id		
				) 		
				VALUES		
				(		
					_post_id,		
					_user_id		
				);
			SELECT LAST_INSERT_ID() INTO _vote_id;
		END IF;
		
		IF(vote_id IS NOT NULL) THEN
				UPDATE votes v		
					SET v.is_active = NOT v.is_active		
					WHERE v.vote_id = vote_id;	
		END IF;
	END;
	//
DELIMITER;
