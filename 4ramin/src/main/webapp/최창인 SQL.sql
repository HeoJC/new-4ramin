-------------------- 유저 테이블 ---------------------------------
CREATE TABLE users (					-- 유저 회원가입 테이블
user_id varchar2(20)	    NOT NULL,   -- 아아디
user_password varchar2(20)    NULL,		-- 비밀번호
user_name varchar2(20)    	NULL,		-- 이름
user_phone varchar2(100)    NULL,		-- 연락처
user_email varchar2(200)   	NULL,		-- 이메일
user_auth varchar2(50)	NULL			-- 권한
);


select * from users;

insert into users values('yedam','1234','관리자','01012341235','yedam@naver.com','ADMIN'); -- 어드민 하나만 해놓음..
insert into users values('AAA','1234','ColbyPayne','1-235-643-4351','congue@nuncut.org','USER');
insert into users values('AAB','1234','Ralph Pierce','(387)370-5288','luctus@alique.com','USER');
insert into users values('AAC','1234','Mason Bray','(963)748-2553','lacus@convallis.org','USER');
insert into users values('AAD','1234','Forrest Chapman','(606) 543-6276','purus@orciluctus.com','USER');
insert into users values('ABA','1234','Anthony','088-151-1151','ulum@mauris.co.uk','USER');
insert into users values('ACA','1234','Neville','014-659-6256','dolor@mlesuada.co.uk','USER');


----------------------이력서 테이블---------------------------------------

create sequence res_seq   --시퀸스
start with 1
increment by 1
minvalue 1 ;

select * from resumes;

CREATE TABLE resumes (
	rsm_idx	        number	NOT NULL PRIMARY KEY,         	-- 시퀸스
	rsm_name varchar2(20) NOT NULL,				-- 이름 
	user_id	        varchar2(20)	NOT NULL, 	-- 유저 아이디 값 받아서
	rsm_birthday    	date	NULL,			-- 생년월일 (yyyy-mm-dd
	rsm_gender	    varchar2(10)	NULL,		-- 성별
	rsm_education	varchar2(2000)	NULL,		-- 학력
	rsm_career	    varchar2(2000)	NULL,		-- 경력
	rsm_certificate	VARCHAR(2000)	NULL,		-- 자격증
	rsm_photo	varchar2(200)	NULL,			-- 사진
	rsm_tel	varchar2(20)	NULL,				-- 연락처
	rsm_title varchar2(500) NULL
);