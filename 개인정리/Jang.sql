-- 회원
DROP TABLE IF EXISTS jang_member;

-- 장소후기
DROP TABLE IF EXISTS jang_so_review;

-- 전시회
DROP TABLE IF EXISTS jang_exhibition;

-- 장소
DROP TABLE IF EXISTS jang_so;

-- 전시회티켓구매
DROP TABLE IF EXISTS jang_ticket;

-- 장소후기첨부파일
DROP TABLE IF EXISTS jang_so_review_file;

-- 댓글
DROP TABLE IF EXISTS jang_comment;

-- 코스추천글
DROP TABLE IF EXISTS jang_so_recommendation;

-- 장바구니
DROP TABLE IF EXISTS jang_baguni;

-- 방문히스토리
DROP TABLE IF EXISTS jang_history;

-- 전시회한줄리뷰
DROP TABLE IF EXISTS jang_exhibition_review;

-- 전시회첨부파일
DROP TABLE IF EXISTS jang_exhibition_file;

-- 검색키워드
DROP TABLE IF EXISTS jang_search;

-- 팔로워팔로잉
DROP TABLE IF EXISTS jang_follow;

-- 좋아요
DROP TABLE IF EXISTS jang_like;

-- 알림
DROP TABLE IF EXISTS jang_alarm;

-- 공지사항
DROP TABLE IF EXISTS jang_notice;

-- QnA
DROP TABLE IF EXISTS jang_qna;

-- 신고
DROP TABLE IF EXISTS jang_report;

-- 이동수단
DROP TABLE IF EXISTS jang_transportation;

-- 회원
CREATE TABLE jang_member (
  ID VARCHAR(50) NOT NULL,
  PWD VARCHAR(100) NOT NULL,
  NNAME VARCHAR(50) NOT NULL,
  SIDATE DATE DEFAULT curdate(),
  PROFILE VARCHAR(255) NULL,
  NAME VARCHAR(50) NOT NULL,
  EMAIL VARCHAR(40) NOT NULL,
  PNUM VARCHAR(30) NOT NULL,
  BIRTH DATE NULL,
  GENDER CHAR(1) NULL,
  SNS VARCHAR(255) NULL,
  MBTI VARCHAR(4) NULL
);

-- 회원
ALTER TABLE jang_member
  ADD CONSTRAINT PK_jang_member -- 회원 기본키
  PRIMARY KEY (
  ID -- 아이디
  );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_jang_member
  ON jang_member ( -- 회원
        NNAME ASC -- 닉네임
  );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_jang_member2
  ON jang_member ( -- 회원
        EMAIL ASC -- 이메일
  );

-- 회원 유니크 인덱스3
CREATE UNIQUE INDEX UIX_jang_member3
  ON jang_member ( -- 회원
        PNUM ASC -- 휴대폰번호
  );

-- 회원 인덱스
CREATE INDEX IX_jang_member
  ON jang_member( -- 회원
        NAME ASC -- 이름
  );

-- 회원 인덱스2
CREATE INDEX IX_jang_member2
  ON jang_member( -- 회원
        EMAIL ASC -- 이메일
  );

ALTER TABLE jang_member
  MODIFY COLUMN ID VARCHAR(50) NOT NULL AUTO_INCREMENT(1,1);
  
  

-- 장소후기
CREATE TABLE jang_so_review (
  PRVNO INTEGER NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  RECONO INTEGER NOT NULL,
  PLNO INTEGER NOT NULL
);

-- 장소후기
ALTER TABLE jang_so_review
  ADD CONSTRAINT PK_jang_so_review -- 장소후기 기본키
  PRIMARY KEY (
  PRVNO -- 장소후기번호
  );
  
  ALTER TABLE app_board
  MODIFY COLUMN bno INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- 전시회
CREATE TABLE jang_exhibition (
  EXNO INTEGER NOT NULL,
  EXNAME VARCHAR(255) NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  WDATE DATE DEFAULT curdate(),
  PLNO INTEGER NOT NULL,
  STDATE DATE NOT NULL,
  EDDATE DATE NOT NULL,
  PRICE INTEGER NOT NULL
);

-- 전시회
ALTER TABLE jang_exhibition
  ADD CONSTRAINT PK_jang_exhibition -- 전시회 기본키
  PRIMARY KEY (
  EXNO -- 전시회번호
  );

