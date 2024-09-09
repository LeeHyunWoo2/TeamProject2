drop table member_tbl;
drop table board_tbl;
drop table book_tbl;
drop table cart_tbl;
drop table reservation_tbl;


CREATE TABLE book_tbl (
     isbn13 VARCHAR2(13) PRIMARY KEY,
     book VARCHAR2(100),
     author VARCHAR2(100),
     publisher VARCHAR2(50),
     price NUMBER(10, 2),
     book_category VARCHAR2(255),
     rental_available CHAR(1),
     purchase_available CHAR(1),
     isbn10 VARCHAR2(10),
     photo VARCHAR2(100),
     book_description CLOB,
     page_count NUMBER(5),
     weight VARCHAR2(10),
     book_size VARCHAR2(50),
     averageRating NUMBER(2, 1),
     star_5 NUMBER(5),
     star_4 NUMBER(5),
     star_3 NUMBER(5),
     star_2 NUMBER(5),
     star_1 NUMBER(5),
     review_count NUMBER(6),
     publicationDate DATE,
     book_count NUMBER(10),
     image_filename VARCHAR2(100)
);

CREATE TABLE category_tbl (
      category_level NUMBER(1) NOT NULL,
      category_name VARCHAR2(30) NOT NULL,
      category_id VARCHAR2(18) PRIMARY KEY,
      parent_id VARCHAR2(18)
);

-- 책 제목 인덱스
CREATE INDEX idx_book_title ON book_tbl (book);
CREATE INDEX idx_book_category ON book_tbl (book_category);
CREATE INDEX idx_book_avg_rating ON book_tbl (averageRating);
CREATE INDEX idx_book_publication_date ON book_tbl (publicationDate);




create table member_tbl(
	u_id varchar2(20) not null unique,
	name varchar2(30) not null,
	birth number(10,0) not null,
	phone varchar2(30) not null,
	email varchar2(50) not null,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	nickName varchar2(20) not null unique
);


create table board_tbl(
	title varchar2(20) not null,
	category varchar2(20) not null,
	content	varchar2(1000) not null,
	bno	number(10,0),
	regdate	date default sysdate,
	nickName varchar2(20) not null
);

create table book_tbl(
     photo varchar2(50) not null,
     book varchar2(50) not null,
     author varchar2(200) not null,
     publisher varchar2(50) not null,
     price number(20),
     genre varchar2(30) not null,
     summary varchar2(1000) not null,
     b_count number(10),
     isbn13	number(30) not null,
     isbn10 number(20) not null,
     publicationDate date not null
);
alter table book_tbl add constraint pk_book primary key (isbn13);


select * from BOOK_TBL;


insert into book_tbl (photo, book, author, publisher, price, genre, summary, b_count, isbn13, isbn10, publicationDate)
values('bookimage\Clean Code 클린 코드.jpg', 'Clean Code 클린 코드', '로버트 C. 마틴 저/박재호,이해영 공역', '인사이트(insight)',
       29700, '소프트웨어 공학','애자일 소프트웨어의 혁명적인 패러다임을 제시하는 책이다. 저자 로버트 마틴은 오브젝트 멘토(Object Mentor)의 동료들과 힘을 모아 ‘개발하며’ 클린 코드를 만드는 최상의 애자일 기법을 정제하여『Clean Code 클린 코드』에 담았다. 아주 많은 코드를 읽고 그 코드의 무엇이 옳은지, 그른지 생각하며 전문가로서 자신이 지니는 가치를 돌아보기 위해 꾸준히 노력한다면, 이 책을 통해 여러분의 프로그래밍 실력은 한층 더 높아질 것이다.', 3, 9788966260959, 8966260950, TO_DATE('2013-12-24', 'YYYY-MM-DD'));
insert into book_tbl (photo, book, author, publisher, price, genre, summary, b_count, isbn13, isbn10, publicationDate)
values('bookimage\리팩터링 2판.jpg', '리팩터링 2판', '마틴 파울러 저/개앞맵시(이복연),남기혁 공역', '한빛미디어',
       31500, '소프트웨어 공학','개발자가 선택한 프로그램 가치를 높이는 최고의 코드 관리 기술 마틴 파울러의 『리팩터링』이 새롭게 돌아왔다. 지난 20년간 전 세계 프로그래머에게 리팩터링의 교본이었던 『리팩토링』은, 기존 코드의 디자인을 개선하고 소프트웨어 유지 관리 능력을 향상시켰으며 기존 코드를 이해하기 쉽게 만드는 데 도움을 주었다. 간절히 기다려온 개정판 『리팩터링 2판』에는 프로그래밍 환경의 중요한 변화가 대거 반영되었다. 새로운 리팩터링 카탈로그를 자바스크립트 코드로 제시하며, 리팩터링 원칙부터 클래스 없이 리팩터링하는 방법과 데이터 조직화, 조건부 로직 간소화 방법을 다룬다. 또한 언어에 상관없이 리팩터링을 성공적으로 수행하는 실질적인 방법을 알려준다.', 3, 9791162242742, 1162242744, TO_DATE('2020-04-01', 'YYYY-MM-DD'));


insert into book_tbl (photo, book, author, publisher, price, genre, summary, b_count, isbn13, isbn10, publicationDate)
    (select photo, book, author, publisher, price, genre, summary, b_count, isbn13, isbn10, publicationDate from book_tbl);


