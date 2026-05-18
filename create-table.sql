--  select  /  insert  /   update  / delete  /  DML
SELECT * FROM emp;

-- DDL
CREATE TABLE dept_temp AS SELECT * FROM dept;
SELECT * FROM dept_temp;
DROP TABLE dept_temp;
INSERT INTO dept_temp (deptno,dname,loc) 
       VALUES (70,'UI/UX','ILSAN');
INSERT INTO dept_temp (deptno,dname,loc) 
       VALUES (null,'UI/UX',null);

DELETE FROM DEPT_TEMP WHERE dname = 'UI/UX';
-- transaction
ROLLBACK;
COMMIT;


CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1 = 0;
SELECT * FROM emp_temp;
INSERT INTO emp_temp VALUES 
	(9999,'JJANG','CEO',NULL,to_date('2026-05-18','YYYY-MM-DD'),
	9000,7700,40);
INSERT INTO emp_temp VALUES 
	(9998,'LEEJAEYONG','CFO',NULL,to_date('2026-05-18','YYYY-MM-DD'),
	8000,9000,30);

INSERT INTO emp_temp (empno,ename,job,sal,deptno) VALUES 
	(9997,'KIM','CLERK',5000,30);

UPDATE emp_temp SET sal = 7000,ename = 'LEE' WHERE empno =  9998;

ROLLBACK;
COMMIT;


CREATE TABLE emp_copy AS SELECT * FROM emp;
CREATE TABLE dept_copy AS SELECT * FROM dept;
CREATE TABLE salgrade_copy AS SELECT * FROM salgrade;
SELECT * FROM dept_copy;
--1. dept_copy에 50번 부서를 추가하시오.
INSERT INTO dept_copy (deptno,dname,loc) VALUES (50,'IT','SEOUL');

--2. dept_copy에 60번 부서를 추가하시오.
INSERT INTO dept_copy (deptno,dname,loc) VALUES (60,'MARKETING','BUSAN');

--3. emp_copy에 신입 사원을 추가하시오.
INSERT INTO emp_copy (empno,ename,job,mgr,hiredate,sal,comm,deptno) 
VALUES (9001,'KIM','CLERK',7782,sysdate,1200,NULL,10);

--4. emp_copy에 사원을 추가하시오.
INSERT INTO emp_copy (empno,ename,job,mgr,hiredate,sal,comm,deptno) 
VALUES (9002,'LEE','SALESMAN',7698,sysdate,1500,300,30);
SELECT * FROM emp_copy;

--5. 컬럼명을 명시하여 emp_copy에 사원을 추가하시오.
INSERT INTO emp_copy (empno,ename,job,sal,deptno) 
VALUES (9003,'PARK','SALESMAN',1500,30);
SELECT * FROM emp_copy;

--6. dept_copy에 기존 40번 부서를 복사하여 70번 부서로 추가하시오.
INSERT INTO dept_copy(deptno,dname,loc) 
	SELECT 70, dname,loc FROM dept_copy WHERE deptno = 40;

--7. emp_copy에 30번 부서 사원들을 복사하여 추가하시오.
INSERT INTO emp_copy (empno,ename,job,mgr,hiredate,sal,comm,deptno) 
 SELECT empno+100, ename||'_c',job,mgr,hiredate,sal,comm,deptno 
 FROM emp_copy WHERE deptno = 30;


--8. emp_copy에 평균 급여보다 많이 받는 사원들을 복사하여 추가하시오.
INSERT INTO emp_copy (empno,ename,job,mgr,hiredate,sal,comm,deptno) 
 SELECT empno+200, ename||'_c',job,mgr,hiredate,sal,comm,deptno 
 FROM emp_copy WHERE sal > (SELECT avg(sal) FROM emp_copy);

--9. dept_copy에 emp_copy에 존재하는 부서번호만 신규 부서로 추가하시오.
--DEPTNO는 기존 부서번호 + 100
--DNAME은 'COPY_DEPT'
--LOC은 'UNKNOWN'
--중복 없이 추가
INSERT INTO dept_copy(deptno,dname,loc) 
	SELECT DISTINCT deptno+5, 'COPY_DEPT','UNKNOWN' FROM dept_copy;

--10. salgrade_copy에 새로운 급여 등급을 추가하시오.
--GRADE : 6
--LOSAL : 5001
--HISAL : 9999
INSERT INTO salgrade_copy(grade,losal,hisal)  VALUES (6,5001,9999);

--11. emp_copy에서 10번 부서 사원의 급여를 10% 인상하시오.
UPDATE emp_copy SET sal = sal*1.1 WHERE deptno = 10;

--12. emp_copy에서 직무가 SALESMAN인 사원의 커미션을 100 증가시키시오.
UPDATE emp_copy 
	SET comm = nvl(comm,0) + 100 WHERE job = 'SALESMAN';

--13. emp_copy에서 커미션이 NULL인 사원의 커미션을 0으로 변경하시오.
UPDATE emp_copy 
	SET comm = 0 WHERE comm IS NULL;

--14. dept_copy에서 50번 부서의 위치를 INCHEON으로 변경하시오.
UPDATE dept_copy SET loc = 'INCHEON' WHERE deptno = 50;

--15. emp_copy에서 SMITH의 급여를 전체 평균 급여로 변경하시오.
UPDATE emp_copy 
	SET sal = (SELECT avg(sal) FROM emp_copy) 
WHERE ename = 'SMITH';

--16. emp_copy에서 20번 부서 사원의 급여를 30번 부서 평균 급여만큼 증가시키시오.
UPDATE emp_copy 
	SET sal = (SELECT avg(sal) FROM emp_copy WHERE deptno = 30) 
WHERE deptno = 20;

--17. emp_copy에서 부서명이 SALES인 사원의 급여를 5% 인상하시오.
UPDATE emp_copy 
	SET sal = sal*1.05 
WHERE deptno = (SELECT deptno FROM dept_copy WHERE dname = 'SALES');

--18. emp_copy에서 최고 급여자의 직무를 TOP으로 변경하시오.
UPDATE emp_copy SET job = 'TOP' 
WHERE sal = (SELECT max(sal) FROM emp_copy);

--19. dept_copy에서 사원이 없는 부서의 지역을 EMPTY로 변경하시오.

SELECT * FROM salgrade_copy;

COMMIT;

select * FROM emp_copy;

SELECT * FROM emp_copy WHERE job = 'SALESMAN';

SELECT * FROM dept_copy;

DELETE FROM emp_copy WHERE empno = 9002;


ROLLBACK;
COMMIT;
