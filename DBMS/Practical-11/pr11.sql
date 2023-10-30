use sakila;

/*1*/

DELIMITER //
CREATE TRIGGER uppercase
BEFORE INSERT ON language
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END;
//
DELIMITER ;

INSERT INTO language (name) VALUES ('english');
select *from language;
-- show triggers like 'uppercase';

/*2*/

CREATE TABLE insertion_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER display
AFTER INSERT ON language
FOR EACH ROW
BEGIN
    INSERT INTO insertion_messages (message) VALUES ('The record has been inserted successfully');
END;
//
DELIMITER ;

INSERT INTO language (name) VALUES ('hindi');
SELECT * FROM insertion_messages;

/*3*/

CREATE TABLE audit_language_update (
    id INT AUTO_INCREMENT PRIMARY KEY,
    language_id TINYINT(3),
    name CHAR(20),
    last_update TIMESTAMP,
    status CHAR(20)
);


DELIMITER //
CREATE TRIGGER language_audit_trigger
AFTER UPDATE ON language
FOR EACH ROW
BEGIN
    -- Insert old record (BEFORE UPDATE) into audit table
    INSERT INTO audit_language_update (language_id, name, last_update, status)
    VALUES (OLD.language_id, OLD.name, OLD.last_update, 'Before Update');
    
    -- Insert updated record (AFTER UPDATE) into audit table
    INSERT INTO audit_language_update (language_id, name, last_update, status)
    VALUES (NEW.language_id, NEW.name, NEW.last_update, 'After Update');
END;
//
DELIMITER ;

UPDATE language
SET name = 'English'
WHERE language_id = 1;

SELECT * FROM audit_language_update;


/*4*/

CREATE TABLE language_before_delete (
    language_id TINYINT(3),
    name CHAR(20),
    last_update TIMESTAMP,
    status CHAR(20) DEFAULT 'Before Delete'
);


DELIMITER //
CREATE TRIGGER language_delete_trigger
AFTER DELETE ON language
FOR EACH ROW
BEGIN
    -- Insert deleted record into backup table
    INSERT INTO language_before_delete (language_id, name, last_update)
    VALUES (OLD.language_id, OLD.name, OLD.last_update);
END;
//
DELIMITER ;


DELETE FROM language WHERE language_id = 2;

SELECT * FROM language_before_delete;


/*5*/

-- Create the language_after_delete table
CREATE TABLE language_after_delete (
    language_id TINYINT(3),
    name CHAR(20),
    Status VARCHAR(200)
);

-- Create the trigger to maintain deleted records in language_after_delete table
DELIMITER //
CREATE TRIGGER after_language_delete
AFTER DELETE ON language
FOR EACH ROW
BEGIN
    INSERT INTO language_after_delete (language_id, name, Status)
    VALUES (OLD.language_id, OLD.name, 
    CONCAT('Language ', OLD.name, ' with ID ', OLD.language_id, ' was deleted on ', NOW()));
END;
//
DELIMITER ;

-- Insert some sample data into the language table
INSERT INTO language (language_id, name) VALUES (111, 'nope ');
INSERT INTO language (language_id, name) VALUES (121, 'animal');
INSERT INTO language (language_id, name) VALUES (131, 'code');



DELETE FROM language WHERE language_id = 111;

SELECT * FROM language_after_delete;

/*6*/

show triggers;