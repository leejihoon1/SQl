--���� ���� ����1 
SELECT *FROM "TBL_PRODUCT#" tp , "TBL_BUY#" tb 
		WHERE tp.PCODE = tb.PCODE ; --���� ����
	
-- JOIN�� ���� ��ɹ� ����2(ǥ��)
SELECT *FROM "TBL_PRODUCT#" tp 
		JOIN "TBL_BUY#" tb 
		ON tp.PCODE =tb.PCODE ;
		
--���� : �����е�('IPAD011')�� ������ ������̸��� ���ų�¥ ��ȸ�ϱ�
--������ ���̺�? -> �����÷�?
SELECT tc.NAME, tb.BUY_DATE FROM  "TBL_CUSTOM#" tc ,"TBL_BUY#" tb  
		WHERE tc.CUSTOM_ID  = tb.CUSTOM_ID AND pcode = 'IPAD011';
		
SELECT tc.NAME , tb.BUY_DATE FROM "TBL_CUSTOM#" tc 
		JOIN "TBL_BUY#" tb ON tc.CUSTOM_ID = tb.CUSTOM_ID 
		WHERE pcode = 'IPAD011';
		
--day5 : ALTER table ����
-- �׽�Ʈ�� ���̺� : �÷���, ������ �ǹ� �����ϴ�.	
CREATE TABLE tbl# (
	acol varchar2(30) NOT NULL,
	bcol varchar2(10),
	ccol number(3)
);

INSERT INTO tbl#(ccol) values(12); -- ���� : NOT NULL�÷����� ����ȵ�
INSERT INTO tbl#(bcol,ccol) VALUES('xytz',12);-- ���� : NOT NULL�÷����� ����ȵ�
INSERT INTO tbl#(acol,ccol) values('main',12);--�������

--�÷� �߰�
ALTER TABLE tbl# ADD (dcol timestamp DEFAULT sysdate);
SELECT *FROM tbl#;

--�÷� ����
ALTER TABLE tbl# MODIFY (ccol NUMBER(3) DEFAULT '0');
INSERT INTO tbl#(acol,ccol) values('main22',12);
INSERT INTO tbl#(acol) values('main22'); -- ccol�� '0'

--�÷� ����(drop)
ALTER TABLE tbl# DROP COLUMN dcol;

--���� ���� �߰�(�������� �̸� ���� �ʿ�)
ALTER TABLE tbl# ADD CONSTRAINT pk_tbl# PRIMARY KEY(acol);
--���� INSERT ��ɶ����� �������� ����('main22'�� �ι���) -> �ߺ� �� ���� �� �⺻Ű �߰�
DELETE FROM "TBL#" t  WHERE acol = 'main22'AND ccol=0;

--���� ���������� ���� ��� �����ϴ�. -> ���� �������� ���� �� �ٽ� �����ؾ� �մϴ�.
ALTER TABLE "TBL#" DROP CONSTRAINT PK_tbl#;

-- tbl# ���̺� age �÷��� �����մϴ�. check ���� ���� : 16�̻� 90������ ��.(���ǽ�)
ALTER TABLE tbl# ADD age number(3) check(age BETWEEN 16 AND 90); 
--age >= 16 AND age <=90
INSERT INTO tbl#(acol,age) VALUES ('app',23); -- ����
INSERT INTO tbl#(acol,age) VALUES ('apps',23); -- ����
INSERT INTO tbl#(acol,age) VALUES ('app',99); -- ����

-- tbl# ���̺� gender(����) �÷��� �����մϴ�. check ���� ���� : 'M', 'F'
ALTER TABLE tbl# ADD gender char(1) check (gender IN ('M','F'));
INSERT INTO  tbl#(acol,gender)VALUES ('momo','F');
INSERT INTO  tbl#(acol,gender)VALUES ('momo','X'); --���� ���� ���� ����

--SELECT �� ����ϴ� ����Ŭ �Լ�
--��ȸ����� �����ϴ� �Լ� : ���� age�÷� ���� NULL�ϋ� 0, gender 'M'�̸� ����, 'F'�̸� ����
SELECT *FROM tbl#;
SELECT acol,nvl(age,0) AS age2, decode(gender,'M','����','F','����')  gender2 
FROM tbl#;
--nvl�� null value, ���̺��/�÷Ÿ� ��Ī�� asŰ���带 ���� ���� �� �� �ֽ��ϴ�.

--drop table 
DROP TABLE tbl22222#;








