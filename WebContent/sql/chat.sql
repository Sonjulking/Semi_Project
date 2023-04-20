CREATE TABLE chat_room (
    room_id INT NOT NULL AUTO_INCREMENT,
    room_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (room_id)
);

CREATE TABLE chat_message (
    message_id INT NOT NULL AUTO_INCREMENT,
    room_id INT NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    message_content VARCHAR(255) NOT NULL,
    message_time DATETIME NOT NULL,
    PRIMARY KEY (message_id),
    FOREIGN KEY (room_id) REFERENCES chat_room(room_id)
);

ALTER TABLE chat_message
ADD FOREIGN KEY (user_name) REFERENCES member (member_nickname)
ON DELETE CASCADE
ON UPDATE CASCADE;
