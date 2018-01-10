use photoapp;

/* When a user posts a pic, this updates the number of posts for that user */
DROP TRIGGER IF EXISTS update_post_count;
DELIMITER
 //
CREATE TRIGGER update_post_count
    AFTER INSERT 
    ON posts
    FOR EACH ROW 
BEGIN
    UPDATE users u
	    SET u.no_of_posts = u.no_of_posts + 1 
        WHERE u.user_id = NEW.user_id; 
END ;
//
DELIMITER ;