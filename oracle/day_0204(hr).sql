SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATA, ETC
FROM HR.STUDENTS;


INSERT INTO IDEV.STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATA, ETC)
VALUES(0, '', '', '', '', '');


UPDATE IDEV.STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATA='', ETC='';


DELETE FROM IDEV.STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATA='' AND ETC='';

-- 연습문제 : 작성자 이지훈

--1 . jobs 테이블 문제
--1) min_salary 컬럼이 10000이상인 Job_title 조회
--2) job_title 컬럼이 programmer 인 행의 모든 컬럼 조회
--3) max_salary 컬럼의 최대값 조회

--2. locations 테이블 문제
--1) city 컬럼이 London 인 postal_code 컬럼 조회
--2) LOCATION_ID 컬럼이 1700, 2700, 2500이 아니고 city컬럼이 Tokyo인 행의 모든 컬럼 조회


SELECT * FROM JOBS WHERE MIN_SALARY  >= 10000;
SELECT * FROM JOBS WHERE JOB_TITLE  ='Programmer';
SELECT * FROM JOBS WHERE lower(JOB_TITLE)='programmer';
-- 대소문자 상관없이 한다면 문자열 관련 오라클 함수 : upper(), lower() 이용합니다.
SELECT MAX(max_salary)FROM JOBS ; 

--추가 : min_salary 의 평균값보다 작은 행의 job_id, job_title 컬럼 조회 -> group 진도후에 다시 해봅시다.
--	  아래 명령은 오류 -> group 진도 후에 다시 해봅시다.
	--SELECT job_id , job_title  FROM JOBS j WHERE MIN_SALARY  < AVG(MIN_SALARY); 

SELECT postal_code FROM LOCATIONS WHERE CITY = 'London' ;
SELECT *FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY ='Tokyo'; 
