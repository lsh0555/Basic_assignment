-- 확인 질문
-- 다음 질문에 본인의 말로 짧게 답변해주세요.

-- 1. `PRIMARY KEY`는 왜 필요한가요?
-- → 테이블에서 각각의 데이터를 고유하게 구분하기 위해 필요하다.

-- 2. `WHERE` 없이 `UPDATE` 또는 `DELETE`를 실행하면 어떤 문제가 발생할 수 있나요?
-- → 특정 데이터만 수정하거나 삭제하는 것이 아니라 테이블의 모든 데이터가 수정되거나 삭제될 수 있다.

-- 3. `SELECT *`와 필요한 컬럼만 선택하는 SQL의 차이는 무엇인가요?
-- → SELECT *는 모든 컬럼을 조회하고, 필요한 컬럼만 지정하면 원하는 데이터만 선택해서 조회할 수 있다.

-- 4. `COUNT()`와 `AVG()`는 각각 어떤 값을 계산하나요?
-- → COUNT()는 데이터의 개수를 계산하고, AVG()는 숫자 데이터의 평균값을 계산한다.

-- 5. Python에서 데이터를 처리하는 것과 DB에서 SQL로 데이터를 조회하는 것의 차이를 어떻게 이해했나요?
-- → Python은 가져온 데이터를 코드로 가공하거나 처리할 때 사용하고, SQL은 데이터베이스에 저장된 데이터 중 필요한 데이터를 조회하거나 관리할 때 사용한다고 이해했다.

SELECT current_database();
-- Part 1. PostgreSQL Schema와 Table 만들기

-- practice 스키마 생성
CREATE SCHEMA practice;

-- members 테이블 생성
CREATE TABLE practice.members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER,
    joined_at DATE
);



-- Part 2. INSERT와 SELECT로 회원 데이터 관리하기
-- 6명의 회원 데이터 입력
INSERT INTO practice.members (name, email, age, joined_at)
VALUES ('김민수','minsu@example.com',25,'2026-08-01');

INSERT INTO practice.members (name, email, age, joined_at)
VALUES ('임서현', 'limsh0522@naver.com', 26, '2026-8-2');

INSERT INTO practice.members (name, email, age, joined_at)
VALUES ('김철수', 'aaaa@google.email', 28, '2026-8-2');

INSERT INTO practice.members (name, email, age, joined_at)
VALUES
    ('이영희', 'younghee@example.com', 24, '2026-08-03'),
    ('박지훈', 'jihoon@example.com', 27, '2026-08-03'),
    ('최유진', 'yujin@example.com', 23, '2026-08-04');


-- 전체 회원 조회
SELECT*FROM practice.members;

-- 이름과 이메일만 조회
SELECT name, email
FROM practice.members;

-- 25세 이상 회원 조회
SELECT *
FROM practice.members
WHERE age >= 25;

-- 특정 이름의 회원 조회
SELECT *
FROM practice.members
WHERE name = '임서현';

-- 나이가 많은 순서로 조회
SELECT *
FROM practice.members
ORDER BY age DESC;

-- 가입일 순서로 조회
SELECT *
FROM practice.members
ORDER BY joined_at ASC;



-- Part 3. UPDATE와 DELETE로 데이터 변경하기
-- member_id가 1인 회원의 나이를 30으로 수정
UPDATE practice.members
SET age=30
WHERE member_id=1;
SELECT*FROM practice.members;

--  member_id가 5인 특정 회원 삭제
DELETE FROM practice.members
WHERE member_id=5;
SELECT*FROM practice.members;



-- Part 4. 집계 함수를 이용한 회원 데이터 분석
-- 전체 회원 수
SELECT COUNT(*) AS student_count
FROM practice.members;

-- 회원 평균 나이
SELECT AVG(age) AS student_count
FROM practice.members;

-- 가장 나이가 많은 회원의 나이
SELECT MAX(age) AS student_count
FROM practice.members;

-- 가장 나이가 어린 회원의 나이
SELECT MIN(age) AS student_count
FROM practice.members;

-- 25세 이상 회원 수
SELECT COUNT(*) AS student_count
FROM practice.members
WHERE age >= 25;



-- [ 도전 문제 - 원하는 조건 2개 이상을 함께 사용하여 회원 조회하기 ]
SELECT *
FROM practice.members
WHERE age > 25
  AND joined_at = '2026-08-03'
ORDER BY name ASC;