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
 



--1 .사원 이름을 대문자로 출력하시오.
SELECT upper(ename) FROM emp;

--2 .사원 이름을 소문자로 출력하시오.
SELECT lower(ename) FROM emp;

--3. 사원 이름의 첫 글자만 대문자로 출력하시오.
SELECT initcap(ename) FROM emp;

--4. 사원 이름의 글자 수를 출력하시오.
SELECT length(ename) FROM emp;

--5. 사원 이름의 앞 3글자만 출력하시오.
SELECT substr(ename,1,3) FROM emp;

--6. 사원 이름의 마지막 2글자만 출력하시오.
SELECT substr(ename,-2) FROM emp;

--7. 사원 이름의 두 번째 글자부터 끝까지 출력하시오.
SELECT substr(ename,2) FROM emp;

--8. 사원 이름에 A가 포함된 사원만 출력하시오.
SELECT ename FROM emp WHERE ename LIKE '%A%';

--9. 사원 이름에서 A를 *로 바꿔 출력하시오.
SELECT ename FROM emp WHERE ename LIKE '%A%';

--10. 사원 이름 앞에 EMP_를 붙여 출력하시오.
SELECT 'EMP_' || ename FROM emp;
SELECT CONCAT('EMP_', ename) FROM emp;


--11. 11. 사원 이름 뒤에 _USER를 붙여 출력하시오.
SELECT ename || '_USER' FROM emp;
SELECT CONCAT( ename,'_USER') FROM emp;

--12. 사원 이름의 앞뒤에 [ ]를 붙여 출력하시오.
SELECT '['||ename || ']' FROM emp;
SELECT CONCAT(CONCAT('[', ename),']') FROM emp;

--13. 사원 이름을 전체 길이 10자리로 만들고, 왼쪽 빈 공간을 *로 채우시오.
SELECT LPAD(ename,10,'*') FROM emp;

--14. 사원 이름을 전체 길이 10자리로 만들고, 오른쪽 빈 공간을 *로 채우시오.
SELECT RPAD(ename,10,'*') FROM emp;

--15. 사원 이름의 첫 글자만 출력하시오.
SELECT SUBSTR(ename,1,1) FROM emp;

--16. 사원 이름의 마지막 글자만 출력하시오.
SELECT SUBSTR(ename,-1) FROM emp;

--17. 사원 이름의 첫 글자와 마지막 글자만 이어서 출력하시오.
SELECT SUBSTR(ename,1,1)||SUBSTR(ename,-1) FROM emp;
SELECT CONCAT(SUBSTR(ename,1,1),SUBSTR(ename,-1)) FROM emp;

--18. 사원 이름의 첫 글자만 남기고 나머지는 ***로 출력하시오.
SELECT CONCAT(SUBSTR(ename,1,1),'***') FROM emp;

--19. 사원 이름의 마지막 글자만 남기고 앞에는 ***를 붙여 출력하시오.
SELECT CONCAT('***',SUBSTR(ename,-1)) FROM emp;

--20. 사원 이름이 5글자 이상인 사원만 출력하시오.
SELECT ename FROM emp WHERE LENGTH(ename)>=5;

--21. 사원 이름이 4글자인 사원만 출력하시오.
SELECT ename FROM emp WHERE LENGTH(ename) = 4;
SELECT ename FROM emp WHERE ename LIKE '____';


--22. 사원 이름에서 L의 위치를 출력하시오.
SELECT instr(ename,'L') FROM emp;

--23. 사원 이름에 T가 포함된 사원만 출력하시오.
SELECT ename FROM emp WHERE ename LIKE '%T%';

--24. 사원 이름에서 S를 $로 바꿔 출력하시오.
SELECT REPLACE(ename,'S','$') FROM emp;

--25. 사원 이름의 앞 2글자만 출력하시오.
SELECT SUBSTR(ename,1,2) FROM emp;


--26. 사원 이름의 뒤 3글자만 출력하시오.
SELECT SUBSTR(ename,-3) FROM emp;

--27. 사원 이름의 앞 2글자와 뒤 2글자를 이어서 출력하시오.
SELECT CONCAT( SUBSTR(ename,1,2),SUBSTR(ename,-2)) FROM emp;

--28. 사원 이름을 소문자로 바꾼 뒤 _emp를 붙여 출력하시오.
SELECT CONCAT( lower(ename),'_emp') FROM emp;

--29. 사원 이름의 앞 2글자만 남기고 뒤에는 ***를 붙여 출력하시오.
SELECT CONCAT( SUBSTR(ename,1,2),'***') FROM emp;

--30. 사원 이름의 앞 1글자와 뒤 1글자 사이에 ***를 넣어 출력하시오.
SELECT CONCAT(CONCAT( SUBSTR(ename,1,1),'***'),SUBSTR(ename,-1)) FROM emp;







