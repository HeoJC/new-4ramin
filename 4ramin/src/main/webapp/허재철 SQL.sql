-------------------------테이블삭제-------------------------

drop table company ;
drop table branches ;
drop table adoptions ;
drop table reviews ;
drop table avgsal ;

drop sequence a_seq ;
drop sequence r_seq ;

-------------------------테이블생성, 시퀀스생성, 샘플데이터입력-------------------------

-- 기업 테이블 --
create table company (
com_id varchar2(20) PRIMARY KEY,       -- 기업 로그인 아이디
com_pw varchar2(50) ,                  -- 기업 로그인 비밀번호
com_name varchar2(100) ,               -- 기업명
com_intro varchar2(300) ,              -- 기업소개
com_phone varchar2(20) ,               -- 기업 전화번호
com_email varchar2(100) ,              -- 기업 대표 이메일
com_loc varchar2(300) ,                -- 기업 위치
com_reg varchar2(20) ,                 -- 기업 사업자 번호
com_imp varchar2(100) ,                 -- 기업 직원수
com_man varchar2(100) ,                 -- 기업 인사 담당자명
com_sal varchar2(100) ,                 -- 기업 신입 평균 연봉
com_like number default 0
) ;

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
'053-721-7784','daham@naver.com','경북 경산시 공단2로3길 47','456-45-45678','20명',
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

-- 평균연봉 테이블 --
create table avgsal (
com_id varchar2(20) PRIMARY KEY ,
sal_2019 varchar2(100) ,
sal_2020 varchar2(100) ,
sal_2021 varchar2(100) 
);

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

-- 산업분야 테이블 --
create table branches (
com_id varchar2(20) PRIMARY KEY,       -- 기업 로그인 아이디
com_branch varchar2(150)
) ;

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

-- 채용공고 테이블 --
create table adoptions (
adt_idx number PRIMARY KEY,
com_id varchar2(20) ,
title varchar2(150) ,
body varchar2(300)
) ;

-- 채용공고 시퀀스 --
create sequence a_seq
start with 1
increment by 1
minvalue 1 ;

-- 채용공고 샘플 데이터 --
insert into adoptions values(a_seq.nextval,'maru','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'raon','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'simons','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'sias','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'daham','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'bean','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'sungwon','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'vaunce','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'donga','채용공고 제목','채용공고 내용');
insert into adoptions values(a_seq.nextval,'major','채용공고 제목','채용공고 내용');

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

-- 기업평가 샘플 데이터 --
insert into reviews values(r_seq.nextval,'maru','hong','여기 사장님이 이상해요') ;

-------------------------테이블조회-------------------------

select * from company ;
select * from branches ;
select * from adoptions ;
select * from reviews ;
select * from avgsal ;

commit ;
