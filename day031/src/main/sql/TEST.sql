CREATE TABLE A(
	NUM INT PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	SCORE INT
); -- 대학교 부모 테이블
CREATE TABLE B(
	NUM INT PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	AAA INT NOT NULL -- FK == A의 PK값인 NUM을 받아와야만함
); -- 동아리 자식 테이블

-- FK 제약조건 추가하기
--  1) 원본 데이터가 사라질때, 연결 데이터도 함께 사라지는 방법
--  2) 원본 데이터가 사라질때, 연결 데이터는 유지되는 방법
ALTER TABLE B
ADD CONSTRAINT FK_AAA
FOREIGN KEY (AAA)
REFERENCES A(NUM)
ON DELETE SET NULL; -- CASCADE

SELECT
	BBB.NUM, -- 테이블별칭.컬럼명
	BBB.NAME AS B_NAME,
	BBB.AAA,
	AAA.NAME AS A_NAME,
	AAA.SCORE AS A_SCORE
FROM
	B BBB -- 테이블명 테이블별칭
JOIN
	A AAA
ON
	BBB.AAA=AAA.NUM;