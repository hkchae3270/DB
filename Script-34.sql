-- 2.

SELECT * FROM PRODUCT 
ORDER BY price DESC

-- 3.

SELECT NAME, CONTENT, PRICE, COMPANY 
FROM PRODUCT 
ORDER BY COMPANY 

-- 4. 

SELECT DISTINCT COMPANY 
FROM PRODUCT 

-- 5. 

SELECT price * 5 AS price5 
FROM PRODUCT

-- 6.

SELECT NAME, COMPANY 
FROM PRODUCT 
WHERE PRICE = 5000

-- 7. 

SELECT PRICE, COMPANY 
FROM PRODUCT 
WHERE PRICE BETWEEN 3000 AND 6000 

-- 8. 

SELECT NAME, COMPANY 
FROM PRODUCT 
WHERE COMPANY != 'c100'

-- 9.

SELECT NAME, PRICE 
FROM PRODUCT 
WHERE COMPANY = 'c100' OR COMPANY  = 'c200'

-- 10. 조건 건색(문자열 포함)

SELECT * 
FROM PRODUCT 
WHERE NAME LIKE '%4'

-- 11. 조건 건색(문자열 포함)

SELECT * 
FROM PRODUCT 
WHERE NAME LIKE '%food%'

-- 12. update

UPDATE PRODUCT 
SET CONTENT = '품절'
WHERE PRICE = 5000

SELECT * FROM PRODUCT 
WHERE PRICE = 5000

-- 13. 

UPDATE PRODUCT 
SET IMG = '0.png', PRICE = 10000
WHERE id = '100' OR id = '102'

SELECT * FROM PRODUCT

-- 14. delete는 컬럼명을 지정하지 않음.
--> insert, delete, update의 결과는 실행된 Row수!(정수)
--> select의 결과는 테이블이다.! 

DELETE FROM PRODUCT
WHERE COMPANY = 'c100'

SELECT * 
FROM PRODUCT 
WHERE COMPANY = 'c100'

-- 15. DELETE 
--> varchar2, char의 차이 
--> varchar2(100) : var(변하다, variable) + char(문자)
-->           2글자이면 2글자들어갈 만큼만 저장공간을 사용
-->           100글자이면 100글자들어갈 만큼 저장공간을 저장 
--> char(100) : 저장공간이 고정, 주민번호, 전화번호, 우편번호, 사번 

DELETE FROM PRODUCT -- row수 
--> 저장공간은 남겨두고, 데이터만 지움.
--> 데이터를 복구/취소(rollback, 롤백) 가능 
--> truncate로 지우면 저장공간도 남겨두지 않고, 복구/취소 불가능 

SELECT * FROM PRODUCT  

--------------------------------

SELECT concat(CONCAT(empno, ':'), ENAME) AS concat_result FROM emp 

SELECT empno || ':' || ename AS concat_result FROM emp 

SELECT * FROM EMP

SELECT LENGTH(trim(ename)) FROM emp

SELECT LENGTH(ename) FROM emp

SELECT TRIM(BOTH 'A' from ename) FROM emp -- 양쪽끝에 A를 제거  

SELECT TRIM(LEADING 'A' from ename) FROM emp -- 앞쪽에 A를 제거
 
SELECT TRIM(TRAILING 'A' from ename) FROM emp  -- 뒷쪽에 A를 제거

select REPLACE(ENAME, ' ', '') from EMP

UPDATE EMP 
SET COMM = 0
WHERE COMM IS NULL

SELECT *
FROM EMP 

SELECT SAL + COMM AS total 
FROM EMP

SELECT *
FROM emp

------------------------------
SELECT * FROM EMP 

SELECT count(*) 
FROM EMP 

SELECT count(SAL) 
FROM EMP 

-- 집계함수 

SELECT count(SAL), sum(SAL), AVG(sal), MIN(SAL), MAX(SAL) 
FROM EMP
WHERE JOB = 'SALESMAN'

SELECT job, count(SAL), sum(SAL), round(AVG(sal)), MIN(SAL), MAX(SAL) 
FROM EMP
GROUP BY JOB

