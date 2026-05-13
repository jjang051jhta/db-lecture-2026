SELECT * FROM emp; --crud 
-- SELECT,INSERT , DELETE, UPDATE  DML
SELECT empno, ename, job FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;

SELECT DISTINCT job, deptno FROM emp;
SELECT ALL job,deptno FROM emp;

-- 별칭(alias)를 정할때는 as 를 쓴다.
SELECT ename AS name,sal*12 AS annsal FROM emp;

--order by 순서 정하기 오름 차순/내림차순 
SELECT * FROM emp ORDER BY sal desc;
--1 empno 기준으로 내림 차순 정렬
SELECT * FROM emp ORDER BY empno desc;
SELECT ename,sal, deptno FROM emp ORDER BY deptno,sal desc;

--answer01
SELECT empno AS 사원번호, ename AS 사원이름 FROM emp;

--answer02
SELECT  distinct job FROM emp;

--answer03
SELECT 
	empno AS employee_no, 
	ename AS employee_name, 
	mgr AS manager, 
	sal AS salary, 
	comm AS commission, 
	deptno AS department_no
FROM emp;

SELECT * FROM emp 
WHERE deptno = 30;


SELECT * FROM emp
WHERE empno = 7369;

-- 값의 경우는 대소문자 구분
SELECT * FROM emp
WHERE deptno = 30 AND job = 'SALESMAN';

-- 사원번호가 7499이고 부서번호가 30인 사람 출력
SELECT * FROM emp
WHERE deptno = 30 AND empno = 7499;

SELECT * FROM emp
WHERE deptno = 30 OR job = 'CLERK';

SELECT * FROM emp
WHERE NOT deptno = 20;

-- 산술연산자
SELECT * FROM EMP
WHERE sal*12 = 36000;

SELECT * FROM EMP
WHERE sal+sal+sal+sal = 12000;

SELECT sal , sal+1000 AS plus_sal, sal*12 AS annsal FROM emp;

--null은 연산이 안됨
SELECT ename,comm+1000 AS plus_comm FROM emp;

--null은 연산이 안됨
SELECT ename,nvl(comm,0)+1000 AS plus_comm FROM emp;






