--진짜 중요 정말 중요 
SELECT * FROM emp;
SELECT * FROM dept;  

--카타시안의 곱
SELECT * 
FROM emp,dept;

--table의 가로 확장  join
SELECT * 
FROM emp,dept
WHERE emp.DEPTNO = dept.DEPTNO;

SELECT e.empno,e.ename,e.job,e.mgr,e.HIREDATE ,e.sal,e.comm,
e.deptno, d.dname, d.loc
FROM emp e,dept d
WHERE e.DEPTNO = d.DEPTNO;

-- 등가조인
SELECT e.*,d.DNAME ,d.LOC 
FROM emp e,dept d
WHERE e.DEPTNO = d.DEPTNO;

SELECT * FROM SALGRADE s ;

--비등가조인
SELECT *
FROM emp e,salgrade s
WHERE e.SAL >= s.LOSAL  AND e.sal <= s.HISAL;

SELECT *
FROM emp e,salgrade s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL ;


--ansi join
SELECT * FROM emp e, dept d;

SELECT e.*,d.DNAME, d.LOC  
FROM emp e
JOIN dept d
ON e.DEPTNO = d.DEPTNO;

SELECT e.*,d.DNAME, d.LOC  
FROM emp e
CROSS JOIN dept d;

SELECT e.*,d.DNAME, d.LOC  
FROM emp e
JOIN dept d
ON 1 = 1;

SELECT *
FROM emp e,salgrade s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL ;

SELECT * 
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.HISAL;


