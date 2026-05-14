--날짜 함수  
-- sysdate는 dbtimezone 기준으로 출력
SELECT sysdate FROM dual;

SELECT dbtimezone,sessiontimezone FROM dual;

SELECT current_date FROM dual;

SELECT SYSTIMESTAMP FROM dual;

-- 미지의 서울 sysdate - 1 는 지나갔고 sysdate + 1은 오지않았고 
-- 오늘은 아직 모르고
SELECT sysdate ,
  	   sysdate + 1 AS tomorrow,
  	   sysdate - 1 AS yesterday
FROM dual;

SELECT sysdate ,
  	   sysdate + 1/24 AS --1 hour later,
FROM dual;

--월 더하기
SELECT ADD_MONTHS(sysdate,1),
       ADD_MONTHS(sysdate,12),
       ADD_MONTHS(sysdate,12*10),
       ADD_MONTHS(sysdate,-2)
FROM dual;


SELECT ADD_MONTHS(hiredate,120) AS ten_annuary 
FROM emp;

--개월 차이
SELECT
	hiredate,
	MONTHS_BETWEEN(sysdate, hiredate) AS work_month,
	trunc(MONTHS_BETWEEN(sysdate, hiredate)/ 12) AS work_month02
FROM
	emp;



--년 월 일 추출
SELECT 
	EXTRACT(YEAR FROM sysdate) AS year,
	EXTRACT(MONTH FROM sysdate) AS month,
	EXTRACT(day FROM sysdate) AS day
FROM dual;


--마지막 날짜  해당 날짜가 속한 마지막 날
SELECT LAST_DAY(sysdate) FROM dual;

--해당날짜 기준으로 다음 월요일 찾기
SELECT NEXT_DAY(sysdate,'MONDAY') FROM dual;

--다음달 첫번째 금요일
SELECT NEXT_DAY(LAST_DAY(sysdate),'FRIDAY') FROM dual;

--이번달 마지막 금요일
SELECT NEXT_DAY(LAST_DAY(sysdate)-7,'FRIDAY') FROM dual;


SELECT 
	sysdate ,
	round(sysdate) AS formatTime, --12기준으로 다음날짜
	round(sysdate,'CC') AS formatCC, --세기 기준으로 다음 세기  2001
	round(sysdate,'YYYY') AS formatYear, --6월30일 기준 다음 년도  
	round(sysdate,'MM') AS formatMonth, --15일 기준 다음 달 이번 달  
	round(sysdate,'Q') AS formatQuater, --분기 기준  
	round(sysdate,'DDD') AS formatDay, --하루 기준  12시 기준으로 오늘 또는 내일
	round(sysdate,'HH') AS formatHour --30분기준으로 다음 시간 현재 시간
FROM dual
UNION 
SELECT 
	sysdate ,
	trunc(sysdate) AS formatTime, --12기준으로 다음날짜
	trunc(sysdate,'CC') AS formatCC, --세기 기준으로 다음 세기  2001
	trunc(sysdate,'YYYY') AS formatYear, --6월30일 기준 다음 년도  
	trunc(sysdate,'MM') AS formatMonth, --15일 기준 다음 달 이번 달  
	trunc(sysdate,'Q') AS formatQuater, --분기 기준  
	trunc(sysdate,'DDD') AS formatDay, --하루 기준  12시 기준으로 오늘 또는 내일
	trunc(sysdate,'HH') AS formatHour --30분기준으로 다음 시간 현재 시간
FROM dual;



