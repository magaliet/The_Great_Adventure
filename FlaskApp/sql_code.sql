


/* All the SQL code I used : */


/* create the database, the table used to store users, a table for the times the user has logged in and a table for the enigmas */

CREATE DATABASE Treasure_Hunt; 

CREATE TABLE `Treasure_Hunt`.`tbl_user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NULL,
  `user_username` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  `points` BIGINT NULL,
  `jewels` INT NULL,
  
  PRIMARY KEY (`user_id`));

CREATE TABLE `treasure_hunt`.`times_logged_in`(
`user_id` BIGINT NOT NULL AUTO_INCREMENT,
`user_name` VARCHAR(255) NULL,
`times_logged_in` BIGINT NULL,
PRIMARY KEY (`user_id`));


CREATE TABLE `Treasure_Hunt`.`enigmas` (
  `enigma_id` BIGINT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(255) NULL,
  `enigma_code` BIGINT NULL,
  `enigma_problem` VARCHAR(1023) NULL,
  `enigma_answer` VARCHAR(255) NULL,
  `enigma_hint` VARCHAR(1023) NULL,
  
  PRIMARY KEY (`enigma_id`));





/* create a stored procedure that will add a new member to tbl_user and times_logged_in, if the email hasn't been used already --> signs up the new user */

USE treasure_hunt;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_name VARCHAR(255),
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(21844)
)
BEGIN
    if ( SELECT EXISTS (SELECT 1 FROM treasure_hunt.tbl_user WHERE user_username = p_username) ) THEN
     
        SELECT 'Username Exists !!';
     
    ELSE
     
        INSERT INTO treasure_hunt.tbl_user
        (
            user_name,
            user_username,
            user_password
        )
        VALUES
        (
            p_name,
            p_username,
            p_password
        );
        
        INSERT INTO treasure_hunt.times_logged_in
        (
            user_name
        )
        VALUES
        (
            p_name
        );
        
        
     
    END IF;
END$$
DELIMITER ;

/* Create a stored procedure that will check if if it's the correct user password and username(email) when someone logs in, also counts the times someone has logged in --> authorizes the log in of a user */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkUser`(
    IN p_email VARCHAR(255),
    IN p_password VARCHAR(255)
)
BEGIN
    IF ( SELECT EXISTS (SELECT 1 FROM tbl_user WHERE ((SELECT user_password FROM tbl_user WHERE user_username = p_email) = p_password))) THEN
     
        UPDATE times_logged_in 
        SET times_logged_in =+1
        WHERE user_id = (SELECT user_id FROM tbl_user WHERE user_username = p_email);
     
    ELSE
     
        SELECT ' Wrong username or wrong password';
     
    END IF;
END$$
DELIMITER ;


/* Put content into the enigmas table */


INSERT INTO treasure_hunt.enigmas ( 
	enigma_code, 
    enigma_problem,
    enigma_answer,
    enigma_hint
    )
    VALUES
    (
    42,
    'Dig under the beginning of the end and the end of time and space',
    'e',
    'The engineers will know'
    );


/* Create a stored procedure that will return an enigma problem if the right code and location were submited */
    

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getEnigma`(
    IN code_inserted BIGINT,
    IN location_inserted VARCHAR(255)
)
BEGIN
    IF ( SELECT EXISTS (SELECT 1 FROM enigmas WHERE ((SELECT location_name FROM enigmas WHERE enigma_code = code_inserted) = location_inserted))) THEN
     
      SELECT enigma_problem FROM enigmas WHERE location_name = location_inserted ;
     
    ELSE
     
        SELECT ' Wrong code inserted !';
     
    END IF;
END$$
DELIMITER ;

/* Create a stored procedure that checks if the answer to the enigma is right */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkAnswer`(
    IN answer VARCHAR(255)
)
BEGIN
    IF ( SELECT EXISTS (SELECT 1 FROM enigmas WHERE ((SELECT enigma_answer FROM enigmas WHERE enigma_id = 2) = answer))) THEN
     
      SELECT 'Correct!' ;
     
    ELSE
     
        select 'Incorrect!';
     
    END IF;
END$$
DELIMITER ;


----------------------------------------------------------------


/* Here are two queries that use update and delete 
   (I haven't used thisin the web app yet) */

/* I would have used this query to return a hint if the user had enough jewels */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getHint`(
	IN u_id BIGINT,
    IN e_id BIGINT
)
BEGIN
    IF ( (SELECT jewels FROM tbl_user WHERE user_id = u_id) >= 8) THEN
     
      UPDATE tbl_user
      SET jewels =- 8
      WHERE user_id = u_id;
      
      SELECT enigma_hint FROM enigmas WHERE enigma_id = e_id;
     
    ELSE
     
        SELECT 'Not enough jewels !';
     
    END IF;
END$$
DELIMITER ;


/* I would have used this query to create a stored procedure where user is deleted from the database if they decided to clik on a "i quit the scavenger hunt" button */

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteUser`(
    IN u_id BIGINT,
)
BEGIN
  
  DELETE from tbl_user
  WHERE user_id = u_id;
  
END$$
DELIMITER ;

