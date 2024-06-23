DROP TABLE reserve;

CREATE table IF NOT EXISTS reserve (
   m_id VARCHAR(20) NOT NULL,
   reserveId VARCHAR(10) NOT NULL,
   reserveName VARCHAR(10) NOT NULL,
   reserveDate VARCHAR(10) NOT NULL,
   numOfPerson INTEGER,
   phoneNum VARCHAR(30),
   FOREIGN KEY (reserveId) REFERENCES restaurant(r_id) ON DELETE CASCADE,
   FOREIGN KEY (m_id) REFERENCES member(id) ON DELETE CASCADE
) DEFAULT CHARSET=UTF8;

SELECT * FROM reserve;

DESC reserve;