CREATE TABLE BOARD(
	BID INT PRIMARY KEY,
	TITLE VARCHAR(30) NOT NULL,
	CONTENT VARCHAR(30) NOT NULL,
	WRITER VARCHAR(30),
	CNT INT DEFAULT 0,
	REGTIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE BOARD
ADD CONSTRAINT FK_WRITER
FOREIGN KEY (WRITER)
REFERENCES MEMBER(MID)
ON DELETE SET NULL;

INSERT INTO BOARD (BID,TITLE,CONTENT,WRITER) VALUES(101,'공지01','공지입니다.','admin');
INSERT INTO BOARD (BID,TITLE,CONTENT,WRITER) VALUES((SELECT NVL(MAX(BID),100)+1 FROM BOARD),'공지02','공지입니다.','admin');
INSERT INTO BOARD (BID,TITLE,CONTENT,WRITER) VALUES((SELECT NVL(MAX(BID),100)+1 FROM BOARD),'테스트01','ㅈㄱㄴ','test');
INSERT INTO BOARD (BID,TITLE,CONTENT,WRITER) VALUES((SELECT NVL(MAX(BID),100)+1 FROM BOARD),'테스트02','ㅈㄱㄴ','test');

SELECT * FROM BOARD;
SELECT B.BID,B.TITLE,B.CONTENT,M.NAME,B.CNT,B.REGTIME FROM BOARD B JOIN MEMBER M ON B.WRITER=M.MID;
SELECT B.TITLE,B.CONTENT,M.NAME,B.CNT,B.REGTIME FROM BOARD B JOIN MEMBER M ON B.WRITER=M.MID WHERE B.BID=101;

DROP TABLE BOARD;