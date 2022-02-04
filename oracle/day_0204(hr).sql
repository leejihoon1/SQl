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
