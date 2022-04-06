-- 회원
create table mmember ( 
	 id varchar2(20) not null,
	 pwd varchar2(20) not null,
	 name varchar2(20) NOT NULL,
	email varchar2(40) NOT NULL,
	zip_num varchar2(10) NOT NULL,
	address varchar2(100) NOT NULL,
	phone varchar2(20) NOT NULL,
	useyn char(1) DEFAULT 'y', 
	service number(2) DEFAULT 0, --정기배송 0-미가입 1-정기구독 2-정기결제
	PRIMARY KEY (id)
); 
--drop table mmember CASCADE CONSTRAINTS;
select * from mmember;


-- 상품
create table mproduct(
	pseq number(5) not null, 
	name varchar2(100) not null,
	kind varchar2(20) not null,
	price1 number(7), --원가
	price2 number(7), --판매가 
	bestyn char(1) DEFAULT 'n',  --베스트상품
	content varchar2(300),
	useyn char(1) DEFAULT 'y', -- 재고확보 y-판매 n-재고확보중
	indate date DEFAULT sysdate,    -- 등록일
	image varchar2(50),	--썸네일 이미지
	replycnt number(3) default 0,
	PRIMARY KEY (pseq)
);
create sequence mproduct_seq start with 1;
select * from mproduct ;


-- 상품 상세 이미지 
create table mpdimg (
	pseq number(5) references mproduct(pseq), --상품번호
	image varchar2(50)
);
create sequence mpdimg_seq start with 1;
select * from mpdimg;

-- 상품 상세 이미지2
create table mpdimg2 (
	pseq number(5) references mproduct(pseq), --상품번호
	image varchar2(50)
);
create sequence mpdimg2_seq start with 1;
select * from mpdimg2;


-- 관리자 계정
create table madmin(
	id varchar2(20) NOT NULL,
	pwd varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	phone varchar2(20) NOT NULL,
	PRIMARY KEY (id)
);
select * from madmin;


-- 장바구니
create table mcart ( 
	  cseq         number(10)    primary key,  -- 장바구니 일련번호
	  id             varchar2(16)   references mmember(id),   -- 주문자 아이디(FK :　member.id) 
	  pseq        number(5)     references mproduct(pseq),  -- 주문 상품번호(FK :product.pseq) 
	  quantity   number(5)     default 1,        -- 주문 수량
	  result       char(1)       default '1',      -- 1:미처리(카트에 담김 상태, 주문전)   2:처리(주문완료)
	  indate       date          default SYSDATE   -- 장바구니에 담은 날짜
);
create sequence mcart_seq start with 1;
select * from mcart;


-- 주문
create table morders( 
	  oseq        number(10)    primary key,           -- 주문번호  
	  id          varchar2(16)   references mmember(id), -- 주문자 아이디
	  indate      date          default  sysdate       -- 주문일
);
select * from morders;
create sequence morders_seq start with 1;

insert into morders(oseq, id) values(morders_seq.nextVal, 'somi');
 --주문상세 테이블
create table morder_detail( 
	  odseq       number(10)   primary key,        -- 주문상세번호
	  oseq        number(10)   references morders(oseq),   -- orders 테이블에 추가된 주문번호  
	  pseq        number(5)    references mproduct(pseq),  -- 상품번호
	  quantity    number(5)    default 1,                 -- 주문수량
	  result      char(1)      default '1'                -- 1: 결제완료 2: 배송중 3: 배송완료 4: 주문취소   
);
create sequence morder_detail_seq start with 1;
select * from morder_detail;

insert into morder_detail(odseq, oseq, pseq)
values(morder_detail_seq.nextVal, 22, 120);

-- 이벤트 테이블
create table mevent(
	eseq number(5) primary key, 
	title varchar2(100), --제목
	content varchar2(3000), 
	image1 varchar2(50), --섬네일 이미지
	image2 varchar2(50),  --내용 이미지
	subtitle varchar2(50),  --이벤트 기간
	writeDate date default sysdate, --작성일
	startdate date,
	enddate date
);
create  sequence mevent_seq start with 1;
select * from mevent;


-- 주소 테이블
CREATE TABLE address (
       zip_num              VARCHAR2(7) NOT NULL,
       sido                 VARCHAR2(30) NOT NULL,
       gugun                VARCHAR2(30) NOT NULL,
       dong                 VARCHAR2(100) NOT NULL,
       zip_code             VARCHAR2(30) ,
       bunji                VARCHAR2(30) 
);
select * from address;
--DROP TABLE address ;


