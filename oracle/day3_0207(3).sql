-- ���� : ���θ�(���� ��ǰ�� �����մϴ�.)
-- �����̺�
CREATE  TABLE tbl_custom(
	custom_id varchar2(20), --����/����/��ȣ
	name nvarchar2(20),     -- �ѱ� �� �ٱ��� ���� ����
	email varchar2(20),
	age number(3),
	reg_date timestamp DEFAULT sysdate
);
--��ǰ ���̺� : ��ǰ�ڵ� (�������� 20�ڸ�),ī�װ�(�������� 2�ڸ�)
						-- A1:������ǰ, B1:��ǰ
CREATE TABLE tbl_product(
	pcode varchar2(20),
	category char(2),
	pname nvarchar2(20),
	price number(9)
);

--���� ���̺� : ��� ���� ���� ��ǰ�� �����ϴ°�?
CREATE TABLE tbl_buy(
	custom_id varchar2(20),
	pcode varchar2(20),
	quantity number(5),  -- ����
	buy_date timestamp
);

--�������� �߰� : INSERT
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('mina012', '��̳�', 'kimm@gmail.com', 20, sysdate);
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('hongGD', 'ȫ�浿', 'gil@korea.com', 32, sysdate);
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('twice', '�ڸ��', 'momo@daum.net', 29, sysdate);
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�̳���', 'lee@naver.com', 40, sysdate);

-- �߿�1 : custom ���̺��� ��(row)�����͸� ������ CUSTOM_ID, PCODE �� �ߺ��Ǹ� �ȵ˴ϴ�.
INSERT INTO IDEV.TBL_CUSTOM(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)
VALUES('wonder', '�ָ��', 'choi@naver.com', 33, sysdate);

INSERT INTO IDEV.TBL_PRODUCT(PCODE, CATEGORY, PNAME, PRICE)
VALUES('IPAD011', 'A1', '�����е�10', 880000);
INSERT INTO IDEV.TBL_PRODUCT(PCODE, CATEGORY, PNAME, PRICE)
VALUES('DOWON123a', 'B1', '������ġ������Ʈ', 54000);
INSERT INTO IDEV.TBL_PRODUCT(PCODE, CATEGORY, PNAME, PRICE)
VALUES('dk_143', 'A2', '��ǵ���ũ', 234500);

--�߿�2 : ������� PRICE, QUANTITY ���� �÷��� �� �ʼ� �����ͷ� ����Ǿ�� �մϴ�.
INSERT INTO IDEV.TBL_PRODUCT(PCODE, CATEGORY, PNAME)
VALUES('dk_143', 'A2', '�ڵ���ǵ���ũ');

--��̳��� �����е� 1���� ��������
--ȫ�浿�� �����е� 2���� ���ñ���
--�̳��� ��ġ������Ʈ 3���� ��������
--��̳��� ��ǵ���ũ 1���� ���ñ���
--�ڸ�� ��ġ������Ʈ 2���� ���ñ���

INSERT INTO IDEV.TBL_BUY(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'IPAD011', 1, '2022-02-06');
INSERT INTO IDEV.TBL_BUY(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('hongGD', 'IPAD011', 2, sysdate);
INSERT INTO IDEV.TBL_BUY(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('wonder', 'DOWON123a', 3, '2022-02-06');
INSERT INTO IDEV.TBL_BUY(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('mina012', 'dk_143', 1, sysdate);
INSERT INTO IDEV.TBL_BUY(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('twice', 'DOWON123a', 2, sysdate);

--�߿�3 :  ���� ��ǰ���̺� ���� CUSTOM_ID, PCODE �÷� ���� ����ϸ� ����Ȯ�� ������
INSERT INTO IDEV.TBL_BUY(CUSTOM_ID, PCODE, QUANTITY, BUY_DATE)
VALUES('min012', 'd_143', 1, sysdate);

SELECT *FROM TBL_BUY tb;
SELECT *FROM TBL_PRODUCT tp;
SELECT *FROM TBL_CUSTOM tc ;



