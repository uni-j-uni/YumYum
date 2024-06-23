DROP TABLE board;

CREATE TABLE board (
	num INT NOT NULL auto_increment,
    id VARCHAR(10) NOT NULL,
	name VARCHAR(10) NOT NULL,
	subject VARCHAR(100) NOT NULL,
	content text NOT NULL,
	address text,
	registDate VARCHAR(30),
	hit INT,
	ip VARCHAR(20),
	PRIMARY KEY (num)
) DEFAULT CHARSET=UTF8;

SELECT * FROM board;

DESC board;