create table cart_tbl(		
	photo varchar2(20) not null,
	c_title	varchar2(20) not null,
	c_count	number(10,0),
	c_price	number(10,0),
	c_totalPrice number(10,0),
	book_id	varchar2(20) not null,
	u_id varchar2(20) not null
);


create table reservation_tbl(
	r_bookName varchar2(20) not null,
	u_id varchar2(20) not null,
	r_bookPrice	number(10,0),
	r_phone	varchar2(30) not null,
	rentDay	date default sysdate,
	returnDay date default sysdate,
	checkOut varchar2(20) not null
);




drop table tbl_board;
drop sequence seq_board;

create sequence seq_board; -- 자동 번호 객체 생성

create table tbl_board(
	bno number(10,0),
	title varchar2 (200) not null,
	content varchar2 (2000) not null,
	writer varchar2 (50) not null,
	regdate date default sysdate,
	updatedate date default sysdate
); -- tbl_board 테이블 생성(번호, 제목, 내용, 작성자, 작성일, 수정일)

alter table tbl_board add constraint pk_board primary key (bno);

select * from TBL_BOARD;

insert into TBL_BOARD (bno, title, content, writer) values(seq_board.nextval, '테스트 제1목', '테스트 내1용', '1kkw');
insert into TBL_BOARD (bno, title, content, writer) values(seq_board.nextval, '테스트 제2목', '테스트 내2용', '2kkw');
insert into TBL_BOARD (bno, title, content, writer) values(seq_board.nextval, '테스트 제3목', '테스트 내3용', '3kkw');
insert into TBL_BOARD (bno, title, content, writer) values(seq_board.nextval, '테스트 제4목', '테스트 내4용', '4kkw');
insert into TBL_BOARD (bno, title, content, writer) values(seq_board.nextval, '테스트 제5목', '테스트 내5용', '5kkw');

insert into TBL_BOARD (bno, title, content, writer) (select seq_board.nextval, title, content, writer from tbl_board);
-- 글 복사용 재귀함수 (지가 본걸 그대로 다시씀)

select count(*)from tbl_board;
select * from TBL_BOARD order by bno desc;


select /*+index_desc (tbl_board pk_board) */* from tbl_board;

select bno, title, content, writer, regdate, updatedate
from(select /*+index_desc(tbl_board pk_board)*/ rownum rn, bno, title, content, writer, regdate, updatedate
from tbl_board where rownum <= 20) where rn >10;

create table tbl_member(
	id varchar2(50),
	pw varchar2(100),
	name varchar2(100),
	mDate date default sysdate
);

select * from tbl_member;

insert into tbl_member(id, pw, name) values('asd1', 'asd', '조건재');
insert into tbl_member(id, pw, name) values('asd2', 'asd', '건조재');
insert into tbl_member(id, pw, name) values('asd3', 'asd', '조재건');
insert into tbl_member(id, pw, name) values('asd4', 'asd', '건재조');
insert into tbl_member(id, pw, name) values('asd5', 'asd', '재건조');
insert into tbl_member(id, pw, name) values('asd6', 'asd', '가나다');
update tbl_member set pw='asd', name='조재건' where id='asd3';




--------------------------------

create table tbl_reply (
	rno number(10,0),  -- 댓글 번호
	bno number(10,0),  -- fk(게시판번호)
 	reply varchar2(1000) not null, -- 댓글
 	replyer varchar2(50) not null, -- 댓글 작성자
	replyDate date default sysdate,
	updateDate date default sysdate );

create sequence seq_reply ; -- 댓글용 자동번호객체 추가

alter table tbl_reply add constraint pk_reply primary key (rno); 
-- pk를 rno로 지정(롤이름 : pk_reply)

alter table tbl_reply add constraint fk_reply_board foreign key (bno) references tbl_board (bno); 
-- tbl_reply의 bno(자)와 tbl_board의 bno(부)를 연결 (부모가 있어야 자식이 있다) 

-- tbl_board 초기 -> 더미데이터 -> 댓글 더미데이터 입력

insert into TBL_REPLY (rno, bno, reply, replyer) values(seq_reply.nextval, 11, 'ㅋㅋㅋ', 'kkw1');
insert into TBL_REPLY (rno, bno, reply, replyer) values(seq_reply.nextval, 10, 'ㅎㅎㅎ', 'kkw2');
insert into TBL_REPLY (rno, bno, reply, replyer) values(seq_reply.nextval, 9, 'ㅠㅠㅠ', 'kkw3');
insert into TBL_REPLY (rno, bno, reply, replyer) values(seq_reply.nextval, 8, 'ㅇㅇㅇ', 'kkw4');
insert into TBL_REPLY (rno, bno, reply, replyer) values(seq_reply.nextval, 7, 'ㅁㅁㅁ', 'kkw5');

select * from tbl_reply;

select rno, bno, reply, replyer, replyDate, updateDate from TBL_REPLY where bno = 10 order by rno asc;





create table tbl_attach ( 
  uuid varchar2(100) not null,
  uploadPath varchar2(200) not null,
  fileName varchar2(100) not null, 
  filetype char(1) default 'I',
  bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key (uuid); 

alter table tbl_attach add constraint fk_board_attach foreign key (bno) references tbl_board(bno);