ALTER TABLE jang_exhibition
  MODIFY COLUMN EXNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 장소
CREATE TABLE jang_so (
  PLNO INTEGER NOT NULL,
  PLNAME VARCHAR(255) NOT NULL,
  QCALL VARCHAR(30) NOT NULL,
  POSTNO INTEGER NOT NULL,
  BASICAD VARCHAR(255) NOT NULL,
  DETAILAD VARCHAR(255) NOT NULL,
  WIDO VARCHAR(50) NOT NULL,
  KDO VARCHAR(50) NOT NULL
);

-- 장소
ALTER TABLE jang_so
  ADD CONSTRAINT PK_jang_so -- 장소 기본키
  PRIMARY KEY (
  PLNO -- 장소번호
  );

ALTER TABLE jang_so
  MODIFY COLUMN PLNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 전시회티켓구매
CREATE TABLE jang_ticket (
  EXTKNO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL,
  EXNO INTEGER NOT NULL,
  CNT INTEGER NOT NULL,
  PURDATE DATE DEFAULT curdate(),
  PAYMENT VARCHAR(50) NOT NULL,
  CCDATE DATE NULL
);

-- 전시회티켓구매
ALTER TABLE jang_ticket
  ADD CONSTRAINT PK_jang_ticket -- 전시회티켓구매 기본키
  PRIMARY KEY (
  EXTKNO -- 전시회티켓구매번호
  );

ALTER TABLE jang_ticket
  MODIFY COLUMN EXTKNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 장소후기첨부파일
CREATE TABLE jang_so_review_file (
  RECOFNO INTEGER NOT NULL,
  PRVNO INTEGER NOT NULL,
  PATH VARCHAR(255) NOT NULL
);

-- 장소후기첨부파일
ALTER TABLE jang_so_review_file
  ADD CONSTRAINT PK_jang_so_review_file -- 장소후기첨부파일 기본키
  PRIMARY KEY (
  RECOFNO -- 장소후기첨부파일번호
  );

ALTER TABLE jang_so_review_file
  MODIFY COLUMN RECOFNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 댓글
CREATE TABLE jang_comment (
  CMNO INTEGER NOT NULL,
  RECONO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  WDATE DATE DEFAULT curdate()
);

-- 댓글
ALTER TABLE jang_comment
  ADD CONSTRAINT PK_jang_comment -- 댓글 기본키
  PRIMARY KEY (
  CMNO -- 댓글번호
  );

ALTER TABLE jang_comment
  MODIFY COLUMN CMNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 코스추천글
CREATE TABLE jang_so_recommendation (
  RECONO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL,
  TITLE VARCHAR(255) NOT NULL,
  WDATE DATE DEFAULT curdate(),
  CNT INTEGER DEFAULT 0,
  ACT BOOLEAN NOT NULL,
  PET BOOLEAN NULL,
  FRD BOOLEAN NOT NULL,
  CPLE BOOLEAN NOT NULL,
  FMLY BOOLEAN NOT NULL,
  SOLO BOOLEAN NOT NULL,
  TPNO INTEGER NOT NULL
);

-- 코스추천글
ALTER TABLE jang_so_recommendation
  ADD CONSTRAINT PK_jang_so_recommendation -- 코스추천글 기본키
  PRIMARY KEY (
  RECONO -- 코스추천글번호
  );

ALTER TABLE jang_so_recommendation
  MODIFY COLUMN RECONO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 장바구니
CREATE TABLE jang_baguni (
  ID VARCHAR(50) NOT NULL,
  EXNO INTEGER NOT NULL,
  CNT INTEGER NOT NULL,
  ACT BOOLEAN NOT NULL
);

-- 장바구니
ALTER TABLE jang_baguni
  ADD CONSTRAINT PK_jang_baguni -- 장바구니 기본키
  PRIMARY KEY (
  ID,   -- 아이디
  EXNO  -- 전시회번호
  );

-- 방문히스토리
CREATE TABLE jang_history (
  HNO INTEGER NOT NULL,
  HDATE DATE DEFAULT curdate(),
  ID VARCHAR(50) NOT NULL
);

-- 방문히스토리
ALTER TABLE jang_history
  ADD CONSTRAINT PK_jang_history -- 방문히스토리 기본키
  PRIMARY KEY (
  HNO -- 방문히스토리번호
  );

