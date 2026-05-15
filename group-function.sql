--group function
--single function 
--SELECT comm, nvl(comm,0) FROM EMP;
SELECT sum(sal) FROM emp;

--일반컬럼을 다중행함수랑 같이 쓸려면 group by를 해야한다.
SELECT deptno , sum(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;


SELECT deptno , round(avg(sal),2)
FROM emp
GROUP BY deptno
ORDER BY deptno;

SELECT count(*) FROM emp;
SELECT count(comm),count(*) FROM emp;

--급여 가장 많이 받는 사람  subquery
SELECT ename,sal FROM emp
where sal >= (SELECT max(sal) FROM emp);

--가장 최근에 입사한 사람
SELECT max(hiredate) FROM emp;

--가장 오래전에 입사한 사람
SELECT min(hiredate) FROM emp;

--급여가 가장 작은 사람
SELECT ename,sal FROM emp
where sal <= (SELECT min(sal) FROM emp);

--중복은 제외
SELECT sum(sal),sum(DISTINCT sal) FROM emp;

--제일 급여 많이 받는 사람과 작게 받는 사람의 차이
SELECT max(sal) , 
       min(sal), 
       max(sal)-min(sal) AS diff 
FROM emp;

--group함수의 조건은 having을 쓴다.
SELECT deptno, avg(sal) AS avgSal  --5
FROM emp                 --1
WHERE sal >= 1000        --2 
GROUP BY deptno          --3
HAVING avg(sal) >= 2000  --4
ORDER BY DEPTNO;         --6


-- 부서별 인원수
SELECT deptno , count(*) 
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- 직급별(job)의 최고 급여
SELECT job , max(sal) AS maxSal
FROM emp
GROUP BY job
ORDER BY maxSal DESC;
-- 부서별 급여 총합
SELECT deptno , sum(sal) AS total
FROM emp
GROUP BY deptno
ORDER BY total DESC;

--1. 부서별 평균 급여를 구하고 평균 급여가 2000 이상인 부서만 출력하시오.
SELECT	deptno,avg(sal) AS avgSal
FROM emp
GROUP BY deptno
HAVING avg(sal) >= 2000
ORDER BY deptno;

--2. 직급별 사원 수를 구하고 사원 수가 3명 이상인 직급만 출력하시오.
SELECT	job,count(*) AS cnt
FROM emp
GROUP BY job
HAVING count(*) >= 3
ORDER BY cnt;

--3. 부서별 최고 급여와 최저 급여의 차이를 출력하시오.
SELECT deptno, max(sal) AS maxSal, min(sal) AS minSal,
	   max(sal) - min(sal) AS diff
FROM emp
GROUP BY deptno
ORDER BY deptno;

--4. 커미션을 받는 사원 수와 받지 않는 사원 수를 각각 출력하시오.
SELECT count(comm) AS bonus_on, 
       count(*) - count(comm) AS bonus_off
FROM emp;

--5. 입사 연도별 사원 수를 출력하시오.
SELECT TO_CHAR(HIREDATE ,'YYYY') AS hire_year,
       count(*) AS cnt
FROM emp
GROUP BY TO_CHAR(HIREDATE ,'YYYY')
ORDER BY HIRE_YEAR;

--6. 부서별 평균 급여를 구하고 전체 평균 급여보다 높은 부서만 출력하시오.
SELECT deptno, AVG(sal) AS avgSal
FROM emp
GROUP BY deptno
HAVING AVG(sal) > (SELECT  AVG(sal) FROM emp);

--7. 직급별 급여 총합을 구하고 급여 총합이 가장 높은 직급부터 출력하시오.
SELECT job, sum(sal) AS sumSal
FROM emp
GROUP BY job
ORDER BY sumSal;

--8. 부서별 사원 수와 평균 근속 개월 수를 출력하시오.
SELECT deptno, count(*) AS cnt,
       ROUND(AVG(MONTHS_BETWEEN(sysdate,hiredate))) AS avg_month
FROM emp
GROUP BY deptno;

--9. 직급별 최고 급여를 받는 사원의 급여를 출력하시오.
--조건 최고 급여가 3000 이상
SELECT job, max(sal) AS maxSal
FROM emp
GROUP BY job
HAVING max(sal) >= 3000;

--10. 부서별 평균 급여를 구한 뒤 평균 급여 순위가 높은 순으로 출력하시오.
SELECT deptno, round(avg(sal)) AS avgSal
FROM emp
GROUP BY deptno
ORDER BY avgSal desc;

