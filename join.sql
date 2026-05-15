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

SELECT * FROM emp;

SELECT *
FROM emp e,salgrade s
WHERE e.SAL BETWEEN s.LOSAL AND s.HISAL ;

SELECT * 
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.HISAL;

SELECT * FROM dept;
SELECT * FROM emp;

SELECT 
	e.ename,e.deptno, d.dname, d.loc
FROM emp e
RIGHT JOIN dept d
ON e.DEPTNO = d.DEPTNO;

SELECT * FROM emp;

--
SELECT e1.empno,e1.ename,e1.mgr , e2.empno, e2.ename AS mgrName
FROM emp e1
FULL OUTER JOIN emp e2
ON e1.mgr = e2.empno;


-- join > left join > right join > full join > cross join

--1. 사원 이름과 부서명을 출력하시오.
SELECT e.ename,e.deptno,d.dname 
FROM emp e
JOIN dept d
ON e.DEPTNO = d.DEPTNO;

--2. 사원 이름, 급여, 급여 등급을 출력하시오.
SELECT e.ename,e.sal,s.GRADE 
FROM emp e
JOIN SALGRADE s 
ON e.sal BETWEEN s.losal AND s.HISAL;

--3. 사원 이름과 관리자 이름을 함께 출력하시오.
SELECT e1.ename AS ename, nvl(e2.ENAME,'매니저 없음') AS manager_name
FROM emp e1
LEFT JOIN emp e2
ON e1.mgr = e2.EMPNO;

--4. 모든 사원의 이름과 부서명을 출력하시오.
SELECT nvl(e.ename,'부서원 없음'), d.dname 
FROM dept d 
LEFT JOIN emp e
ON e.deptno = d.deptno;

--5. 모든 부서의 부서명과 사원 이름을 출력하시오.
SELECT nvl(e.ename,'부서원 없음'), d.dname 
FROM dept d 
LEFT JOIN emp e
ON e.deptno = d.deptno;


--6. 사원 이름, 부서명, 근무 지역(loc)을 출력하시오.
SELECT e.ename,d.dname, d.loc
FROM emp e
JOIN dept d
ON e.DEPTNO = d.DEPTNO;

--7. 급여 등급이 4 이상인 사원의 이름과 급여를 출력하시오.
SELECT e.ENAME ,e.sal
FROM emp e
JOIN SALGRADE s
ON e.SAL BETWEEN s.losal AND s.hisal
WHERE s.GRADE >= 4;

--8. 사원 이름과 같은 부서에 근무하는 사원 수를 출력하시오.
SELECT e1.ename, count(e2.deptno) AS dept_cnt
FROM emp e1
JOIN emp e2
ON e1.DEPTNO = e2.deptno
GROUP BY e1.ename,e1.deptno;

--9. 관리자보다 급여를 많이 받는 사원의 이름과 급여를 출력하시오.
SELECT e1.ename AS ename, e1.sal AS emp_sal, 
       e2.ename AS mgr_name,e2.sal AS mgr_sal
FROM emp e1
JOIN emp e2
ON e1.mgr = e2.empno
WHERE e1.sal>e2.sal;

--10. 부서별 평균 급여와 부서명을 출력하시오.
SELECT d.DNAME ,nvl(round(avg(e.sal),2),0) AS avg_sal
FROM dept d
LEFT JOIN emp e
ON d.DEPTNO = e.DEPTNO
GROUP BY d.DNAME ;


