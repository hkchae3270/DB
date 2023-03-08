
CREATE TABLE test22(
	id varchar2(100),
	bbs_id varchar2(100),
	CONSTRAINTS "con_test" PRIMARY key (id, bbs_id)
)


CREATE TABLE test222(
	id varchar2(100),
	bbs_id varchar2(100),
	PRIMARY key (id, bbs_id)
)

SELECT MEMBER.id, BBS.TITLE, ORDERLIST.TOTAL_COUNT 
FROM MEMBER, BBS, ORDERLIST
WHERE MEMBER.id = bbs.WRITER AND MEMBER.id = ORDERLIST.MEMBER_ID 
AND bbs.TITLE = 'soso'

SELECT * FROM MEMBER 
WHERE id IN ('apple', 'ice')


SELECT * FROM "MEMBER"
WHERE id IN 
(SELECT writer FROM BBS) --apple