-- Q&A 테이블
create table mqna (
	  qseq        number(5)    primary key,  -- 글번호 
	  subject     varchar2(300),            -- 제목
	  content     varchar2(1000),          -- 문의내용
	  reply       varchar2(1000),           -- 답변내용
	  id          varchar2(20),                 -- 작성자(FK : member.id) 
	  rep         char(1)       default '1',        --1:답변 무  2:답변 유  
	  indate      date default  sysdate     -- 작성일
); 

create sequence mqna_seq start with 1;
select * from mqna;


-- 구독상품 테이블
create table subscribeinfo(
	siseq number(10) not null primary key,
	id varchar2(20) not null references mmember(id),
	indate date DEFAULT sysdate,	-- 서비스 가입일
	okyn char(1) default 'y'		-- 서비스 가입상태 y:가입중 / n:만료
);
create sequence subscribeInfo_seq start with 1;


--ask(문의)테이블 작성
create table ask(
	aseq number(5) primary key,
	title varchar2(300) not null,
	content varchar2(1000) not null,
	id varchar2(20) references mmember(id),
	pseq number(5) references mproduct(pseq),
	indate date default sysdate	--문의 등록일
);
create sequence ask_seq start with 1;

--ask_reply(문의_답변)테이블 작성
create table ask_reply(
	arseq number(5) primary key,
	aseq number(5) references ask(aseq),
	content varchar2(1000),
	indate date default sysdate	--답변 등록일
); 
create sequence ask_reply_seq start with 1;


	-- 공지 테이블
create table notice(
	nseq number(5) primary key,
	subject varchar2(50) not null,
	content varchar2(1500) not null,
	indate date default sysdate,
	image1 varchar2(50),		-- 내부이미지
	useyn char(1) default 'y'	-- y:공개 / n:비공개
);
create sequence notice_seq start with 1;
select * from notice;

select distinct oseq from morder_view where (result='1' or result='2' or result='3' ) and id='kim' order by oseq desc; 


-- 민지
 select * from 
( select rownum, pseq, name, price2, image, content , indate
 from mproduct where useyn='y' order by indate desc )
 where rownum <= 6 order by price2 desc;
select count(*) as cnt from mreview where mproductpseq=1;

select * from 
(select rownum, pseq, indate 
from mproduct order by indate desc, pseq desc) 
where rownum <= 1 ;

select* from ask_reply;

select * from mevent;
select * from ( select rownum, pseq, name, price2, image, content, indate  from mproduct where useyn='y' order by indate desc)   where rownum <= 6;
select count(*) as cnt from mproduct where bestyn='y'


-- ※ 뷰 생성 ※

-- 상품취소 뷰 (* order_detail의 result가 4면 주문취소임!) - 
create or replace view mordercancel_view  
as 
select  o.oseq, o.indate, o.id, 
	m.name as mname, m.zip_num, m.address, m.phone, 
	p.name as pname, p.price2, 
	d.odseq, d.pseq, d.quantity, d.result  
from morders o, morder_detail d, mmember m, mproduct p 
where o.oseq = d.oseq and o.id = m.id and d.pseq = p.pseq and d.result='4';


--상품후기
create table mreview (
	rseq number(5) primary key,
	pseq number(5) references mproduct(pseq),
	content     varchar2(1000),          -- 문의내용
	id          varchar2(20)  references mmember(id),                
	indate      date default  sysdate     -- 작성일
);
create sequence mreview_seq start with 1;


create or replace view hight_mpro_view
as
select * from
(select rownum, pseq, name, price2, image, kind 
from mproduct
order by price2 desc);

select * from HIGHT_MPRO_VIEW;

-- 주문관련 뷰 
select * from morder_view;
create or replace view morder_view 
as 
select d.odseq, o.oseq, o.indate, o.id, 
	m.name as mname, m.zip_num, m.address, m.phone, 
	d.pseq, p.name as pname, p.price2, d.quantity, d.result 
from morders o, morder_detail d, mmember m, mproduct p 
where o.oseq = d.oseq and o.id = m.id and d.pseq = p.pseq;

select distinct oseq  from morder_view  where (result='1' or result='2' or result='3') and id='hong' order by oseq desc;
select distinct oseq from morder_view where id='hong' order by oseq desc;
select * from mordercancel_view where oseq in(select distinct oseq from mordercancel_view where id='kim' );


-- 상품취소 뷰 (* order_detail의 result가 4면 주문취소임!)
create or replace view mordercancel_view  
as 
select  o.oseq, o.indate, o.id, 
	m.name as mname, m.zip_num, m.address, m.phone, 
	p.name as pname, p.price2, 
	d.odseq, d.pseq, d.quantity, d.result  
