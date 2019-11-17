--Milan Mall 웹 프로젝트(2차 개인 플젝)

--필요한 테이블 
--1.회원테이블
--2.Q&A게시판테이블 (게시판 대신 그냥 받음.)
--3.후기게시판 테이블 
--4.Q&A리플테이블 (없앰)
--5.후기리플테이블 
--6.제품테이블
--7.장바구니테이블

--고객(회원)정보 테이블
create table member_milan (
	member_id	varchar2(20) primary key	--고객 아이디
	,password	varchar2(20) not null		--비밀번호
	,name		varchar2(30) not null		--고객 이름
	,email		varchar2(50) not null		--고객 이메일
	,address	varchar2(100) not null		--고객 주소
	,phonenum	varchar2(50) not null		--고객 전화번호
	,joindate	date	default sysdate		--가입 날짜
	,outdate	date						--탈퇴 날짜
);

-- 문의(Q&A)게시판 본문 글 테이블
create table QA_board (
	qa_num			number	primary key,		--글번호
	qa_id			varchar2(20) not null,		--작성자 ID
	qa_name			varchar2(50) not null,		--작성자이름
	qa_title		varchar2(100) not null,		--글제목
	qa_message		long not null,	--글내용
	qa_inputdate	date	default sysdate,	--작성날짜,시간
);

-- Q&A게시판 일련번호에 사용할 시퀀스 
create sequence QA_board_seq start with 1 increment by 1;

-- 후기게시판 본문 글 테이블 (review table)
create table revw_board (
	revw_boardnum		number	primary key,		--글번호
	revw_id				varchar2(20) not null,		--작성자 ID
	revw_title			varchar2(100) not null,		--글제목
	revw_content		clob not null,				--글내용
	revw_inputdate		date	default sysdate,	--작성날짜,시간
	revw_hits			number 	default 0,			--조회수
	revw_like			number default 0,			--추천
	revw_originalfile	varchar2(200),				--첨부파일명 (원래 이름)
	revw_savedfile		varchar2(100)				--첨부파일명 (실제 저장된 이름)
);

-- 후기게시판 일련번호에 사용할 시퀀스 
create sequence revw_board_seq start with 1 increment by 1;

-- 질문게시판 리플 내용
create table qa_reply (
	qa_replynum		number	primary key,		--리플번호
	qa_boardnum		number not null,			--본문 글번호
	qa_id			varchar2(20) not null,		--작성자 ID
	qa_text			varchar2(200) not null,		--리플내용
	qa_inputdate	date 	default sysdate,	--작성날짜
	constraint qa_reply_fk foreign key(qa_boardnum) 
		references qa_board(qa_boardnum) on delete cascade
);

-- 질문게시판 리플에 사용할 시퀀스
create sequence qa_reply_seq start with 1 increment by 1;

-- 후기게시판 리플 내용
create table revw_reply (
	rep_replynum		number	primary key,		--리플번호
	revw_boardnum		number not null,			--본문 글번호
	rep_id				varchar2(20) not null,		--작성자 ID
	rep_text			varchar2(200) not null,		--리플내용
	rep_inputdate		date 	default sysdate,	--작성날짜
	constraint rep_reply_fk foreign key(revw_boardnum) 
		references revw_board(revw_boardnum) on delete cascade
);

-- 후기게시판 리플에 사용할 시퀀스
create sequence revw_reply_seq start with 1 increment by 1;

--제품 정보 테이블
create table product (
	prod_name	varchar2(100) not null,	--제품 이름
	prod_num	varchar2(100) primary key,	--제품번호
	prod_ea		number	not null,		--제품수량		
	prod_price	varchar2(50) not null,	--제품가격
	prod_hits	number	default 0,		--제품 추천
	prod_category	varchar2(100) not null,	--제품 분류	 (ball, training, Kits(jersey), souvenir)
	prod_size	number	not null,		--제품 사이즈 (95-S, 100-M, 105-L) 
	prod_imgpath varchar2(1000),		--제품 이미지경로
	main		number					--메인에 보이는 유무.
);


--장바구니 정보 테이블 (사용안함 - Session으로 대체)
create table product_cart (
	cart_id		number primary key,		--카트 id
	prod_name	varchar2(100) not null,	--제품 이름
	cart_userid			varchar2(50) not null,	--사용자 id
	prod_num	varchar2(100) not null,	--제품번호
	prod_ea		number	not null,		--제품수량		
	prod_price	varchar2(50) not null,	--제품가격
	prod_size	number	not null		--제품 사이즈 (95-S, 100-M, 105-L, 110-XL) 	
);

-- 장바구니 테이블 제약조건(외래키) 생성
ALTER TABLE product_cart ADD CONSTRAINT cart_userid_fk FOREIGN KEY(cart_userid) REFERENCES member_milan(member_id);
ALTER TABLE product_cart ADD CONSTRAINT prod_num_fk FOREIGN KEY(prod_num) REFERENCES product(prod_num);





















