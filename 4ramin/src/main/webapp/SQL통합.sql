-----------------------------------------------------------
-------------------------사용자생성-------------------------
-----------------------------------------------------------



--사용자 생성
--cmd -> sqlplus "/as sysdba" -> create user yedam identified by 1234 ; -> grant connect , resource to yedam ;
--cmd -> sqlplus "/as sysdba" -> grant create view to yedam ;


-----------------------------------------------------------
-------------------------테이블삭제-------------------------
-----------------------------------------------------------

set define off;

drop table company ;
drop table branches ;
drop table reviews ;
drop table avgsal ;
drop table comBookmark ;
drop table adtBookmark ;
drop table adoptions;
drop table users;
drop table resumes;


drop sequence r_seq ;
drop sequence a_seq;
drop sequence res_seq;


-----------------------------------------------------------
-------------------------테이블생성, 시퀀스생성, 샘플데이터입력-------------------------
-----------------------------------------------------------



-- 기업 테이블 --
create table company (
com_id varchar2(20) PRIMARY KEY,       -- 기업 로그인 아이디
com_pw varchar2(50) ,                  -- 기업 로그인 비밀번호
com_name varchar2(100) ,               -- 기업명
com_intro varchar2(300) ,              -- 기업소개
com_phone varchar2(100) ,               -- 기업 전화번호
com_email varchar2(100) ,              -- 기업 대표 이메일
com_loc varchar2(300) ,                -- 기업 위치
com_reg varchar2(100) ,                 -- 기업 사업자 번호
com_imp varchar2(100) ,                 -- 기업 직원수
com_man varchar2(100) ,                 -- 기업 인사 담당자명
com_sal varchar2(100) ,                 -- 기업 신입 평균 연봉
com_like number default 0
) ;
-- 평균연봉 테이블 --
create table avgsal (
com_id varchar2(20) PRIMARY KEY ,
sal_2019 varchar2(100) default 0 ,
sal_2020 varchar2(100) default 0 ,
sal_2021 varchar2(100) 
);
-- 산업분야 테이블 --
create table branches (
com_id varchar2(20) PRIMARY KEY,       -- 기업 로그인 아이디
com_branch varchar2(150)
) ;
-- 기업평가 테이블 --
create table reviews (
rev_idx number PRIMARY KEY,
com_id varchar2(20) ,
user_id varchar2(20) ,
comments varchar2(300)
) ;
-- 기업평가 시퀀스 --
create sequence r_seq
start with 1
increment by 1
minvalue 1 ;
-- 기업 즐겨찾기 테이블 --
create table comBookmark (
user_id varchar2(20) ,
com_id varchar2(20) PRIMARY KEY,
com_name varchar2(100) ,
com_intro varchar2(300) ,
com_sal varchar2(100) ,
marked_date date default sysdate
) ;
-- 공고 즐겨찾기 테이블 --
create table adtBookmark (
adt_idx number ,
user_id varchar2(20) ,
com_id varchar2(20) ,
title varchar2(800) PRIMARY KEY,
adt_exp varchar2(100)
) ;
-- 채용공고 테이블
create table adoptions (
adt_idx number PRIMARY KEY,
com_id varchar2(20) ,
title varchar2(800) ,
body varchar2(2000),
career varchar2(40),
adt_exp date,
adt_email varchar2(100),
adt_imgsrc varchar2(500),
sal_type varchar2(50),
sal_howmuch varchar2(50),
adt_address varchar2(800)
) ;
--채용공고 시퀀스
create sequence a_seq
start with 1
increment by 1
minvalue 1 ;
-- 유저테이블
CREATE TABLE users (
user_id varchar2(20)	    NOT NULL,
user_password varchar2(20)    NULL,
user_name varchar2(20)    	NULL,
user_phone varchar2(100)    NULL,
user_email varchar2(200)   	NULL,
user_auth varchar2(50)	NULL
);
--이력서 시퀀스
create sequence res_seq
start with 1
increment by 1
minvalue 1 ;
--이력서 테이블
CREATE TABLE resumes (
   rsm_idx           number   NOT NULL,
   user_id           varchar2(20)   NOT NULL, 
   rsm_birthday       date   NULL, 
   rsm_gender       varchar2(10)   NULL,      -- 성
   rsm_education   varchar2(50)   NULL,
   rsm_career       varchar2(50)   NULL,
   rsm_certificate   VARCHAR(255)   NULL,
   rsm_photo   varchar2(200)   NULL,
   rsm_tel   varchar2(20)   NULL
);


