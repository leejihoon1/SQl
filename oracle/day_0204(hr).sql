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


--3) employees 테이블 문제
--통계함수(집계 함수)를 좀더 연습합니다.
SELECT  COUNT(*) FROM EMPLOYEES e ; -- 총 개수 : 107
SELECT  COUNT(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; -- 조건 job_id 직원수 :5

SELECT AVG(SALARY)FROM EMPLOYEES e; -- 직원 평균 급여 : 6461.83
SELECT AVG(SALARY)FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; -- 조건 job_id 평균급여 : 5760

SELECT MAX(salary) FROM EMPLOYEES e ; --직원 중 최고 급여 : 24,000
SELECT MAX(salary) FROM EMPLOYEES e  WHERE  JOB_ID ='IT_PROG'; -- 조건 job_id 최고급여 : 9,000 

SELECT MIN(salary) FROM EMPLOYEES e ; -- 직원 중 최저 급여 : 2,100
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; -- 조건 job_id 최저급여 :4,200 

--통계함수는 그룹함수입니다. 해당함수 결과값을 구하기 위해 여러 데이터를 그룹화 하고 실행합니다.
-- 그룹함수 결과와 다른 컬럼을 같이 조회할 수 없습니다. 아래 sql은 오류입니다.
-- SELECT JOB_ID, MAX(salary) FROM EMPLOYEES e ;

SELECT *FROM EMPLOYEES e2 WHERE SALARY =(
--위의 avg,max,min 구한 sql명령을 여기에 넣어보세요. 그 의미를 파악해봅시다. 
--	SELECT MAX(salary) FROM EMPLOYEES e
	SELECT MAX(salary) FROM EMPLOYEES e  WHERE  JOB_ID ='IT_PROG'
--	SELECT MIN(salary) FROM EMPLOYEES e 
--	SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG
); -- SELECT 안에 쓰인 또 다른 SELECT 는 서브쿼리입니다. 결과값이 1개이므로 = 조건식에 사용할 수 있습니다.

--IT_PROG 중에서 최소급여를 받는 사람의 first_name, last_name 컬럼조회하기
SELECT First_name, last_name  FROM EMPLOYEES e WHERE 
SALARY =(SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID = 'IT_PROG';



--추가 : min_salary 의 평균값보다 작은 행의 job_id, job_title 컬럼 조회 -> group 진도후에 다시 해봅시다.
-- 아래 명령은 오류 -> group 진도 후에 다시 해봅시다.
--SELECT job_id , job_title  FROM JOBS j WHERE MIN_SALARY  < AVG(MIN_SALARY);
--평균 값
SELECT JOB_ID , JOB_TITLE, MIN_SALARY  FROM JOBS j 
-- 평균값을 조건식에 이용하기(서브쿼리)
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS j );