SELECT job, count(SAL), sum(SAL), round(AVG(sal)), MIN(SAL), MAX(SAL) 
FROM EMP
GROUP BY JOB
HAVING COUNT(SAL) >= 4 -- 그룹을 지어서 검색 후, 필터링을 하고자 하는 경우 
ORDER BY JOB DESC -- 이미 모든 검색이 다 끝난 후, 그 결과를 정렬하고자 하는 경우, 맨 끝

-----------------------
SELECT count(*)
FROM EMP e 

SELECT count(*)
FROM EMP e 
WHERE DEPTNO = 20 OR MGR <= 7700


SELECT MIN(SAL)
FROM EMP e 
WHERE DEPTNO = 10 OR DEPTNO = 20

SELECT DEPTNO, avg(SAL)
FROM EMP 
GROUP BY DEPTNO

SELECT DEPTNO, SUM(SAL)
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO 

SELECT DEPTNO, avg(SAL)
FROM EMP 
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO DESC 

SELECT COUNT(*), AVG(SAL) 
FROM EMP 
WHERE JOB = 'MANAGER'

SELECT COUNT(*) 
FROM EMP 
WHERE ENAME LIKE '%S%'

SELECT COUNT(*) 
FROM EMP 
WHERE SAL >= 3000 AND COMM IS NOT NULL 
ORDER BY SAL DESC 

--------------------
-- join: 왜 하는가? 검색을 하고 싶은데 항목들이 여러개의 테이블에 흩어져있는 경우
--      테이블을 모아서(합해서) 검색
-- 2개의 테이블의 공통된 값들만 조인해서 검색 

SELECT *
FROM "MEMBER" m , BBS b 
WHERE m.ID = b.WRITER 

SELECT b."no", b.title, NAME 
FROM "MEMBER" m , BBS b 
WHERE m.ID = b.WRITER 


---- Inner join: 테이블간 공통된 값만 추출
---- emp테이블과 dept테이블을 조인하세요.
---- 하나의 컬럼이상이 동일한 컬럼이 있어야 함.
---- empno, ename, job, deptno, loc 컬럼 검색
---- 조인조건: deptno

SELECT e.EMPNO, e.ENAME, e.JOB, d.DEPTNO, d.LOC 
FROM DEPT d, EMP e 
WHERE d.DEPTNO = e.DEPTNO 

SELECT *
FROM "MEMBER" m 
LEFT OUTER JOIN BBS b 
on (m.ID = b.WRITER) 

SELECT *
FROM "MEMBER" m 
RIGHT OUTER JOIN BBS b 
on (m.ID = b.WRITER)

-- left/right outer join

1. emp테이블의 정보는 다보이게 하고 싶음. dept는 맞는 것만 오른쪽에 붙여주고 싶음.

SELECT *
FROM EMP e 
LEFT OUTER JOIN DEPT d 
ON (e.DEPTNO = d.DEPTNO)

2. dept테이블의 정보는 다보이게 하고 싶음. emp는 맞는 것만 오른쪽에 붙여주고 싶음.

SELECT *
FROM EMP e 
RIGHT OUTER JOIN DEPT d 
ON (e.DEPTNO = d.DEPTNO)

-- inner join

SELECT *
FROM "MEMBER" m, BBS b 
WHERE m.ID = b.WRITER 

-- outer join(left, right)

SELECT m.ID, m.NAME, b.TITLE, b.CONTENT 
FROM "MEMBER" m 
LEFT OUTER JOIN BBS b
ON (m.ID = b.WRITER)

SELECT m.ID, m.NAME, b.TITLE, b.CONTENT 
FROM "MEMBER" m 
RIGHT OUTER JOIN BBS b
ON (m.ID = b.WRITER)

CREATE TABLE company (
	id varchar2(200) primary key,
	name varchar2(200),
	addr varchar2(200),
	tel varchar2(200)
)

INSERT INTO company VALUES ('c100', 'good', 'seoul', '011')

INSERT INTO company VALUES ('c200', 'joa', 'busan', '012')

INSERT INTO company VALUES ('c300', 'maria', 'ulsan', '013')

INSERT INTO company VALUES ('c400', 'my', 'kwangju', '014')

SELECT * FROM company




