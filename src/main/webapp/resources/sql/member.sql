DROP TABLE member;

CREATE table IF NOT EXISTS member (
   id VARCHAR(20) NOT NULL,
   password VARCHAR(10) NOT NULL,
   name VARCHAR(10) NOT NULL,
   birth VARCHAR(10),
   mail VARCHAR(30),
   phone VARCHAR(20),
   address VARCHAR(50),
   registDate VARCHAR(50),
   PRIMARY KEY(id)
) DEFAULT CHARSET=UTF8;

SELECT * FROM member;

DESC member;