ALTER TABLE jang_history
  MODIFY COLUMN HNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 전시회한줄리뷰
CREATE TABLE jang_exhibition_review (
  RVNO INTEGER NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  WDATE DATE DEFAULT curdate(),
  ID VARCHAR(50) NOT NULL,
  EXNO INTEGER NOT NULL
);

-- 전시회한줄리뷰
ALTER TABLE jang_exhibition_review
  ADD CONSTRAINT PK_jang_exhibition_review -- 전시회한줄리뷰 기본키
  PRIMARY KEY (
  RVNO -- 리뷰번호
  );

ALTER TABLE jang_exhibition_review
  MODIFY COLUMN RVNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 전시회첨부파일
CREATE TABLE jang_exhibition_file (
  EXFNO INTEGER NOT NULL,
  PATH VARCHAR(255) NOT NULL,
  EXNO INTEGER NOT NULL
);

-- 전시회첨부파일
ALTER TABLE jang_exhibition_file
  ADD CONSTRAINT PK_jang_exhibition_file -- 전시회첨부파일 기본키
  PRIMARY KEY (
  EXFNO -- 전시회게시글첨부파일번호
  );

ALTER TABLE jang_exhibition_file
  MODIFY COLUMN EXFNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 검색키워드
CREATE TABLE jang_search (
  SKNO INTEGER NOT NULL,
  KWD VARCHAR(50) NOT NULL,
  SCDATE DATE DEFAULT curdate()
);

-- 검색키워드
ALTER TABLE jang_search
  ADD CONSTRAINT PK_jang_search -- 검색키워드 기본키
  PRIMARY KEY (
  SKNO -- 검색키워드번호
  );

ALTER TABLE jang_search
  MODIFY COLUMN SKNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 팔로워팔로잉
CREATE TABLE jang_follow (
  ID VARCHAR(50) NOT NULL,
  OTHID VARCHAR(50) NOT NULL
);

-- 팔로워팔로잉
ALTER TABLE jang_follow
  ADD CONSTRAINT PK_jang_follow -- 팔로워팔로잉 기본키
  PRIMARY KEY (
  ID,    -- 본인아이디
  OTHID  -- 다른이아이디
  );

-- 좋아요
CREATE TABLE jang_like (
  RECONO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL
);

-- 좋아요
ALTER TABLE jang_like
  ADD CONSTRAINT PK_jang_like -- 좋아요 기본키
  PRIMARY KEY (
  RECONO, -- 코스추천글번호
  ID      -- 아이디
  );

-- 알림
CREATE TABLE jang_alarm (
  ALNO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  ALTIME DATETIME NOT NULL,
  RDTIME DATETIME NULL
);

-- 알림
ALTER TABLE jang_alarm
  ADD CONSTRAINT PK_jang_alarm -- 알림 기본키
  PRIMARY KEY (
  ALNO -- 알림번호
  );

ALTER TABLE jang_alarm
  MODIFY COLUMN ALNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 공지사항
CREATE TABLE jang_notice (
  NTNO INTEGER NOT NULL,
  TITLE VARCHAR(255) NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  WDATE DATE DEFAULT curdate()
);

-- 공지사항
ALTER TABLE jang_notice
  ADD CONSTRAINT PK_jang_notice -- 공지사항 기본키
  PRIMARY KEY (
  NTNO -- 공지사항번호
  );

ALTER TABLE jang_notice
  MODIFY COLUMN NTNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- QnA
CREATE TABLE jang_qna (
  QNANO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL,
  PBL BOOLEAN NULL,
  TITLE VARCHAR(255) NOT NULL,
  CONT MEDIUMTEXT NOT NULL,
  WDATE DATE DEFAULT curdate(),
  ANSCONT MEDIUMTEXT NULL,
  ANSDATE DATE NULL
);

-- QnA
ALTER TABLE jang_qna
  ADD CONSTRAINT PK_jang_qna -- QnA 기본키
  PRIMARY KEY (
  QNANO -- QnA번호
  );

ALTER TABLE jang_qna
  MODIFY COLUMN QNANO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 신고
