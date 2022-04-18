-- MealZo Procedure

-------------- >> 프로시저문 하나에 경계선 하나 << -------------------
-- 메인(인덱스)
create or replace procedure getNewBestProduct_m(
    p_cur1 out sys_refcursor,
    p_cur2 out sys_refcursor )
is
begin
    open p_cur1 for 
        select * from 
	           ( select rownum, pseq, name, price2, image, content 
	            from mproduct where useyn='y' and useyn='y' order by indate desc) 
	            where rownum <= 6;
    open p_cur2 for 
        select * from 
				(select rownum, pseq, name, price2, image, content
				from mproduct where bestyn='y' and useyn='y' order by indate desc )
				where rownum <= 6;
end;


------------------------------------------------------------------
-- 전체-상품카운트
create or replace procedure getAllCount_m(
    p_key VARCHAR2,
    p_cnt out NUMBER )
is
    v_cnt number := 0;
begin
    select count(*) as cnt
        into v_cnt 
    from mproduct 
    where name like '%'||p_key||'%' and useyn='y';
    
    p_cnt := v_cnt;
end;

------------------------------------------------------------------
-- 전체-최신순
create or replace procedure listProduct_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select * from ( 
        select rownum as rn, p.* from 
        ((select * from mproduct  where name like '%'||p_key||'%' order by pseq desc) p)  
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;


------------------------------------------------------------------
-- 전체-낮은 순
create or replace procedure getalow_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from (
        select * from (
        select rownum as rn, p.* from 
        ((select * from mproduct  where name like '%'||p_key||'%'  order by price2) p) 
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;

------------------------------------------------------------------
-- 전체-높은 순
create or replace procedure getahight_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from (
        select * from (
        select rownum as rn, p.* from 
        ((select * from mproduct  where name like '%'||p_key||'%'  order by price2 desc) p) 
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;

--------------------------------------------------------------------------------

create or replace procedure insertCart_m(
    p_id IN mcart.id%TYPE,
    p_pseq  IN mcart.pseq%TYPE,
    p_quantity  IN mcart.quantity%TYPE )
IS
BEGIN
    insert into mcart( cseq, id, pseq, quantity ) 
    values( mcart_seq.nextVal, p_id, p_pseq, p_quantity );
    commit;    
END;

--------------------------------------------------------------------------------

create or replace procedure listCart_m(
    p_id IN mcart.id%TYPE, 
    p_cur OUT SYS_REFCURSOR   )
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM mcart_view where id=p_id;
END;


--------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE deleteCart_m(
    p_cseq  IN mcart.cseq%TYPE   )
IS
BEGIN
    delete from mcart where cseq = p_cseq;
    commit;    
END;


-------------->> 멤버 <<-------------------

CREATE OR REPLACE PROCEDURE getMember_m(
    p_id IN mmember.id%TYPE, 
    p_curvar OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_curvar FOR SELECT * FROM mmember WHERE id=p_id;
END;

--------------------------------오더인서트---------------------------------
CREATE OR REPLACE PROCEDURE insertOrder_m(
    p_id  IN  MORDERS.ID%TYPE,
    p_oseq  OUT  MORDERS.OSEQ%TYPE  )
IS
    v_oseq MORDERS.OSEQ%TYPE;
    temp_cur SYS_REFCURSOR;
    v_cseq MCART.CSEQ%TYPE;
    v_pseq MCART.PSEQ%TYPE;
    v_quantity MCART.QUANTITY%TYPE;
BEGIN
    INSERT INTO MORDERS(oseq, id) VALUES( morders_seq.nextVal, p_id);
    SELECT MAX(oseq) INTO v_oseq FROM MORDERS;
    OPEN temp_cur FOR SELECT cseq, pseq, quantity FROM MCART WHERE id=p_id and result='1';
    LOOP
        FETCH temp_cur INTO v_cseq, v_pseq, v_quantity;
        EXIT WHEN temp_cur%NOTFOUND; 
        INSERT INTO morder_detail( odseq, oseq, pseq, quantity )
        VALUES( morder_detail_seq.nextVal, v_oseq, v_pseq,  v_quantity ); 
        DELETE FROM MCART WHERE cseq = v_cseq;
    END LOOP;
    COMMIT;
    p_oseq := v_oseq;
END;

-------------------------------오더리스트---------------------------------------------------

CREATE OR REPLACE PROCEDURE listOrderByOseq_m(
    p_oseq IN morders.oseq%TYPE, 
    p_cur OUT SYS_REFCURSOR   )
IS
BEGIN
    OPEN p_cur FOR SELECT * FROM morder_view where oseq=p_oseq order by oseq desc;
END;

------------------------------------오더리스트------------------------------------------

CREATE OR REPLACE PROCEDURE listOrderByIdAll_m (
    p_id IN   MORDERS.id%TYPE,
    p_rc   OUT     SYS_REFCURSOR )
IS
BEGIN
    OPEN p_rc FOR
        SELECT DISTINCT oseq FROM (SELECT oseq, id FROM MORDER_VIEW ) WHERE id=p_id ORDER BY oseq desc;
END;



----------------------------------------------------------------



--베스트-카운트
create or replace procedure getAllCountByBest_m(
    -- p_key VARCHAR2,
    p_bestyn VARCHAR2,
    p_cnt out NUMBER )
is
    v_cnt number := 0;
begin
    select count(*) as cnt
    into v_cnt 
    from mproduct 
    where bestyn = p_bestyn;
    
    p_cnt := v_cnt;
end;

-------------------------------------------------------------------
--베스트-최신순 getBest_m
create or replace procedure getBest_m(
    p_startNum number,
    p_endNum number,
    p_bestyn VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct  where bestyn = p_bestyn and useyn='y' order by indate desc) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;

-------------------------------------------------------------------
--베스트-낮은 순
create or replace procedure getBLow_m(
    p_startNum number,
    p_endNum number,
    p_bestyn VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct  where bestyn = p_bestyn and useyn='y' order by price2) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;

-------------------------------------------------------------------
--베스트-높은 순
create or replace procedure getBHight_m(
    p_startNum number,
    p_endNum number,
    p_bestyn VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct  where bestyn = p_bestyn and useyn='y' order by price2 desc) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;

-------------------------------------------------------------------
--신상-최신순 
create or replace procedure getNewList_m(
    p_startNum number,
    p_endNum number,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct  where useyn='y' order by indate desc) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;

-------------------------------------------------------------------
--신상-낮은순 
create or replace procedure getNewLow_m(
    p_startNum number,
    p_endNum number,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select * from ( 
        select rownum as rn, p.* from 
        ( select * from mproduct where useyn='y' order by indate desc, price2 ) p  
        ) where rn>=p_startNum
        ) where rn<=p_endNum ;
end;

-------------------------------------------------------------------
--신상-높은순 
create or replace procedure getNewHight_m(
    p_startNum number,
    p_endNum number,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select * from ( 
        select rownum as rn, p.* from 
        ( select * from mproduct where useyn='y' order by indate desc, price2 desc ) p  
        ) where rn>=p_startNum
        ) where rn<=p_endNum ;
end;

-------------------------------------------------------------------
--한중양식-카운트 
create or replace procedure getAllCountByKind_m(
    -- p_key VARCHAR2,
    p_kind mproduct.kind%type,
    p_cnt out NUMBER )
is
    v_cnt number := 0;
begin
    select count(*) as cnt
    into v_cnt 
    from mproduct 
    where kind = p_kind;
    
    p_cnt := v_cnt;
end;

-------------------------------------------------------------------
--한중양식-최신순
create or replace procedure getKind_m(
    p_startNum number,
    p_endNum number,
    p_kind mproduct.kind%type,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct where kind=p_kind and useyn='y' order by indate desc) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;

-------------------------------------------------------------------
--한중양식-낮은순
create or replace procedure getLow_m(
    p_startNum number,
    p_endNum number,
    p_kind mproduct.kind%type,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct where kind=p_kind and useyn='y' order by price2) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;

-------------------------------------------------------------------
--한중양식-높은순
create or replace procedure getHight_m(
    p_startNum number,
    p_endNum number,
    p_kind mproduct.kind%type,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mproduct where kind=p_kind and useyn='y' order by price2 desc) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
end;
 
 --------------------------------------------------------------------
 --qna 추가
 create or replace procedure insertQna_m(
 p_id in mqna.id%type,
 p_subject in mqna.subject%type,
 p_content in mqna.content%type
 )
 is
 begin
 insert into mqna(qseq, id, subject, content)
 values(mqna_seq.nextVal, p_id, p_subject, p_content);
 end;
 
 ---------------------------------------------------------------------
 --페이징 추가 !
 create or replace procedure listQna_m(
p_startNum number,
p_endNum  number,
p_id  mqna.id%type ,
p_cur out sys_refcursor 
)

is 
--p_cur sys_refcursor ;
begin
open p_cur for 
select * from (
Select * from(
  select rownum as rn, p.* from (select * from mqna where id=p_id order by qseq desc) p
  ) where rn>=p_startNum
  ) where rn<=p_endNum ;
  

end;    
     -- c_cur :=p_cur;
-------------------------------------------------------------------------------
 create or replace procedure getAllCountQna_m(
   p_cnt OUT NUMBER
  )
 is 
  v_cnt number;
 begin
  select count(*) into v_cnt from mqna;
  p_cnt := v_cnt;
  end;
  

------------------------------------------------------------------------------
--ask 리스트

create or replace procedure listMask_m(
p_id in ask.id%type,
p_cur out sys_refcursor
)
is
begin
open p_cur for select * from ask_view  where id=p_id order by aseq desc;
end;

--------------------------------------------------------------------------------
-- ProductDetail - 상품정보 가져오기 getProduct_m

CREATE OR REPLACE PROCEDURE getProduct_m(
    p_pseq in mproduct.pseq%type,
    p_cur out sys_refcursor )
is
    vs_cnt mproduct.replycnt%type;
begin
    open p_cur for 
        select * from mproduct 
            where pseq = p_pseq;
            
    -- 상품리뷰 카운트 후 저장         
    select count(*) into vs_cnt
        from mreview where pseq = p_pseq;
    update mproduct 
        set replycnt = vs_cnt 
        where pseq = p_pseq;
    commit;
 end;

--------------------------------------------------------------------------------
-- ProductDetail - 상품이미지 가져오기 getImages_m

CREATE OR REPLACE PROCEDURE getImages_m(
    p_pseq in mproduct.pseq%type,
    p_cur1 out sys_refcursor, 
    p_cur2 out sys_refcursor )
is
begin
    open p_cur1 for 
        select * from mpdimg where pseq=p_pseq;
        
    open p_cur2 for 
        select * from mpdimg2 where pseq=p_pseq;
 end;

--------------------------------------------------------------------------------
-- ProductDetail - 상품리뷰 가져오기 getReviewListByPseq_m
CREATE OR REPLACE PROCEDURE getReviewListByPseq_m(
    p_pseq in mproduct.pseq%type,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from mreview where pseq=p_pseq;
end;

-----------------------------------------------------------------------------
--ask 디테일
create or replace procedure getAsk_m(
p_aseq in ask.aseq%type,
p_cur out sys_refcursor
)
is
begin
open p_cur for select * from ask_view where aseq=p_aseq;
end;
-------------------------------------------------------------------------------

--ask 올카운트
create or replace procedure getAllCountAsk_m(
 p_cnt OUT NUMBER
  )
 is 
  v_cnt number;
 begin
  select count(*) into v_cnt from ask_view;
  p_cnt := v_cnt;
  end;
-----------------------------------------------------------------------------
--ask 리스트 페이징 추가 !

create or replace procedure listMask_m(
startNum in number,
endNum in number,
p_id in ask.id%type,
p_cur out sys_refcursor
)
is
begin
open p_cur for 
select * from (
select * from (
select rownum rn, p.* from ( select * from ask_view  where id=p_id order by aseq desc ) p
)where rn>=startNum
)where rn<=endNum ;

end;
--------------------------------------------------------------------------------------------
--ask 작성
create or replace procedure insertAsk_m(
p_id ask.id%type,
p_title ask.title%type,
p_content_a ask.content%type,
p_pseq ask.pseq%type
)
is
begin
insert into ask(aseq,id, title, content,pseq)
values(ask_seq.nextVal, p_id, p_title, p_content_a, p_pseq);
end;


-----------------------------------------------------------------------------------
--3/31 review 후기  리스트 조회
create or replace procedure listReview_m(
p_id in mreview.id%type,
p_cur out sys_refcursor)
is
begin
open p_cur for
select * from mreview_view where id=p_id;
end;

--------------------------------------------------------------------------------------------
-- 관리자 조회 getAdmin_m

CREATE OR REPLACE PROCEDURE getAdmin_m(
    p_id in madmin.id%type,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from madmin where id=p_id;
end;
 
--------------------------------------------------------------------------------------------
-- Admin - 범용 카운트
-- Admin - 범용 카운트
create or replace procedure getAllcountAdmin_m(
    p_key VARCHAR2,
    p_tableName VARCHAR2,   -- 테이블명 변수
    p_culumnName VARCHAR2,
    p_cnt out NUMBER 
    )
is
    v_cnt int;
    v_sql varchar2(1000);   -- sql문을 저장할 변수
begin
    v_sql := 'select count(*) 
        from '||p_tableName||' 
        where '||p_culumnName||' like ''%'|| p_key ||'%'' order by rownum desc';
    --DBMS_OUTPUT.PUT_LINE(v_sql);
    EXECUTE IMMEDIATE v_sql into v_cnt;
    --DBMS_OUTPUT.PUT_LINE(v_cnt);   
    p_cnt := v_cnt;
end;

--------------------------------------------------------------------------------------------
-- Admin - 전체 주문 조회
create or replace procedure listOrder_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
begin
    open p_cur for 
        select * from ( 
        select * from (
        select rownum as rn, p.* from 
        ((select * from morder_view where oseq like '%'||p_key||'%' order by result, odseq desc) p) 
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;

-------------->> 멤버-로그인 <<-------------------

CREATE OR REPLACE PROCEDURE selectAddressByDong_m(
    p_dong IN mmember.address%TYPE, 
    p_curvar OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN p_curvar FOR SELECT * FROM address WHERE dong LIKE '%'||p_dong||'%';
END;

-------------->> 멤버-로그인 <<-------------------

CREATE OR REPLACE PROCEDURE insertMember_m(
    p_id IN mmember.id%TYPE,
    p_pwd  IN mmember.pwd%TYPE,
    p_name  IN mmember.name%TYPE,
    p_email  IN mmember.email%TYPE,
    p_phone  IN mmember.phone%TYPE,
    p_zip_num IN mmember.zip_num%TYPE,
    p_address IN mmember.address%TYPE  )
IS
BEGIN
    insert into mmember(id, pwd, name, email, phone, zip_num, address) 
    values( p_id, p_pwd, p_name, p_email, p_phone, p_zip_num, p_address);
    commit;    
END;


-------------->> 멤버-회원정보수정 <<-------------------

CREATE OR REPLACE PROCEDURE updateMember_m(
    p_id IN mmember.id%TYPE,
    p_pwd  IN mmember.pwd%TYPE,
    p_name  IN mmember.name%TYPE,
    p_email  IN mmember.email%TYPE,
    p_phone  IN mmember.phone%TYPE,
    p_zip_num IN mmember.zip_num%TYPE,
    p_address IN mmember.address%TYPE  )
IS
BEGIN
    update mmember set pwd=p_pwd, name=p_name, email=p_email, phone=p_phone, 
    zip_num=p_zip_num, address=p_address where id=p_id;
    commit;    
END;

-------------->> 주문-회원탈퇴 <<-------------------

CREATE OR REPLACE PROCEDURE selectOseqOrderAll_m (
    p_id IN MORDERS.id%TYPE,
    p_cur OUT  SYS_REFCURSOR )
IS
BEGIN
    OPEN p_cur FOR
        SELECT DISTINCT oseq FROM MORDER_VIEW where id=p_id and result='1' order by oseq desc;
END;

-------------->> 주문-회원탈퇴 <<-------------------

CREATE OR REPLACE PROCEDURE deleteOrders_m(
    p_oseq IN MORDERS.oseq%TYPE   )
IS
BEGIN
    delete from morders where oseq = p_oseq;
    commit;    
END;

-------------->> 주문-회원탈퇴 <<-------------------

CREATE OR REPLACE PROCEDURE deleteOrder_detail_m(
    p_oseq IN MORDERS.oseq%TYPE   )
IS
BEGIN
    delete from morder_detail where oseq = p_oseq;
    commit;    
END;

-------------->> 멤버-아이디/비밀번호찾기 <<-------------------

CREATE OR REPLACE PROCEDURE getMemberByemail_m (
    p_name IN mmember.name%TYPE,
    p_email IN mmember.email%TYPE,
    p_cur OUT  SYS_REFCURSOR )
IS
BEGIN
    OPEN p_cur FOR 
    SELECT * FROM mmember WHERE name=p_name and email=p_email;
END;

-------------->> 멤버-아이디/비밀번호찾기 <<-------------------

CREATE OR REPLACE PROCEDURE getMemberByphone_m (
    p_name IN mmember.name%TYPE,
    p_phone IN mmember.phone%TYPE,
    p_cur OUT  SYS_REFCURSOR )
IS
BEGIN
    OPEN p_cur FOR 
    SELECT * FROM mmember WHERE name=p_name and phone=p_phone;
END;

-------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE  productorderList_m(
p_pseq morder_detail.pseq%type,
p_id mmember.id%type,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from morder_view where pseq=p_pseq and id=p_id;
end;
-----------------------------------------------------------------------
--리뷰 추가 
create or replace procedure insertReview_m(
    p_id mreview.id%type,
    p_content mreview.content%type,
    p_pseq mreview.pseq%type )
is
begin
    insert into mreview(rseq, id, content, pseq)
        values(mreview_seq.nextVal, p_id, p_content, p_pseq);
    commit;
end;

-----------------------------------------------------------------------
-- Admin - 상품등록 
create or replace procedure insertProduct_m(
    p_kind in  mproduct.kind%type,
    p_name in  mproduct.name%type,
    p_bestyn in  mproduct.bestyn%type,
    p_useyn in  mproduct.useyn%type,
    p_content in  mproduct.content%type,
    p_price1 in  mproduct.price1%type,
    p_price2 in  mproduct.price2%type,
    p_image in  mproduct.image%type,
    p_image1 in  mproduct.image%type,
    p_image2 in mproduct.image%type )
is
    v_sql varchar2(500);
    v_lastPseq mproduct.pseq%type := 0;
begin

    insert into mproduct(pseq, name, kind, bestyn, useyn, content, price1, price2, image)
        values(MPRODUCT_SEQ.nextval, p_name, p_kind, p_bestyn, p_useyn, p_content, p_price1, p_price2, p_image);
    
    -- 마지막 pseq가져오기
    select max(pseq) into v_lastPseq from mproduct;
    
    -- DBMS_OUTPUT.PUT_LINE(v_lastPseq);
    
    
    -- 상세이미지 추가
    insert into mpdimg(pseq, image) values(v_lastPseq, p_image1);
    insert into mpdimg2(pseq, image) values(v_lastPseq, p_image2);
    commit;
end;


----------------------------------------------------------------
--어드민 리뷰리스트 조회
create or replace procedure adminlistReview_m(

c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from mreview_view ;
end;
----------------------------------------------------------------------------------
--어드민 리뷰리스트 조회 페이징 추가!
create or replace procedure adminlistReview_m(
p_key in varchar2,
p_startNum number,
p_endNum number,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from(
select * from(
select rownum rn, p.* from (select * from mreview_view where name like '%'||p_key||'%') p  
)where rn >= p_startNum 
)where rn <=p_endNum;
end;

--------------------------------------------------------------------------------------
--리뷰 삭제
create or replace procedure admindeleteReview_m(
p_rseq in mreview.rseq%type
)
is
begin
delete from mreview where rseq=p_rseq;
commit;
end;

-----------------------------------------------------------------------
-- Admin - 상품수정 updateProduct_m 
create or replace procedure updateProduct_m(
    p_pseq in  mproduct.pseq%type,
    p_kind in  mproduct.kind%type,
    p_name in  mproduct.name%type,
    p_bestyn in  mproduct.bestyn%type,
    p_useyn in  mproduct.useyn%type,
    p_content in  mproduct.content%type,
    p_price1 in  mproduct.price1%type,
    p_price2 in  mproduct.price2%type,
    p_image in  mproduct.image%type,
    p_image1 in  mproduct.image%type,
    p_image2 in mproduct.image%type )
is
begin
    update mproduct set name=p_name, kind=p_kind, bestyn=p_bestyn, useyn=p_useyn, content=p_content, price1=p_price1, price2=p_price2, image=p_image
        where pseq = p_pseq;

    -- 상세이미지 추가
    update mpdimg set image=p_image1 where pseq=p_pseq;
    update mpdimg2 Set image=p_image2 where pseq=p_pseq;
    commit;
end;

select * from mproduct;

--------------------------------------------------------------------------------------
--4/1
----admin ask 리스트 조회
create or replace procedure adminlistAsk_m(
key in varchar2,
startNum in number,
endNum in number,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from (
select *from (
select rownum rn, p.* from (select * from ask_view where pname || content_a like '%'||key||'%' order by  arseq desc) p
) where rn>=startNum
) where rn<=endNum ;
end;

---------------------------------------------------------------------------------
--ask 올카운트
create or replace procedure getAllcountAdminAsk_m(
    p_key VARCHAR2,
    p_tableName VARCHAR2,   -- 테이블명 변수
    p_culumnName VARCHAR2,
    p_cnt out NUMBER 
    )
is
    v_cnt int;
    v_sql varchar2(1000);   -- sql문을 저장할 변수
begin
    v_sql := 'select count(*) 
        from '||p_tableName||' 
        where '||p_culumnName||' like ''%'|| p_key ||'%'' order by indate_a desc';
    --DBMS_OUTPUT.PUT_LINE(v_sql);
    EXECUTE IMMEDIATE v_sql into v_cnt;
    --DBMS_OUTPUT.PUT_LINE(v_cnt);   
    p_cnt := v_cnt;
end;
------------------------------------------------------------------------------
--adminAskDetail
create or replace procedure getAdminAsk_m(
p_aseq in ask.aseq%type,
c_cur out sys_refcursor)
is
begin
open c_cur for
select * from ask_view where aseq=p_aseq;
end;
----------------------------------------------------------------------------
--어드민 ask 문의 답글
create or replace procedure adminAskReply_m(
p_aseq in ask_reply.aseq%type,
p_content in ask_reply.content%type
)
is
begin
insert into ask_reply(arseq, aseq, content)
values (ask_reply_seq.nextVal, p_aseq, p_content);
end;

------------------------------------------------------------------------
--어드민 문의 답글 수정
create or replace procedure adminAskUpdate_m(
p_aseq in ask_reply.aseq%type,
p_content in ask_reply.content%type
)
is
begin
update ask_reply set content=p_content where aseq=p_aseq;
commit;
end;

------------------------------------------------------------------------
--admin 상품 삭제   deleteProduct_m
create or replace procedure deleteProduct_m(
    p_pseq in mproduct.pseq%type  )
is
begin
    
    delete from mpdimg where pseq = p_pseq;
    delete from mpdimg2 where pseq = p_pseq;
    delete from mproduct where pseq = p_pseq;
    commit;
end;
------------------------------------------------------------------------
--admin 주문/배송정보 변경   updateOrderResult_m
create or replace procedure updateOrderResult_m(
    p_odseq in morder_detail.odseq%type,
    p_selectedIndex in morder_detail.odseq%type )
is
begin
    update morder_detail set result=p_selectedIndex where odseq=p_odseq;
    commit;
end;

---------------------------------오더캔슬업데이트---------------------------------

CREATE OR REPLACE PROCEDURE orderCancelUpdate_m(
    p_odseq  IN morder_detail.odseq%TYPE   )
IS
BEGIN
    update morder_detail set RESULT=4 where odseq=p_odseq;
    commit;    
END;

------------------------------오더캔슬-------------------------------------------

CREATE OR REPLACE PROCEDURE orderCancelForm_m(
    p_id IN morders.id%TYPE, 
    p_cur OUT SYS_REFCURSOR   )
IS
BEGIN
    OPEN p_cur FOR  
        SELECT DISTINCT oseq from(SELECT oseq,id FROM mordercancel_view) where id=p_id ORDER BY oseq desc;
END;


select *from morder_view


-------------->> 카트-회원탈퇴 <<-------------------

CREATE OR REPLACE PROCEDURE deleteCart_m2(
     p_id IN mcart.id%TYPE   )
IS
BEGIN
    delete from mcart where id=p_id;
    commit;    
END;

---------------------------------------------------------------
--admin qna list
create or replace procedure adminlistQna_m(
p_startNum number,
p_endNum number,
key VARCHAR2,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from (
select * from (
select rownum rn, p.* from (select * from mqna where subject || id like '%'||key||'%' order by rep desc ) p
) where rn >= p_startNum
)where rn<= p_endNum;

end;
------------------------------------------------------------------
--damin qna 닶글
create or replace procedure admininsertQna_m(
p_qseq in mqna.qseq%type,
p_reply in mqna.reply%type
)
is
begin
update mqna set reply=p_reply, rep=2 where qseq=p_qseq ;
end;


-------------------------------------------------------------------------------

--리뷰 delete 
 create or replace procedure reviewDelete_m(
 p_rseq in mreview.rseq%type
 )
 is
 begin
 delete from mreview where rseq =p_rseq;
 end;

 -----------------------------------------------------------------------
 --오더캔슬 리스트
 create or replace procedure orderCancelForm_m(
 p_id in morders.id%type,
 c_cur out sys_refcursor
 )
 is
 begin
 open c_cur for
 select * from mordercancel_view where id=p_id;
 end;
---------------------------------------------------------------------------
--이벤트 eseq로 조회
create or replace procedure getEventSelect_m(
p_eseq in mevent.eseq%type,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from mevent where eseq=p_eseq;
end;

-----------------------------------------------------------------------
create or replace PROCEDURE getImgesEvent_m(
    p_eseq in mevent.eseq%type,
    p_cur1 out sys_refcursor
    )
is
begin
    open p_cur1 for 
        select image1, image2 from mevent where eseq=p_eseq;
end;


-------------->> user 공지리스트 디테일조회 getNoticeOne_m <<-------------------

create or replace procedure getNoticeOne_m(
    p_nseq IN notice.nseq%TYPE,
    c_cur out sys_refcursor )
is
begin
    open c_cur for
       select * from notice where nseq=p_nseq;
end;

-------------->> 어드민 - product 공개유/무 <<-------------------

create or replace procedure updateProductUseyn_m(
    p_pseq in mproduct.pseq%type,
    p_selectedIndex in varchar )
is
begin
    update mproduct 
        set useyn=p_selectedIndex  
        where pseq = p_pseq;
    commit;
end;


-------------->> user 공지리스트 디테일조회 geteventOne_m <<-------------------

create or replace procedure geteventOne_m(
    p_eseq IN mevent.eseq%TYPE,
    c_cur out sys_refcursor )
is
begin
    open c_cur for
       select * from mevent where eseq=p_eseq;
end;


---------------------------------------------------------
-- admin - 새 공지 등록
create or replace procedure insertNotice_m(
    p_subject in notice.subject%type,
    p_useyn in notice.useyn%type,
    p_content in notice.content%type,
    p_image1 in notice.image1%type ,
    p_result in notice.result%type)
is
begin
    insert into notice(nseq, subject,useyn, content, image1, result ) 
        values(NOTICE_SEQ.nextval,p_subject,p_useyn,p_content,p_image1, p_result );
    commit;
end;


---------------------------------------------------------
-- admin - 공지 수정
create or replace procedure updateNotice_m(
    p_nseq in notice.nseq%type,
    p_subject in notice.subject%type,
    p_useyn in notice.useyn%type,
    p_content in notice.content%type,
    p_image1 in notice.image1%type,
    p_result in notice.result%type
    )
is
begin
    update notice 
        set subject=p_subject, useyn=p_useyn, content=p_content, image1=p_image1 , result=p_result
        where nseq = p_nseq;
    commit;
end;

---------------------------------------------------------
-- admin - 공지사항 공개/비공개 셀렉박스변경
create or replace procedure updateNoticeUseyn_m(
    p_nseq in notice.nseq%type,
    p_selectedIndex in varchar )
is
begin
    update notice 
        set useyn=p_selectedIndex  
        where nseq = p_nseq;
    commit;
end;

--------------------------------------------------
-- Admin - 회원리스트 조회
create or replace procedure listMember_m(
    p_key in varchar2,
    p_startNum in number,
    p_endNum in number,
    c_cur out sys_refcursor )
is
begin
    open c_cur for
        select * from (
        select * from (
        select rownum as rn, p.* from 
        ((select * from mmember where name like '%'||p_key||'%') p) 
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;

--------------------------------------------------
-- Admin - 회원리스트 조회
create or replace procedure updateMemberResult_m(
    p_id in mmember.id%type,
    p_selectedIndex in varchar )
is
begin
    update mmember set useyn=p_selectedIndex where id=p_id ;
end;


-------------->> 비회원문의 - nmqna 테이블생성 <<-------------------

create table nmqna (
	  nqseq        number(5)    primary key,  -- 글번호 
	  subject     varchar2(300),            -- 제목
	  content     varchar2(1000),          -- 문의내용
	  reply       varchar2(1000),           -- 답변내용
	  id          varchar2(20),                 -- 임시id
	  pwd         varchar2(100),                 -- 임시pwd
	  rep         char(1)       default '1',        --1:답변 무  2:답변 유  
	  indate      date default  sysdate     -- 작성일
); 
alter table nmqna add qseq number(5) references mqna(qseq);
alter table nmqna drop column qseq
create sequence nmqna_seq start with 1;
select * from nmqna;

-------------->> 비회원문의 - 카운트 <<-------------------

create or replace procedure getAllCountnmQna_m(
   p_cnt OUT NUMBER
  )
 is 
  v_cnt number;
 begin
  select count(*) into v_cnt from nmqna;
  p_cnt := v_cnt;
  end;

-------------->> 비회원문의 - 리스트 <<-------------------

create or replace procedure nmlistQna_m(
p_startNum number,
p_endNum number,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from (
select * from (
select rownum rn, p.* from (select * from nmqna order by nqseq desc ) p
) where rn >= p_startNum
)where rn<= p_endNum;
end;

select * from nmqna
select * from mqna

-------------->> 비회원문의 - 글쓰기 <<-------------------

 create or replace procedure insertnmQna_m(
 p_id in nmqna.id%type,
 p_pwd in nmqna.pwd%type,
 p_subject in nmqna.subject%type,
 p_content in nmqna.content%type
 )
 is
 begin
 insert into nmqna(nqseq, id, pwd, subject, content)
 values(nmqna_seq.nextVal, p_id, p_pwd, p_subject, p_content);
 end;
 
 -------------->> 비회원문의 - 글조회 <<-------------------
 
 CREATE OR REPLACE PROCEDURE getnmQna_m(
p_nqseq in nmqna.nqseq%type,
c_cur out sys_refcursor
)
is
begin
 open c_cur for select * from nmqna where nqseq=p_nqseq;
 end;
 
 -------------->> 비회원문의 - 비밀번호조회 <<-------------------

CREATE OR REPLACE PROCEDURE getNmqnaByNqseq_m(
p_nqseq in nmqna.nqseq%type,
c_cur out sys_refcursor
)
is
begin
 open c_cur for select * from nmqna where nqseq=p_nqseq;
 end;

-----------------------------------------------------------------------------------------------
create or replace procedure adminlistReview_m(
p_key in varchar2,
p_startNum number,
p_endNum number,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from(
select * from(
select rownum rn, p.* from (select * from mreview_view where name like '%'||p_key||'%') p
)where rn >= p_startNum 
)where rn <=p_endNum;
end;
------------------------------------------------------------------------------------
--이벤트 업데이트
create or replace procedure eventUpdate_m(
p_eseq in mevent.eseq%type,
p_title in mevent.title%type,
p_content in mevent.content%type,
p_image1 in mevent.image1%type,
p_image2 in mevent.image2%type,
p_subtitle in mevent.subtitle%type,
p_startdate in mevent.startdate%type,
p_enddate in mevent.enddate%type
)
is
begin
update mevent set  title=p_title, content=p_content,
image1=p_image1, image2=p_image2, subtitle=p_subtitle, startdate=p_startdate,
enddate=p_enddate where eseq=p_eseq;
end;
---------------------------------------------------------------------------------
--insert EVent
create or replace procedure eventInsert_m(
p_eseq in mevent.eseq%type,
p_title in mevent.title%type,
p_content in mevent.content%type,
p_image1 in mevent.image1%type,
p_image2 in mevent.image2%type,
p_subtitle in mevent.subtitle%type,
p_startdate in mevent.startdate%type,
p_enddate in mevent.enddate%type
)
is
begin
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate)
values(mevent_seq.nextVal , p_title, P_content, p_image1, p_image2, p_subtitle, p_startdate, p_enddate);

end;


---------------------------------------------------------------------------------
-- Admin - 배너 테이블 조회 getBannerList_m
create or replace procedure getBannerList_m(
    c_cur out sys_refcursor )
is
begin
    open c_cur for
        select * from MRollingBanner order by num;

end;

---------------------------------------------------------------------------------
-- Admin - 모든 배너 삭제 deleteBanner_m
create or replace procedure deleteBanner_m
is
begin
    delete MRollingBanner;
end;

---------------------------------------------------------------------------------
-- Admin - 배너 재배치 insertBanner_m
create or replace procedure insertBanner_m(
    p_num MRollingBanner.num%type,
    p_name MRollingBanner.name%type,
    p_image MRollingBanner.image%type,
    p_url MRollingBanner.url%type )
is
begin
    insert into MRollingBanner(num,name,image,url)
        values(p_num,p_name,p_image,p_url);
end;

------------------------------------------------------------------------------------
--이벤트 삭제
create or replace procedure eventDelete_m(
p_eseq in mevent.eseq%type
)
is
begin
delete from mevent where eseq=p_eseq;
end;

----------------------------------------------------------------------
--Zzim 한 상픔 리스트 보기 allcount
create or replace procedure getAllCountZzim_m(
 p_cnt OUT NUMBER
  )
 is 
  v_cnt number;
 begin
  select count(*) into v_cnt from zzim_view;
  p_cnt := v_cnt;
  end;
  
------------------------------------------------------------------------
  --Zzim 한 상픔 리스트 보기
  create or replace procedure  listZzim_m(
  startNum number,
  endNum number,
  p_id in mzzim.id%type,
  c_cur out sys_refcursor
  )
  is
  begin
  open c_cur for
  select * from (
  select * from (
  select rownum rn, p. *from ( select * from zzim_view where id= p_id order by indate desc) p
  ) where rn>=startNum
  ) where rn<=endNum ;
  end;
  

  --------------------------------------------------------------------------
  --리스트 개인 조회
  create or  replace procedure getlistZzim_m(
  p_pseq in mzzim.pseq%type,
  p_id in mzzim.id%type,
  c_cur out sys_refcursor
  )
  is
  begin
open c_cur for
  select * from zzim_view where pseq=p_pseq and id=p_id;
  end;
  
----------------------------------------------------------------------------
--찜 추가
create or replace procedure zzimInsert_m(
p_id in mzzim.id%type,
p_pseq in mzzim.pseq%type
)
is
begin
insert into mzzim(zseq, id, pseq)
values(mzzim_seq.nextVal, p_id, p_pseq);
end;
-------------------------------------------------------------------------------
--찜삭제
create or replace procedure zzimDelete_m(
  p_pseq in mzzim.pseq%type )
is
begin
delete from mzzim where pseq=p_pseq;
commit;
end;

--------------------------- 이벤트 실험 -------------------------
  
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 고모저모', '박막례시피 출시', 'event1.jpg',
'event1_inner1.jpg','고모 할머니와 함께!', to_date('2022-11-25','yyyy-MM-dd hh24:mi:ss'), 
to_date('2023-12-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));

insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 고모저모', '박막례시피 출시', 'event1.jpg',
'event1_inner1.jpg','고모 할머니와 함께!', to_date('2022-05-10','yyyy-MM-dd hh24:mi:ss'), 
to_date('2022-12-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));

select * from mevent

-------------->> admin 이벤트리스트조회   geteventList_m 수정 <<-------------------
create or replace procedure geteventList_m(
    p_key in varchar2,
    p_startNum in number,
    p_endNum in number,
    c_cur out sys_refcursor )
is
begin
    open c_cur for
        select * from ( 
        select rownum as rn, p.* from 
        (select * from mevent where title like '%'||p_key||'%' order by startdate desc) p 
        ) where rn>=p_startNum 
        and rn<=p_endNum ;
        
end;
select * from mevent;

-------------->> admin qna list 회원/비회원 동시 조회수정 <<-------------------
-- 도르마무 ---
create or replace procedure adminlistQna_m2(
p_startNum number,
p_endNum number,
key VARCHAR2,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from (
select * from (
select rownum rn, p.* from (
select qseq,id,rep,subject,content,reply,indate from mqna union all 
select nqseq,id,rep,subject,content,reply,indate from nmqna 
where subject || id like '%'||key||'%' order by rep desc,indate desc ) p
) where rn >= p_startNum
)where rn<= p_endNum;
end;

-------------->> admin qna 디테일 회원/비회원 조회수정 <<-------------------
-- 도르마무  실행안함 !!!!!!!!!!!!!!!!!!!!!!!하지마세요---
CREATE OR REPLACE PROCEDURE getQna_m2(
p_qseq in number,
c_cur out sys_refcursor
)
is
begin
 open c_cur for 
 select qseq,id,rep,subject,content,reply,indate from mqna union all 
 select nqseq as qseq,id,rep,subject,content,reply,indate from nmqna 
 where qseq = p_qseq;
end;

select * from nmqna
select * from mqna

-------------->> admin qna 디테일 조회수정 <<-------------------

CREATE OR REPLACE PROCEDURE getQna_m(
p_qseq in mqna.qseq%type,
c_cur out sys_refcursor
)
is
begin
 open c_cur for select * from mqna where qseq=p_qseq;
 end;
 
-------------->> admin nmqna list <<-------------------

create or replace procedure adminnmlistQna_m(
p_startNum number,
p_endNum number,
key VARCHAR2,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from (
select * from (
select rownum rn, p.* from (select * from nmqna where subject || id like '%'||key||'%' order by rep desc ) p
) where rn >= p_startNum
)where rn<= p_endNum;
end;

-------------->> admin nmqna 디테일 조회수정 <<-------------------

CREATE OR REPLACE PROCEDURE getnmQna_m(
p_nqseq in nmqna.nqseq%type,
c_cur out sys_refcursor
)
is
begin
 open c_cur for select * from nmqna where nqseq=p_nqseq;
 end;
 
-------------->> admin nmqna 답글 <<-------------------

create or replace procedure admininsertnmQna_m(
p_nqseq in nmqna.nqseq%type,
p_reply in nmqna.reply%type
)
is
begin
update nmqna set reply=p_reply, rep=2 where nqseq=p_nqseq ;
end;


---------------------------------------------------
-- 장바구니 개수 카운트 -- getCartCnt_m
create or replace procedure getCartCnt_m(
    p_id in mmember.id%type,
    p_cnt out number )
is
    v_cnt number := 0;
begin
    select count(*) into v_cnt from mcart where id=p_id ;
    p_cnt := v_cnt; 
end;
select count(*) from mcart where id='somi';


--------------------------------------------------------
--찜 갯수
create  or replace procedure getZimcount_m(
p_pseq in mproduct.pseq%type,
p_cnt out number

)
is
v_cnt number;
begin 
select count(*) into v_cnt from mzzim where pseq=p_pseq;
--select pseq,  count(pseq) as cnt  from mzzim group by pseq=p_pseq;
p_cnt := v_cnt;
end;



------------------------------------------------------------------------
--밍디 즉시구매
create or replace procedure  orderInsertNow(
p_id in morders.id%type,
p_pseq in morder_detail.pseq%type,
p_oseq out morders.oseq%type,
p_quantity in morder_detail.quantity%type
)

is
v_oseq morders.oseq%type;
begin
    insert into morders(oseq, id) values(morders_seq.nextVal, p_id);
    select max(oseq) into v_oseq from morders;
    insert into morder_detail(odseq, oseq, pseq, quantity) 
        values(morder_detail_seq.nextVal, v_oseq, p_pseq, p_quantity);

commit;
p_oseq := v_oseq;
end;




----------------- Qna List 다시돌려야합니다 --------------------------

create or replace procedure listQna_m(
p_startNum number,
p_endNum number,
p_id in mqna.id%type ,
c_cur out sys_refcursor 
)
is
begin
open c_cur for
select * from (
select * from (
select rownum rn, p.* from (select * from mqna where id=p_id order by qseq desc ) p
) where rn >= p_startNum
)where rn<= p_endNum;
end;
-------------------------------------------------------
-- user 공지사항 카운트 getAllCountNotice_m
create or replace procedure getAllCountNotice_m(
    p_cnt out NUMBER )
is
    v_cnt number := 0;
begin
    select count(*) as cnt
    into v_cnt 
    from notice  
    where useyn='y';
    
    p_cnt := v_cnt;
end;

-----------------------------------------------------------------------------
-- admin 공지 조회 getNoticeAll_m
create or replace procedure getNoticeAll_m(
    p_key in varchar2,
    p_startNum in number,
    p_endNum in number,
    c_cur out sys_refcursor )
is
begin
    open c_cur for
        select * from (
        select * from (
        select rownum as rn, p.* from  
        ((select * from notice where subject like '%'||p_key||'%'  order by  indate desc,  useyn desc result desc ) p) 
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;
-----------------------------------------------------------------------------
-- user 공지 조회 getNoticeList_m
create or replace procedure getNoticeList_m(
    p_startNum in number,
    p_endNum in number,
    c_cur out sys_refcursor )
is
begin
    open c_cur for
        select * from (
        select * from (
        select rownum as rn, p.* from 
        ((select * from notice where useyn='y' or useyn='p' order by   indate desc, result desc ) p) 
        ) where rn>=p_startNum
        ) where rn<=p_endNum;
end;

select * from notice

-------------->> 멤버-회원탈퇴 다시돌려야합니다 <<-------------------

CREATE OR REPLACE PROCEDURE updateUseyn_m(
    p_id IN mmember.id%TYPE )
IS
BEGIN
    update mmember set useyn='n' where id=p_id;
    commit;    
END;
----------------------------------------------------------
-- ORDER ODSEQ로 RESULT값 조회 쿼리 getResultByOdseq_m
CREATE OR REPLACE PROCEDURE getResultByOdseq_m(
    p_odseq IN morder_detail.odseq%TYPE,
    p_result out morder_detail.result%type
)
IS
v_result NUMBER := 1;
BEGIN
    select result 
        into v_result 
        from morder_detail where odseq = p_odseq;
        
    p_result := v_result;
END;



----------------------------------------------------------
select * from notice;
select * from morder_detail;
select * from nmqna;
select * from mqna;
select * from mmember;