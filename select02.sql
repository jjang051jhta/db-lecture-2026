SELECT ename,empno,job,mgr FROM emp;
SELECT * FROM emp;
SELECT * FROM emp 
WHERE empno = 7369 OR ename = 'SMITH';
-- 연산자
--1. 비교연산자
SELECT * FROM EMP
WHERE sal >= 3000
ORDER BY sal DESC, empno ASC;

SELECT * FROM emp
WHERE sal <= 3000
ORDER BY sal;

SELECT * FROM emp
WHERE ename >= 'F';

SELECT * FROM emp
WHERE ename = 'SMITH';

--다르다
SELECT * FROM emp
WHERE sal != 3000;

SELECT * FROM emp
WHERE sal <> 3000;

SELECT * FROM emp
WHERE sal ^= 3000;
--quiz job이 MANAGER 또는 SALESMAN 또는 CLERK
SELECT * FROM emp
WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK'
ORDER BY job;

SELECT * FROM emp
WHERE job IN ('MANAGER','SALESMAN','CLERK')
ORDER BY job;

SELECT * FROM emp
WHERE deptno = 20 OR deptno = 30
ORDER BY deptno;

SELECT * FROM emp
WHERE deptno IN (20,30)
ORDER BY deptno;

SELECT * FROM emp
WHERE (deptno,job) IN ((20,'MANAGER'),(30,'CLERK'));

SELECT * FROM EMP 
WHERE 
(DEPTNO =20 AND job = 'MANAGER') OR 
(DEPTNO =30 AND job = 'CLERK');