CREATE TABLE jang_report (
  RPNO INTEGER NOT NULL,
  RECONO INTEGER NOT NULL,
  ID VARCHAR(50) NOT NULL,
  RSN MEDIUMTEXT NOT NULL,
  RST MEDIUMTEXT NULL,
  RSTDATE DATE NULL
);

-- 신고
ALTER TABLE jang_report
  ADD CONSTRAINT PK_jang_report -- 신고 기본키
  PRIMARY KEY (
  RPNO -- 신고번호
  );

ALTER TABLE jang_report
  MODIFY COLUMN RPNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 이동수단
CREATE TABLE jang_transportation (
  TPNO INTEGER NOT NULL,
  TPNAME VARCHAR(50) NOT NULL
);

-- 이동수단
ALTER TABLE jang_transportation
  ADD CONSTRAINT PK_jang_transportation -- 이동수단 기본키
  PRIMARY KEY (
  TPNO -- 이동수단번호
  );

ALTER TABLE jang_transportation
  MODIFY COLUMN TPNO INTEGER NOT NULL AUTO_INCREMENT(1,1);

-- 장소후기
ALTER TABLE jang_so_review
  ADD CONSTRAINT FK_jang_so_recommendation_TO_jang_so_review -- 코스추천글 -> 장소후기
  FOREIGN KEY (
  RECONO -- 코스추천글번호
  )
  REFERENCES jang_so_recommendation ( -- 코스추천글
  RECONO -- 코스추천글번호
  );

-- 장소후기
ALTER TABLE jang_so_review
  ADD CONSTRAINT FK_jang_so_TO_jang_so_review -- 장소 -> 장소후기
  FOREIGN KEY (
  PLNO -- 장소번호
  )
  REFERENCES jang_so ( -- 장소
  PLNO -- 장소번호
  );

-- 전시회
ALTER TABLE jang_exhibition
  ADD CONSTRAINT FK_jang_so_TO_jang_exhibition -- 장소 -> 전시회
  FOREIGN KEY (
  PLNO -- 장소번호
  )
  REFERENCES jang_so ( -- 장소
  PLNO -- 장소번호
  );

-- 전시회티켓구매
ALTER TABLE jang_ticket
  ADD CONSTRAINT FK_jang_exhibition_TO_jang_ticket -- 전시회 -> 전시회티켓구매
  FOREIGN KEY (
  EXNO -- 전시회번호
  )
  REFERENCES jang_exhibition ( -- 전시회
  EXNO -- 전시회번호
  );

-- 전시회티켓구매
ALTER TABLE jang_ticket
  ADD CONSTRAINT FK_jang_member_TO_jang_ticket -- 회원 -> 전시회티켓구매
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 장소후기첨부파일
ALTER TABLE jang_so_review_file
  ADD CONSTRAINT FK_jang_so_review_TO_jang_so_review_file -- 장소후기 -> 장소후기첨부파일
  FOREIGN KEY (
  PRVNO -- 장소후기번호
  )
  REFERENCES jang_so_review ( -- 장소후기
  PRVNO -- 장소후기번호
  );

-- 댓글
ALTER TABLE jang_comment
  ADD CONSTRAINT FK_jang_so_recommendation_TO_jang_comment -- 코스추천글 -> 댓글
  FOREIGN KEY (
  RECONO -- 코스추천글번호
  )
  REFERENCES jang_so_recommendation ( -- 코스추천글
  RECONO -- 코스추천글번호
  );

-- 댓글
ALTER TABLE jang_comment
  ADD CONSTRAINT FK_jang_member_TO_jang_comment -- 회원 -> 댓글
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 코스추천글
ALTER TABLE jang_so_recommendation
  ADD CONSTRAINT FK_jang_member_TO_jang_so_recommendation -- 회원 -> 코스추천글
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 코스추천글
ALTER TABLE jang_so_recommendation
  ADD CONSTRAINT FK_jang_transportation_TO_jang_so_recommendation -- 이동수단 -> 코스추천글
  FOREIGN KEY (
  TPNO -- 이동수단번호
  )
  REFERENCES jang_transportation ( -- 이동수단
  TPNO -- 이동수단번호
  );

