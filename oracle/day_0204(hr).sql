SELECT STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATA, ETC
FROM HR.STUDENTS;


INSERT INTO IDEV.STUDENTS
(STUNO, STU_NAME, EMAIL, ADDRESS, ENTER_DATA, ETC)
VALUES(0, '', '', '', '', '');


UPDATE IDEV.STUDENTS
SET STUNO=0, STU_NAME='', EMAIL='', ADDRESS='', ENTER_DATA='', ETC='';


DELETE FROM IDEV.STUDENTS
WHERE STUNO=0 AND STU_NAME='' AND EMAIL='' AND ADDRESS='' AND ENTER_DATA='' AND ETC='';

-- �������� : �ۼ��� ������

--1 . jobs ���̺� ����
--1) min_salary �÷��� 10000�̻��� Job_title ��ȸ
--2) job_title �÷��� programmer �� ���� ��� �÷� ��ȸ
--3) max_salary �÷��� �ִ밪 ��ȸ

--2. locations ���̺� ����
--1) city �÷��� London �� postal_code �÷� ��ȸ
--2) LOCATION_ID �÷��� 1700, 2700, 2500�� �ƴϰ� city�÷��� Tokyo�� ���� ��� �÷� ��ȸ


SELECT * FROM JOBS WHERE MIN_SALARY  >= 10000;
SELECT * FROM JOBS WHERE JOB_TITLE  ='Programmer';
SELECT * FROM JOBS WHERE lower(JOB_TITLE)='programmer';
-- ��ҹ��� ������� �Ѵٸ� ���ڿ� ���� ����Ŭ �Լ� : upper(), lower() �̿��մϴ�.
SELECT MAX(max_salary)FROM JOBS ; 

--�߰� : min_salary �� ��հ����� ���� ���� job_id, job_title �÷� ��ȸ -> group �����Ŀ� �ٽ� �غ��ô�.
--	  �Ʒ� ����� ���� -> group ���� �Ŀ� �ٽ� �غ��ô�.
	--SELECT job_id , job_title  FROM JOBS j WHERE MIN_SALARY  < AVG(MIN_SALARY); 

SELECT postal_code FROM LOCATIONS WHERE CITY = 'London' ;
SELECT *FROM LOCATIONS WHERE LOCATION_ID NOT IN (1700,2700,2500) AND CITY ='Tokyo';


--3) employees ���̺� ����
--����Լ�(���� �Լ�)�� ���� �����մϴ�.
SELECT  COUNT(*) FROM EMPLOYEES e ; -- �� ���� : 107
SELECT  COUNT(*) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; -- ���� job_id ������ :5

SELECT AVG(SALARY)FROM EMPLOYEES e; -- ���� ��� �޿� : 6461.83
SELECT AVG(SALARY)FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; -- ���� job_id ��ձ޿� : 5760

SELECT MAX(salary) FROM EMPLOYEES e ; --���� �� �ְ� �޿� : 24,000
SELECT MAX(salary) FROM EMPLOYEES e  WHERE  JOB_ID ='IT_PROG'; -- ���� job_id �ְ�޿� : 9,000 

SELECT MIN(salary) FROM EMPLOYEES e ; -- ���� �� ���� �޿� : 2,100
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG'; -- ���� job_id �����޿� :4,200 

--����Լ��� �׷��Լ��Դϴ�. �ش��Լ� ������� ���ϱ� ���� ���� �����͸� �׷�ȭ �ϰ� �����մϴ�.
-- �׷��Լ� ����� �ٸ� �÷��� ���� ��ȸ�� �� �����ϴ�. �Ʒ� sql�� �����Դϴ�.
-- SELECT JOB_ID, MAX(salary) FROM EMPLOYEES e ;

SELECT *FROM EMPLOYEES e2 WHERE SALARY =(
--���� avg,max,min ���� sql����� ���⿡ �־����. �� �ǹ̸� �ľ��غ��ô�. 
--	SELECT MAX(salary) FROM EMPLOYEES e
	SELECT MAX(salary) FROM EMPLOYEES e  WHERE  JOB_ID ='IT_PROG'
--	SELECT MIN(salary) FROM EMPLOYEES e 
--	SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG
); -- SELECT �ȿ� ���� �� �ٸ� SELECT �� ���������Դϴ�. ������� 1���̹Ƿ� = ���ǽĿ� ����� �� �ֽ��ϴ�.

--IT_PROG �߿��� �ּұ޿��� �޴� ����� first_name, last_name �÷���ȸ�ϱ�
SELECT First_name, last_name  FROM EMPLOYEES e WHERE 
SALARY =(SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID ='IT_PROG')
	AND JOB_ID = 'IT_PROG';



--�߰� : min_salary �� ��հ����� ���� ���� job_id, job_title �÷� ��ȸ -> group �����Ŀ� �ٽ� �غ��ô�.
-- �Ʒ� ����� ���� -> group ���� �Ŀ� �ٽ� �غ��ô�.
--SELECT job_id , job_title  FROM JOBS j WHERE MIN_SALARY  < AVG(MIN_SALARY);
--��� ��
SELECT JOB_ID , JOB_TITLE, MIN_SALARY  FROM JOBS j 
-- ��հ��� ���ǽĿ� �̿��ϱ�(��������)
WHERE MIN_SALARY < (SELECT AVG(MIN_SALARY) FROM JOBS j );



