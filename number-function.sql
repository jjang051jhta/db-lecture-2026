-- 숫자관련 함수  정수/실수  number
SELECT  
	ROUND(123.456789,1)  ,
	ROUND(123.456789,2)  ,
	ROUND(123.456489,3)  ,
	ROUND(123.456489,-1) ,
	ROUND(123.456489,-2) ,
	ROUND(152.456489,-2) ,
	ROUND(2652.456489,-2)
FROM dual;

--대신 오라클 전용    mysql/oracle/postgre  rdbms   sql
SELECT  
	TRUNC(123.456789,1) ,
	TRUNC(123.456789,2) ,
	TRUNC(123.456789,3) ,
	TRUNC(123.456789,-1),
	TRUNC(123.456789,-2)
FROM dual;

SELECT  
	CEIL(123.456789) ,  -- 무조건 큰 정수로 올림
	FLOOR(123.756789) , -- 무조건 작은 정수로 내림
	CEIL(-123.156489) ,  
	FLOOR(-123.456489) 
FROM dual;

SELECT 
	MOD(10,3) --나머지 연산
FROM  dual;

SELECT empno,ename
FROM emp
WHERE MOD(empno,2)=0;

SELECT 
	POWER(10,2),
	POWER(3,3),
	SQRT(25),
	SQRT(9)
FROM dual;