-- 장바구니
ALTER TABLE jang_baguni
  ADD CONSTRAINT FK_jang_member_TO_jang_baguni -- 회원 -> 장바구니
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 장바구니
ALTER TABLE jang_baguni
  ADD CONSTRAINT FK_jang_exhibition_TO_jang_baguni -- 전시회 -> 장바구니
  FOREIGN KEY (
  EXNO -- 전시회번호
  )
  REFERENCES jang_exhibition ( -- 전시회
  EXNO -- 전시회번호
  );

-- 방문히스토리
ALTER TABLE jang_history
  ADD CONSTRAINT FK_jang_member_TO_jang_history -- 회원 -> 방문히스토리
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 전시회한줄리뷰
ALTER TABLE jang_exhibition_review
  ADD CONSTRAINT FK_jang_member_TO_jang_exhibition_review -- 회원 -> 전시회한줄리뷰
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 전시회한줄리뷰
ALTER TABLE jang_exhibition_review
  ADD CONSTRAINT FK_jang_exhibition_TO_jang_exhibition_review -- 전시회 -> 전시회한줄리뷰
  FOREIGN KEY (
  EXNO -- 전시회번호
  )
  REFERENCES jang_exhibition ( -- 전시회
  EXNO -- 전시회번호
  );

-- 전시회첨부파일
ALTER TABLE jang_exhibition_file
  ADD CONSTRAINT FK_jang_exhibition_TO_jang_exhibition_file -- 전시회 -> 전시회첨부파일
  FOREIGN KEY (
  EXNO -- 전시회번호
  )
  REFERENCES jang_exhibition ( -- 전시회
  EXNO -- 전시회번호
  );

