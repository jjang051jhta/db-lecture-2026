--cast   "11"  
SELECT empno + '500' AS plus500 FROM emp; --묵시적 변환
SELECT empno + TO_NUMBER('500') AS plus500 FROM emp; --명시적 변환

SELECT 
	sysdate,
	TO_CHAR(sysdate,'YYYY/MM/DD DAY HH24:MI:SS') AS formatDate,
	TO_CHAR(sysdate,'YYYY/MM/DD DAY AM HH:MI:SS') AS formatDateAPM,
	TO_CHAR(sysdate,'YYYY/MM/DD DY AM HH:MI:SS') AS formatDateDAY
FROM dual;

SELECT * FROM NLS_SESSION_PARAMETERS;
ALTER SESSION SET NLS_DATE_LANGUAGE=KOREAN;