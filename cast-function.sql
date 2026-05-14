--cast   "11"  
SELECT empno + '500' AS plus500 FROM emp; --묵시적 변환
SELECT empno + TO_NUMBER('500') AS plus500 FROM emp; --명시적 변환

SELECT 
	sysdate,
	TO_CHAR(sysdate,'YYYY/MM/DD DAY HH24:MI:SS') AS formatDate,
	TO_CHAR(sysdate,'YYYY/MM/DD DAY AM HH:MI:SS') AS formatDateAPM,
	TO_CHAR(sysdate,'YYYY/MM/DD DY AM HH:MI:SS') AS formatDateDAY,
	TO_CHAR(sysdate,'YYYY/MONTH/DD DY AM HH:MI:SS') AS formatDateMonth,
	TO_CHAR(sysdate+30,'YYYY/MON/DD DY AM HH:MI:SS') AS formatDateMonth,
	TO_CHAR(sysdate+30,'YYYY/MON/DD DY AM HH:MI:SS',
						'NLS_DATE_LANGUAGE=JAPANESE') AS formatDateMonthNLS
FROM dual;

SELECT * FROM NLS_SESSION_PARAMETERS;
ALTER SESSION SET NLS_DATE_LANGUAGE=AMERICAN;


SELECT 
	sysdate,
	'2026-05-14',
	TO_DATE('2026-05-14','YYYY-MM-DD') AS formatDate01,
	TO_DATE('2026/05/14','YYYY/MM/DD') AS formatDate02,
	TO_DATE('2026/05/14 13:25:15','YYYY/MM/DD HH24:MI:SS') AS formatDate03
FROM dual;


--문자를 숫자로
SELECT 
	'100'+'100' AS implicit,
	TO_NUMBER('100')+TO_NUMBER('100') AS explicit
FROM dual;


SELECT 
	TO_NUMBER('1,000,000','999,999,999') AS format01,
	TO_NUMBER('   100   ') AS format02,
	TO_NUMBER('   -100   ') AS format03
FROM dual;

SELECT 
	999,
	TO_CHAR(999,'99999') AS format01,
	TO_CHAR(999,'00000') AS format02,
	TO_CHAR(999,'fm99999') AS format03 --fm을 붙이면 공백을 없앤다.
FROM dual;

SELECT 
	empno,
	TO_CHAR(empno,'fm99999999'),
	TO_CHAR(empno,'00000000')
FROM emp;

--0은 채우기 9는 공백
SELECT 
	sal,
	TO_CHAR(989898989,'fm999,999,999,999.000')
FROM emp;

--0.45
SELECT 
	TO_CHAR(0.45555,'fm99990.99')
FROM dual;




--1. 급여를 천 단위 콤마 형식으로 출력하시오.
SELECT ename,sal, TO_CHAR(sal,'fm999,999') FROM emp;

--2. 급여를 ￦1,250 형식으로 출력하시오.
SELECT ename,sal, TO_CHAR(sal,'L999,999') FROM emp;
SELECT ename,sal, TO_CHAR(sal,'L999,999','NLS_CURRENCY = ₩') FROM emp;

--3. 급여를 소수 둘째 자리까지 표시하시오.
SELECT ename,sal, TO_CHAR(sal,'fm99,999.00') FROM emp;

--4. 사원번호를 6자리로 맞추고 앞자리는 0으로 채우시오.
SELECT empno,ename, TO_CHAR(empno,'000000') FROM emp;

--5. 커미션이 NULL이면 0으로 처리한 뒤 천 단위 콤마로 출력하시오.
SELECT ename,comm, TO_CHAR(NVL(comm,0),'fm999,999') FROM emp;

--6. 급여와 커미션의 합계를 구하고 천 단위 콤마로 출력하시오.
SELECT ename,sal,comm, TO_CHAR(sal+NVL(comm,0),'fm999,999') AS total FROM emp;

--7. 문자열 '1,250'을 숫자로 변환한 뒤 10을 곱하시오.
SELECT TO_NUMBER('1,250','9,999')*10 FROM dual;

--8. 문자열 '000123'을 숫자로 변환한 뒤 100을 더하시오.
SELECT TO_NUMBER('000123')+100 FROM dual;


--9. 문자열 '12,345.67'을 숫자로 변환하시오.
SELECT TO_NUMBER('12,345.67','99,999.99') FROM dual;

--10. 문자열 '2026-05-14'를 날짜로 변환한 뒤 7일 후 날짜를 출력하시오.
SELECT TO_DATE('2026-05-14','YYYY-MM-DD')+7 FROM dual;