-- 팔로워팔로잉
ALTER TABLE jang_follow
  ADD CONSTRAINT FK_jang_member_TO_jang_follow -- 회원 -> 팔로워팔로잉
  FOREIGN KEY (
  ID -- 본인아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 팔로워팔로잉
ALTER TABLE jang_follow
  ADD CONSTRAINT FK_jang_member_TO_jang_follow2 -- 회원 -> 팔로워팔로잉2
  FOREIGN KEY (
  OTHID -- 다른이아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 좋아요
ALTER TABLE jang_like
  ADD CONSTRAINT FK_jang_so_recommendation_TO_jang_like -- 코스추천글 -> 좋아요
  FOREIGN KEY (
  RECONO -- 코스추천글번호
  )
  REFERENCES jang_so_recommendation ( -- 코스추천글
  RECONO -- 코스추천글번호
  );

-- 좋아요
ALTER TABLE jang_like
  ADD CONSTRAINT FK_jang_member_TO_jang_like -- 회원 -> 좋아요
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 알림
ALTER TABLE jang_alarm
  ADD CONSTRAINT FK_jang_member_TO_jang_alarm -- 회원 -> 알림
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- QnA
ALTER TABLE jang_qna
  ADD CONSTRAINT FK_jang_member_TO_jang_qna -- 회원 -> QnA
  FOREIGN KEY (
  ID -- 아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );

-- 신고
ALTER TABLE jang_report
  ADD CONSTRAINT FK_jang_so_recommendation_TO_jang_report -- 코스추천글 -> 신고
  FOREIGN KEY (
  RECONO -- 코스추천글번호
  )
  REFERENCES jang_so_recommendation ( -- 코스추천글
  RECONO -- 코스추천글번호
  );

-- 신고
ALTER TABLE jang_report
  ADD CONSTRAINT FK_jang_member_TO_jang_report -- 회원 -> 신고
  FOREIGN KEY (
  ID -- (신고자)아이디
  )
  REFERENCES jang_member ( -- 회원
  ID -- 아이디
  );
  
  show tables;
  
  -- 회원

insert into JANG_MEMBER(ID,
PWD,
NNAME,
NAME,
EMAIL,
PNUM,
BIRTH,
GENDER,
MBTI)
 VALUES
('user1',
sha2('1111',256),
'juser1',
'JANG',
'user1@test.com',
'01000000000',
'960324',
'F',
'ESTJ');

insert into JANG_MEMBER(ID,
PWD,
NNAME,
NAME,
EMAIL,
PNUM,
BIRTH,
GENDER,
MBTI)
 VALUES
('user2',
sha2('1111',256),
'Muser1',
'MIN',
'user2@test.com',
'01100000000',
'960726',
'M',
'ISFJ');

-- 장소1 비트캠프
insert into JANG_SO(PLNO,
PLNAME,
QCALL,
POSTNO,
BASICAD,
DETAILAD,
WIDO,
KDO)
 VALUES(1,
'BITCAMP',
'02-1588-7776',
'06134',
'Gangnam-gu, Seoul, Republic of Korea',
'20, Gangnam-daero 94-gil',
'38.439801',
'127.127730');

-- 장소 2 카페
insert into JANG_SO(PLNO,
PLNAME,
QCALL,
POSTNO,
BASICAD,
DETAILAD,
WIDO,
KDO)
 VALUES(2,
'CAFE',
'02-2233-3333',
'06234',
'Gangnam-gu, Seoul, Republic of Korea',
'20, Gangnam-daero 15',
'39.439801',
'128.127730');

insert into jang_so(PLNO, PLNAME, QCALL, POSTNO, BASICAD, DETAILAD, WIDO, KDO) 
 VALUES(3, 'Seoul National University', '0261102281', '08787', 'Gwanak-gu, Seoul, Republic of Korea', '1822, Nambusunhwan-ro', '37.481280902223006', '126.95270867757853');

insert into jang_exhibition(EXNO, EXNAME, CONT, PLNO, STDATE, EDDATE, PRICE) 
 VALUES(1, 'Limdonghyun Comedy Show', 'hello, im find thank you', 3, '20221006', '20221010', 50);

insert into jang_exhibition_file(EXFNO, PATH, EXNO) 
 VALUES(1, '/exhibition/file', 1);

insert into jang_exhibition_review(RVNO, CONT, ID, EXNO) 
 VALUES(1, 'oh…god…', 'user1', 1);

insert into jang_ticket(EXTKNO, ID, EXNO, CNT, PAYMENT) 
 VALUES(1, 'user1', 1, 2, 'kakaopay');
 
-- 이동수단

insert into JANG_TRANSPORTATION(TPNO,
TPNAME)
 VALUES(1,
'PRIVATE CAR');

-- 코스추천글

insert into JANG_SO_RECOMMENDATION(RECONO,
ID,
TITLE,
ACT,
FRD,
CPLE,
FMLY,
SOLO,
TPNO)
 VALUES(1,
'USER1',
'STROLL',
TRUE,
TRUE,
TRUE,
TRUE,
FALSE,
1);

-- 장소후기첨부파일

insert into JANG_SO_REVIEW_FILE(RECOFNO,
PRVNO,
PATH)
 VALUES(1,
1,
'/jangso/file1');

insert into JANG_SO_REVIEW_FILE(RECOFNO,
PRVNO,
PATH)
 VALUES(2,
2,
'/jangso/file2');

select * from jang_so_recommendation;
select * from jang_member;
select * from jang_report;

insert into jang_report(RPNO, RECONO, ID, RSN)
values(1, 1, 'user2', '이런 용서할 수 없는!! ㅡㅡ');  

delete from jang_report where RPNO = 1;

show tables;

-- ---------------------------------
-- 마이페이지
-- 이름
select NNAME
from jang_member
where ID = x;
-- 사진
select PROFILE
from jang_member
where ID = x;
-- SNS 주소
select SNS
from jang_member
where ID = x;
-- MBTI
select MBTI
from jang_member
where ID = x;
-- 내가 좋아요 한 글 목록
select rec.TITLE
FROM 
	jang_so_recommendation rec, jang_like lik
where 
	rec.RECONO = lik.RECONO
	and lik.ID = x;
-- 내가 쓴 글 목록 제목, 작성일, 조회수, 좋아요
select rec.TITLE, rec.WDATE, rec.CNT, lik.cn
FROM
	jang_so_recommendation rec, 
    (select count(*) cn, ID
		from jang_like 
        where ID = x
        GROUP BY RECONO) lik
WHERE
	rec.ID = lik.ID;

-- 내가 쓴 댓글 목록
select com.CONT
from jang_comment com
where com.ID = x;

-- 알림
select alram.CONT
from jang_alram alram, jang_member mem
where alram.ID = mem.ID;

-- 팔로워 목록 ???

-- 팔로워수 ???
select count(OTHID)
from jang_follow
where ID = 내아이디;
-- 남의 마이페이지 글 목록 ???
select rec.TITLE, 
from jang_so_recommendation rec, jang_member mem
where rec.ID = mem.ID