-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------




-- 기업 샘플 데이터 --
insert into company values('maru','1234','마루일번지','기타 건축자재 도매업',
'010-2350-8406','maru@naver.com','대구 북구 검단로27길 78-8','123-12-12345',
'20명','박형진','2760만원',0) ;
insert into company values('raon','1234','라온디어스','광고 대행업',
'070-5158-8455','laondeas@naver.com','대구 동구 장등로 76','234-23-23456',
'11명','정지영','2500만원',0) ;
insert into company values('simons','1234','시몬스','매트리스 및 침대 제조업',
'1899-8182','simons@naver.com','경기도 이천시 모가면 사실로 1000','126-81-24808',
'420명','김해니','2550만원',0) ;
insert into company values('sias','1234','시아스','천연 및 혼합조제 조미료 제조업',
'02-6932-7182','hbjoo@naver.com','충북 청주시 흥덕구 과학산업1로 102','345-34-34567',
'263명','최진철','2550만원',0) ;
insert into company values('daham','1234','다함푸드','도시락류 제조업',
'053-721-7784','daham@naver.com','경북 1!경산시 더미@ 공단2로3길 47','456-45-45678','20명',
'손정수','2500만원',0) ;
insert into company values('bean','1234','클콩','방송 프로그램 제작업',
'070-5143-5420','superbean@naver.com','경기 성남시 분당구 판교로255번길','567-56-56789',
'65명','이주원','2700만원',0) ;
insert into company values('sungwon','1234','성원애드콕제약','의약품 제조업',
'02-3665-2872','swpharm@naver.com','경기 김포시 고촌읍 아라육로152','678-67-67890',
'72명','박형미','2700만원',0) ;
insert into company values('vaunce','1234','바운스','기타 여가관련 서비스업',
'070-8858-6819','vaunce@naver.com','경기 용인시 처인구 모현읍 오산로13','789-78-78901',
'119명','윤주일','2750만원',0) ;
insert into company values('donga','1234','동아문화사','인쇄업','053-242-9060',
'donga@naver.com','대구 달서구 장기로65길 11-9','890-89-89012','19명','박창용','2450만원',0) ;
insert into company values('major','1234','애드메이저','광고 대행업','010-5730-5041',
'admajor@naver.com','대구 동구 동부로26길 60','901-90-90123','19명','조두석','2450만원',0) ;
-- 평균연봉 샘플 데이터 --
insert into avgsal values('maru','2650만원','2700만원','2760만원') ;
insert into avgsal values('raon','2400만원','2450만원','2500만원') ;
insert into avgsal values('simons','2450만원','2500만원','2550만원') ;
insert into avgsal values('sias','2450만원','2500만원','2550만원') ;
insert into avgsal values('daham','2400만원','2450만원','2500만원') ;
insert into avgsal values('bean','2600만원','2650만원','2700만원') ;
insert into avgsal values('sungwon','2600만원','2650만원','2700만원') ;
insert into avgsal values('vaunce','2650만원','2700만원','2750만원') ;
insert into avgsal values('donga','2400만원','2450만원','2450만원') ;
insert into avgsal values('major','2450만원','2450만원','2450만원') ;
-- 산업분야 샘플 데이터 --
insert into branches values('maru','도매업') ;
insert into branches values('raon','광고 대행업') ;
insert into branches values('simons','제조업') ;
insert into branches values('sias','제조업') ;
insert into branches values('daham','제조업') ;
insert into branches values('bean','영상 제작업') ;
insert into branches values('sungwon','제조업') ;
insert into branches values('vaunce','서비스업') ;
insert into branches values('donga','인쇄업') ;
insert into branches values('major','광고대행업') ;
-- 기업평가 샘플 데이터 --
insert into reviews values(r_seq.nextval,'maru','hong','여기 사장님이 이상해요') ;
-- 기업 즐겨찾기 샘플 데이터 --
insert into comBookmark values('AAA','maru','마루일번지','기타 건축자재 도매업','2760만원',sysdate) ;
insert into comBookmark values('AAB','raon','라온디어스','광고 대행업','2500만원',sysdate) ;
-- 공고 즐겨찾기 샘플 데이터 --
insert into adtBookmark values(1,'AAA','maru','공고테스트 제목','공고 추가한 날짜') ;
insert into adtBookmark values(2,'AAA','raon','공고테스트 제목2','공고 추가한 날짜') ;
insert into adtBookmark values(1,'AAB','maru','공고테스트 제목3','공고 추가한 날짜') ;
-- 유저더미
insert into users values('yedam','1234','관리자','01012341235','yedam@naver.com','ADMIN');
insert into users values('AAA','1234','ColbyPayne','1-235-643-4351','congue@nuncut.org','USER');
insert into users values('AAB','1234','Ralph Pierce','(387)370-5288','luctus@alique.com','USER');
insert into users values('AAC','1234','Mason Bray','(963)748-2553','lacus@convallis.org','USER');
insert into users values('AAD','1234','Forrest Chapman','(606) 543-6276','purus@orciluctus.com','USER');
insert into users values('ABA','1234','Anthony','088-151-1151','ulum@mauris.co.uk','USER');
insert into users values('ACA','1234','Neville','014-659-6256','dolor@mlesuada.co.uk','USER');
--채용공고 더미
insert into adoptions values (a_seq.nextval, 'maru', '자동차 부품 원가 기획분석', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '11!서울시 더미@ 어쩌구 무슨2동');
insert into adoptions values (a_seq.nextval, 'raon', '자동차부품 생산직 정규직 사원모집 (CNC가공)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 어쩌구 무3슨동');
insert into adoptions values (a_seq.nextval, 'raon', 'Backend Engineer (NodeJS)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '1!경산시 더미@ 어쩌구 무슨동');
insert into adoptions values (a_seq.nextval, 'bean', '기술영업 / 프로젝트 관리 경력사원 (경력직)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '부산시 어쩌구 무슨233동');
insert into adoptions values (a_seq.nextval, 'daham', 'IPG Automotive 기술 영업', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '11!서울시 더미@ 어쩌구 무슨동');
insert into adoptions values (a_seq.nextval, 'bean', '[주야2교대] 자동차 부품 생산 사원 모집', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '22!인천시 더미@ 어느 동네');
insert into adoptions values (a_seq.nextval, 'simons', 'e커머스 시스템 개발/운영', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '11!대전시 더미@ 어느 동네');
insert into adoptions values (a_seq.nextval, 'simons', 'Salesforce CRM 구축, 개발, 운영', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'daham', '백엔드 웹 개발자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕333동1');
insert into adoptions values (a_seq.nextval, 'donga', '웹/모바일 퍼블리셔', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'React JS 기반 웹 프론트엔드 개발 숙련자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'sias', 'e-커머스 플랫폼 back-end (3년이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕동321112');
insert into adoptions values (a_seq.nextval, 'sias', '의료용/치과용 3D CAD 소프트웨어 개발', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'QA (Quality Assurance) Engineer', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'Python/Django 백엔드 개발자 (3년 이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'donga', '웹 개발/.Net/ASP.Net/C# 개발자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중1구 삼덕1동');
insert into adoptions values (a_seq.nextval, 'daham', 'React/Next.js 프론트엔드 개발자 (3년 이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', '시스템 엔지니어(SE)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕동');
insert into adoptions values (a_seq.nextval, 'sungwon', 'SW개발(구강스캐너 SW 외) 담당(2년이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'HW/IoT 엔지니어(전문연 가능)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼ㅇ덕ㅇㅇ동');
insert into adoptions values (a_seq.nextval, 'simons', '웹서버/프론트엔드 엔지니어(전문연 가능)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕ㅇ동');
insert into adoptions values (a_seq.nextval, 'donga', '생체신호 AI 엔지니어 (병역특례 가능 / CTO급 협의', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', '오라클, Postgre (SE, DBA) 개발자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'major', '전문연구요원(병역특례) 개발자 (머신러닝,안드로이드)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'C++ 클라이언트 개발 전문가', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'daham', '자율주행 소프트웨어 개발자 (Perception&Prediction)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'maru', '자동차 부품 원가 기획분석', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '11!서울시 더미@ 어쩌구 무슨2동');
insert into adoptions values (a_seq.nextval, 'raon', '자동차부품 생산직 정규직 사원모집 (CNC가공)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 어쩌구 무3슨동');
insert into adoptions values (a_seq.nextval, 'raon', 'Backend Engineer (NodeJS)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '1!경산시 더미@ 어쩌구 무슨동');
insert into adoptions values (a_seq.nextval, 'simons', '기술영업 / 프로젝트 관리 경력사원 (경력직)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '부산시 어쩌구 무슨233동');
insert into adoptions values (a_seq.nextval, 'daham', 'IPG Automotive 기술 영업', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '11!서울시 더미@ 어쩌구 무슨동');
insert into adoptions values (a_seq.nextval, 'vaunce', '[주야2교대] 자동차 부품 생산 사원 모집', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '22!인천시 더미@ 어느 동네');
insert into adoptions values (a_seq.nextval, 'vaunce', 'e커머스 시스템 개발/운영', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '11!대전시 더미@ 어느 동네');
insert into adoptions values (a_seq.nextval, 'simons', 'Salesforce CRM 구축, 개발, 운영', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'daham', '백엔드 웹 개발자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕333동1');
insert into adoptions values (a_seq.nextval, 'donga', '웹/모바일 퍼블리셔', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'React JS 기반 웹 프론트엔드 개발 숙련자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'e-커머스 플랫폼 back-end (3년이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕동321112');
insert into adoptions values (a_seq.nextval, 'sungwon', '의료용/치과용 3D CAD 소프트웨어 개발', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'QA (Quality Assurance) Engineer', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'Python/Django 백엔드 개발자 (3년 이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'donga', '웹 개발/.Net/ASP.Net/C# 개발자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중1구 삼덕1동');
insert into adoptions values (a_seq.nextval, 'daham', 'React/Next.js 프론트엔드 개발자 (3년 이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', '시스템 엔지니어(SE)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕동');
insert into adoptions values (a_seq.nextval, 'bean', 'SW개발(구강스캐너 SW 외) 담당(2년이상)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'bean', 'HW/IoT 엔지니어(전문연 가능)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼ㅇ덕ㅇㅇ동');
insert into adoptions values (a_seq.nextval, 'simons', '웹서버/프론트엔드 엔지니어(전문연 가능)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!대구시 더미@ 중구 삼덕ㅇ동');
insert into adoptions values (a_seq.nextval, 'donga', '생체신호 AI 엔지니어 (병역특례 가능 / CTO급 협의', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', '오라클, Postgre (SE, DBA) 개발자', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', '전문연구요원(병역특례) 개발자 (머신러닝,안드로이드)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'simons', 'C++ 클라이언트 개발 전문가', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');
insert into adoptions values (a_seq.nextval, 'daham', '자율주행 소프트웨어 개발자 (Perception&Prediction)', '채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시<br>채용공고 예시', '신입', '1111-11-11', 'chaeyong@gonggo.kr', 'temp.jpg\&temp.jpg\&temp.jpg\&temp.jpg', '월급', '100000', '2!인천시 더미@');


-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------





-- 공고 즐겨찾기 select 예시 --
select c.com_name , a.title , a.adt_exp , a.adt_idx from company c join adtBookmark a on c.com_id = a.com_id 
where a.user_id = 'AAA' ;





-----------------------------------------------------------
-------------------------테이블조회-------------------------
-----------------------------------------------------------




select * from company ;
select * from branches ;
select * from reviews ;
select * from avgsal ;
select * from comBookmark ;
select * from adtBookmark ;

commit ;