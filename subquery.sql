--subquery  query에 또다른 query를 사용
--jones보다 높은 급여를 받는 사람
SELECT sal FROM emp WHERE ename = 'JONES';
SELECT ename, sal FROM emp WHERE sal >= 2975;

--server -> db
SELECT ename, sal 
FROM emp 
WHERE sal >= (SELECT sal FROM emp WHERE ename = 'JONES');
--하나의 값으로 쓰이는 subquery를 scalar subquery

--allen과 크거나 같은 comm을 받는 사람의 정보를 출력
SELECT comm FROM emp WHERE ename = 'ALLEN';
SELECT ename,comm 
FROM emp 
WHERE comm>=(SELECT comm FROM emp WHERE ename = 'ALLEN');

--scott 입사일이 빠른 사람
SELECT ename,HIREDATE 
FROM emp 
WHERE hiredate < (SELECT HIREDATE FROM emp WHERE ename = 'SCOTT');

--20번 부서 사원 중에서 전체사원의 평균 급여보다 많이받는 
--사원의 사번, 이름, 직업 , 급여, 부서정보
SELECT e.empno,e.ENAME ,e.JOB ,e.SAL , d.DEPTNO ,d.DNAME ,d.LOC 
FROM emp e
JOIN dept d
ON e.DEPTNO  = d.DEPTNO 
WHERE e.DEPTNO  = 20 AND e.sal > (SELECT avg(sal) FROM emp);

SELECT max(sal) AS maxSal  
FROM emp
GROUP BY deptno;

--각 부서의 최고급여와 같은 급여를 받는 사원 조회  부서별 최고 연봉자 찾기
SELECT * FROM EMP e 
WHERE sal IN (SELECT max(sal) AS maxSal  
FROM emp
GROUP BY deptno);

SELECT * FROM EMP e 
WHERE sal > ANY (SELECT max(sal) AS maxSal  
FROM emp
GROUP BY deptno);

-- ALL 는 모두 만족하면 true
-- ANY / ALL은 서브쿼리가 다중행을 반환할때 쓴다.
SELECT * FROM EMP e 
WHERE sal >= ALL (SELECT max(sal) AS maxSal  
FROM emp
GROUP BY deptno);

--exists는 하나라도 있으면 true 를 반환
SELECT * FROM EMP e 
WHERE NOT EXISTS (SELECT dname FROM dept WHERE deptno=50);




--1. 전체 평균 급여보다 많이 받는 사원을 조회하시오.
SELECT ename,sal FROM emp
WHERE sal >= (SELECT avg(sal) FROM emp);

--2. SMITH보다 급여를 많이 받는 사원을 조회하시오.
SELECT ename,sal FROM emp
WHERE sal >= (SELECT sal FROM emp WHERE ename = 'SMITH');

--3. 가장 높은 급여를 받는 사원을 조회하시오.
SELECT ENAME,SAL FROM EMP
WHERE sal >= (SELECT MAX(SAL) FROM EMP);

--4. 가장 낮은 급여를 받는 사원을 조회하시오.
SELECT ENAME,SAL FROM EMP
WHERE sal <= (SELECT MIN(SAL) FROM EMP);

--5. 평균 급여 이하를 받는 사원을 조회하시오.
SELECT ename,sal FROM emp
WHERE sal <= (SELECT avg(sal) FROM emp);

--6. 30번 부서의 최고 급여보다 많이 받는 사원을 조회하시오.
SELECT ename,sal FROM emp
WHERE sal >= (SELECT max(sal) FROM emp WHERE deptno = 30);

--7. 20번 부서의 최저 급여보다 적게 받는 사원을 조회하시오.
SELECT ename,sal FROM emp
WHERE sal <= (SELECT min(sal) FROM emp WHERE deptno = 20);

--8. 부서별 최고 급여자를 조회하시오.
SELECT ename,sal,deptno 
FROM emp
WHERE (deptno,sal) IN (
SELECT deptno,max(sal) FROM emp
GROUP BY deptno);

--9. 부서별 최저 급여자를 조회하시오.
SELECT ename,sal,deptno 
FROM emp
WHERE (deptno,sal) IN (
SELECT deptno,min(sal) FROM emp
GROUP BY deptno);

--10. KING과 같은 부서에 근무하는 사원을 조회하시오.
SELECT ename,deptno 
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'KING');
