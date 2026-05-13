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