from morders o, morder_detail d, mmember m, mproduct p 
where o.oseq = d.oseq and o.id = m.id and d.pseq = p.pseq and d.result='4';

select * from mordercancel_view

	--ask_view (문의 뷰 생성)
create or replace view ask_view 
as 
select a.aseq, a.title, a.content as content_a, a.id, a.pseq, a.indate as indate_a, 
	r.arseq, r.content as content_r, r.indate as indate_r,   
 	p.name as pname, p.image, p.price2 
from ask a, ask_reply r, mproduct p 
where a.pseq=p.pseq and a.aseq = r.aseq(+);

select * from ask_view where id='somi';

select * from 
( select rownum, pseq, name, price2, image, content , indate
 from mproduct where useyn='y' order by indate desc )
 where rownum <= 6 order by price2;

select * from ask;
 
 -- 장바구니 뷰 추가
create or replace view mcart_view 
as
select c.cseq, c.id , m.name as mname, c.pseq, p.name as pname, c.quantity, p.price2, c.result, c.indate
from mcart c, mproduct p, mmember m
where c.pseq =  p.pseq and c.id = m.id; 
  
select * from mcart_view;



-- 구독회원 목록 뷰
create or replace view subscribe 
as 
select m.id, m.service, s.indate, s.okyn, s.siseq 
from mmember m, subscribeinfo s
where m.id=s.id;

select * from subscribe where id='kim';

select * from mreview;

select * from (
select * from (
select rownum, a.* from 
(( select r.rseq, r.pseq as r_pseq, r.id, r.content, r.indate, p.pseq as p_pseq, p.name
from mreview r, mproduct p 
where r.id like '%'||'s'||'%' and p.pseq = r.pseq order by r.rseq ) a ) 
) where rownum >= 1 
) where rownum <= 10; 
 
 select * from(
select r.rseq, r.pseq, r.id, r.content, r.indate, p.name as pname 
from mreview r, mproduct p
where p.pseq=r.pseq  order by rseq)
 where rownum <= 10 and rownum >=1;
 
 select count(distinct oseq) as cnt from morder_view where 'name' like '%'||''||'%' and id='somi' ;
 
 select count(*) as cnt from mreview 
 
 select * from ( 
select * from ( 
select rownum as rn , a.* from 
(( select r.rseq, r.pseq as r_pseq, r.id, r.content, r.indate, p.pseq as p_pseq, p.name 
from mreview r, mproduct p 
 where r.id like '%'||''||'%' and p.pseq = r.pseq order by r.rseq ) a ) 
) where rn >= 11 
) where rn <= 20;

 select * from ( 
 select rownum as rn, p.* from 
 (select * from mproduct  where bestyn = ? and useyn='y' and name like '%'||?||'%'  order by pseq desc) p 
 ) where rn>=? 
 and rn<=?


select * from (
select rownum as rn, p.* from
( select * from mproduct where useyn='y' and rownum <= ? order by indate desc ) p 
 ) where rn>=? and rn<=? ;
 
 select * from mproduct

 
 --------------------------------------------------------------------------------
 --리뷰 뷰 
 create or replace view mreview_view
 as 
 select r.rseq, r.pseq as r_pseq, r.id, r.content, r.indate, p.pseq as p_pseq, p.name 
 from mreview r, mproduct p
 where p.pseq=r.pseq ;
				
 select * from mreview_view
 select * from ask_view;
 select *from ask_reply
  select * from mreview;
  
 select * from ask;
 select * from mqna;
 delete from mqna where rep='1'
  delete from ask where aseq between 37 and 38;
delete from mreview where rseq=27;


select * from morder_view 
select * from order_detail
select * from mevent;
select image1, image2  from mevent where eseq='1';


--찜 상품 추가 
create table mzzim(
zseq number(5) primary key,
pseq number references mproduct(pseq),
id varchar2(20) references mmember(id),
indate date default sysdate -- 찜한날짜
);


 create or replace view zzim_view
as
select z.zseq, z.pseq  , z.id ,z.result, z.indate,  p.name , p.image, p.price2,  p.kind
from mzzim z, mproduct p
where z.pseq =p.pseq ;

create sequence mzzim_seq start with 1;


insert into mzzim(zseq, pseq, id) values(mzzim_seq.nextVal, 1, 'somi');

select * from zzim_view

alter table mzzim add result varchar2(15) default 'n';	
update mzzim set result='y' where zseq=1;

