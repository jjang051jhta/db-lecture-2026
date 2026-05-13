--  내장함수
--1. 문자관련 함수
SELECT 
	ename, 
	lower(ename) AS lower ,
	upper(ename) AS upper,
	initCap(ename) AS capitalize
FROM emp;

SELECT * FROM emp WHERE lower(ename) = lower('smith');

SELECT * FROM emp WHERE ename LIKE '_____%';

SELECT ename,LENGTH(ename)  FROM emp;

--dual은 dummy table
SELECT length('hello'),length('안녕'), 
       lengthb('hello'),lengthb('안녕')
FROM dual;

SELECT * FROM emp
WHERE length(ename) >= 5;

SELECT ename,length(ename) AS nameLength FROM emp
WHERE length(ename) >= 5
ORDER BY nameLength;
--1. from emp
--2. where 
--3. group by
--4. having
--5. select
--6. order by
--별칭은 where에 쓸 수 없다.

SELECT ename, substr(ename,1,3), substr(ename,2), substr(ename,-3,2)
FROM emp;
SELECT ename || '**'
FROM emp;
--S***H
SELECT ename, substr(ename,1,1) || '***' || substr(ename,-1) AS markingName 
FROM emp;

-- ||은 문자열을 연결할때 쓰지만 오라클에서만 사용가능
-- 표준은 concat('문자열','문자열')을 사용한다.
SELECT ename,ename||'**' FROM emp;

SELECT ename, concat(concat(substr(ename,1,1) ,'***'),substr(ename,-1)) AS markingName 
FROM emp;


SELECT substr('012203-1234567',1,6) FROM dual;
SELECT substr('012203-1234567',8,1) FROM dual;
SELECT substr('01025822242',-4) FROM dual;

SELECT instr('HELLO ORACLE!','L') ,
       instr('HELLO ORACLE!','L',5),
       instr('HELLO ORACLE!','L',4,2),
       instr('HELLO ORACLE!','L',-1),
       instr('HELLO ORACLE!','L')
FROM  dual;
-- 이름중에 S가 포함되어 있는 emp
SELECT * FROM emp WHERE ename LIKE '%S%';
SELECT * FROM emp WHERE instr(ename,'S') > 0;

--공백제거
SELECT trim('  HELLO  ') ,
       ltrim('  HELLO  ') ,
       rtrim('  HELLO  ')
FROM dual;

--대치 replace
SELECT REPLACE(' H  E LL O',' ','') FROM dual;
SELECT REPLACE('010-1234-5678','-','') FROM dual;
SELECT 'A1B2C3' FROM dual;
SELECT REGEXP_REPLACE('A1B2C3','[^A-Za-z]','') FROM dual;

--채우기
SELECT lpad('77',3,'0') FROM dual;
SELECT rpad('A',5,'*') FROM dual;


SELECT ename,
	   substr(ename,1,1)|| rpad('*',LENGTH(ename)-2,'*')||substr(ename,-1)
FROM emp;
SELECT
	'장성호',
	substr('장성호', 1, 1)|| rpad('*', LENGTH('장성호')-2, '*')|| substr('장성호',-1)
FROM
	dual; 
 












