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

SELECT * FROM emp
WHERE job NOT IN ('MANAGER','SALESMAN','CLERK')
ORDER BY job;

--급여가 2000이상 3000이하인 사람
SELECT * FROM emp
WHERE sal >=2000 AND sal<=3000
ORDER BY sal;

SELECT * FROM emp
WHERE sal between 2000 AND 3000
ORDER BY sal;

SELECT * FROM emp
WHERE sal NOT between 2000 AND 3000
ORDER BY sal;

SELECT * FROM EMP
WHERE ename = 'SMITH';

--   _  %(아무거나)
SELECT * FROM EMP
WHERE ename LIKE 'S%';

SELECT * FROM EMP
WHERE ename LIKE '%ER';

SELECT * FROM EMP
WHERE ename LIKE '%AR%';

--M이 먼저나오고 I가 나중에 나오는 모든 사람
SELECT * FROM EMP
WHERE ename LIKE '%M%I%';  

SELECT * FROM EMP
WHERE ename LIKE '_____';  

--이름이 5글자이면서 S로 끝나는 사람
SELECT * FROM EMP
WHERE ename LIKE '____S';

-- 이름의 두번째 글자가 L인 사람
SELECT * FROM EMP
WHERE ename LIKE '_L%';

--NULL = 검색이 안됨  is null
SELECT * FROM emp
WHERE comm IS NULL;

SELECT * FROM emp
WHERE comm IS NOT NULL;

--1. 급여가 3000 이상인 사원을 조회하세요.
SELECT * FROM EMP e WHERE sal >= 3000;

--2. 급여가 1500보다 작은 사원을 조회하세요.
SELECT * FROM EMP e WHERE sal < 1500;

--3. 부서번호가 10번인 사원을 조회하세요.
SELECT * FROM EMP e WHERE deptno = 10;

--4. 직업이 MANAGER가 아닌 사원을 조회하세요.
SELECT * FROM EMP e WHERE job != 'MANAGER';

--5. 급여가 1000 이상 3000 이하인 사원을 조회하세요.
SELECT * FROM EMP e WHERE sal>=1000 AND sal <=3000;
SELECT * FROM EMP e WHERE sal BETWEEN 1000 AND 3000;

--6. 급여가 1000 이상 3000 이하가 아닌 사원을 조회하세요.
SELECT * FROM EMP e WHERE NOT (sal >= 1000 AND sal <= 3000);
SELECT * FROM EMP WHERE sal NOT BETWEEN 1000 AND 3000;

--7. 부서번호가 10, 20, 30 중 하나인 사원을 조회하세요.
SELECT * FROM EMP WHERE DEPTNO IN (10,20,30);

--8. 직업이 CLERK, SALESMAN, MANAGER 중 하나인 사원을 조회하세요.
SELECT * FROM EMP WHERE JOB IN ('CLERK', 'SALESMAN', 'MANAGER');

--9. 직업이 PRESIDENT, ANALYST가 아닌 사원을 조회하세요.
SELECT * FROM EMP WHERE JOB NOT IN ('PRESIDENT', 'ANALYST');

--10. 사원 이름이 S로 시작하는 사원을 조회하세요.
SELECT * FROM EMP WHERE ENAME LIKE  'S%';

--11. 사원 이름에 A가 포함된 사원을 조회하세요.
SELECT * FROM EMP WHERE ENAME LIKE  '%A%';

--12. 사원 이름이 N으로 끝나는 사원을 조회하세요.
SELECT * FROM EMP WHERE ENAME LIKE  '%N';

--13. 사원 이름의 두 번째 글자가 A인 사원을 조회하세요.
SELECT * FROM EMP WHERE ENAME LIKE  '_A%';

--14. 사원 이름에 M이 먼저 나오고, 그 뒤에 I가 나오는 사원을 조회하세요.
SELECT * FROM EMP WHERE ENAME LIKE  '%M%I%';

--15. 급여에 500을 더한 결과를 출력하세요.
SELECT ename,sal,sal+500 AS salplus500 FROM EMP ;

--16. 급여에서 100을 뺀 결과를 출력하세요.
SELECT ename,sal,sal-100 AS salminus100 FROM EMP ;

--17. 급여의 12개월 연봉을 출력하세요.
SELECT ename,sal,sal*12 AS annsal FROM EMP ;

--18. 급여를 30으로 나눈 하루 급여를 출력하세요.
SELECT ename,sal,sal/30 AS ildang FROM EMP ;

--19. 급여가 2000 이상이고 부서번호가 20번인 사원을 조회하세요.
SELECT * FROM EMP WHERE sal>=2000 AND deptno=20;

--20. 급여가 1500 이상이거나 직업이 SALESMAN인 사원을 조회하세요.
SELECT * FROM EMP WHERE sal>=1500 OR job='SALESMAN';

--21. 부서번호가 30번이고 직업이 SALESMAN인 사원을 조회하세요.
SELECT * FROM EMP WHERE deptno=30 AND job='SALESMAN';

--22. 직업이 CLERK 또는 MANAGER이고 급여가 1000 이상인 사원을 조회하세요.
SELECT * FROM EMP WHERE job IN ('CLERK','MANAGER') AND sal >=1000;

--23. 급여가 1200 이상 2500 이하이고 부서번호가 30번인 사원을 조회하세요.
SELECT * FROM EMP WHERE sal BETWEEN 1200 AND 2500 AND deptno=30;

--24. 사원 이름이 A로 시작하지 않는 사원을 조회하세요.
SELECT * FROM EMP WHERE ename NOT LIKE 'A%';

--25. 사원 이름에 L이 포함되지 않는 사원을 조회하세요.
SELECT * FROM EMP WHERE ename NOT LIKE '%L%';

--26. 직업이 MANAGER, CLERK 중 하나이고 부서번호가 10 또는 20인 사원을 조회하세요.
SELECT * FROM EMP WHERE job IN ('CLERK','MANAGER') AND deptno IN (10,20);

--27. 급여에 10% 인상한 금액을 출력하세요.
SELECT ename,sal,sal*1.1 FROM EMP;

--28. 급여에 커미션(COMM)을 더한 총액을 출력하세요.
    --단, COMM이 NULL인 경우는 제외하세요.
SELECT ename,sal,comm, sal+comm FROM EMP WHERE comm IS NOT null;

--29. 급여가 2000보다 크고 4000보다 작거나,
    --직업이 PRESIDENT인 사원을 조회하세요.
SELECT * FROM EMP WHERE (sal>2000 AND sal<4000) OR job = 'PRESIDENT';

--30. 사원 이름이 5글자인 사원을 LIKE를 이용해서 조회하세요.
SELECT * FROM EMP WHERE ename LIKE '_____' ;






















