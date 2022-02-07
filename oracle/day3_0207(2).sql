--��¥ Ÿ�� : date, timestamp (timezone ����)
CREATE TABLE table_date(
	acol DATE,
	bcol timestamp,
	ccol timestamp DEFAULT sysdate 
	-- ���� ���������� �� �⺻��(default) : sysdate�� ���� ��¥ / �ð� 
	-- Ŭ���̾�Ʈ ��ǻ���� �ð��� current_date
);
--��¥������ ���ڿ� Ÿ�԰� �ڵ�ĳ������ �˴ϴ�. ''�ȿ� yyyy-mm-dd hh:mm:ss ���ڿ� �������� �ۼ�.
INSERT INTO IDEV.TABLE_DATE (ACOL, BCOL)
VALUES('2022-02-07', '2022-02-07');

SELECT *FROM table_date;

--���ڿ� Ÿ��
--CHAR(����) : ��������, ������ byte
--VARCHAR(����) : ����Ŭ���� �����ϰ� ������� �ʴ� �����ڷ���.
--VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE table_string(
	acol char(10),
	bcol varchar2(10),
	ccol nchar(10),
	dcol nvarchar2(10)
);
--CHAR Ÿ�� Ȯ��
INSERT INTO table_string(acol) VALUES('abcdefghij');
INSERT INTO table_string(acol) VALUES('abcde');
INSERT INTO table_string(acol) VALUES('�����ٶ�'); -- ���� :  4���� * 3����Ʈ 
INSERT INTO table_string(acol) VALUES('������');

--VARCHAR2 Ÿ�� Ȯ�� : CHAR�� �� ���� �� �߰��Ǵ� ������ �����ϴ�.
INSERT INTO table_string(bcol) VALUES('abcdefghij');
INSERT INTO table_string(bcol) VALUES('abcde');
INSERT INTO table_string(bcol) VALUES('�����ٶ�'); -- ���� :  4���� * 3����Ʈ 
INSERT INTO table_string(bcol) VALUES('������');

--NCAHR Ÿ�� Ȯ�� : ��������, ������ ���ڰ���
INSERT INTO table_string(ccol) VALUES('abcdefghij');
INSERT INTO table_string(ccol) VALUES('abcde');
INSERT INTO table_string(ccol) VALUES('�����ٶ�'); -- ���� :  4���� * 3����Ʈ 
INSERT INTO table_string(ccol) VALUES('�����ٶ󸶹ٻ������'); -- 10���ڴ� OK
INSERT INTO table_string(ccol) VALUES('�����ٶ󸶹ٻ������ī'); -- 11���ڴ� ����

--NVARCAHR2 Ÿ�� Ȯ�� : ��������, ������ ���ڰ���, NCAHR �������� �߰��Ǵ� ���� �����ϴ�.
INSERT INTO table_string(dcol) VALUES('abcdefghij');
INSERT INTO table_string(dcol) VALUES('abcde');
INSERT INTO table_string(dcol) VALUES('�����ٶ�'); -- ���� :  4���� * 3����Ʈ 
INSERT INTO table_string(dcol) VALUES('�����ٶ󸶹ٻ������'); -- 10���ڴ� OK
INSERT INTO table_string(dcol) VALUES('�����ٶ󸶹ٻ������ī'); -- 11���ڴ� ����

--�������� ���ڰ� ���ǰ� ����ɶ� NVARCHAR2 ���ڼ��� ����ϴ� ���� �ǰ�����Դϴ�.





