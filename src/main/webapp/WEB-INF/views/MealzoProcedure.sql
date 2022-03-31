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
	            from mproduct where useyn='y' order by indate desc) 
	            where rownum <= 6;
    open p_cur2 for 
        select * from 
				(select rownum, pseq, name, price2, image, content
				from mproduct where bestyn='y' order by indate desc )
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


-----------------------------------------------------------------------------------

--QnaList
create or replace procedure listQna_m(
p_id in mqna.id%type ,
c_cur out sys_refcursor 
)

is 
begin
open c_cur for 
  select * from mqna where id=p_id ;
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
    OPEN temp_cur FOR SELECT cseq, pseq, quantity FROM CART WHERE id=p_id and result='1';
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
    OPEN p_cur FOR SELECT * FROM morder_view where oseq=p_oseq;
END;

------------------------------------오더리스트------------------------------------------

CREATE OR REPLACE PROCEDURE listOrderByIdAll_m (
    p_id IN   MORDERS.id%TYPE,
    p_rc   OUT     SYS_REFCURSOR )
IS
BEGIN
    OPEN p_rc FOR
        SELECT DISTINCT oseq FROM (SELECT oseq, id FROM MORDER_VIEW ORDER BY result, oseq desc) WHERE id=p_id;
END;







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



----------------------------------------------------------------------------

--QNA 디테일------------------------------

select * from mqna;

CREATE OR REPLACE PROCEDURE getQna_m(
p_qseq in mqna.qseq%type,
c_cur out sys_refcursor
)
is
begin
 open c_cur for select * from mqna where qseq=p_qseq;
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
        where '||p_culumnName||' like ''%'|| p_key ||'%'' order by indate desc';
    --DBMS_OUTPUT.PUT_LINE(v_sql);
    EXECUTE IMMEDIATE v_sql into v_cnt;
    --DBMS_OUTPUT.PUT_LINE(v_cnt);   
    p_cnt := v_cnt;
end;

exec getAllcountAdmin_m('스테이크', 'mproduct', 'name');
select * from mproduct;


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

-------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE  productorderList_m(
p_pseq morder_detail.pseq%type,
c_cur out sys_refcursor
)
is
begin
open c_cur for
select * from morder_view where pseq=p_pseq;
end;
-----------------------------------------------------------------------
create or replace procedure insertReview_m(
p_id mreview.id%type,
p_content mreview.content%type,
p_pseq mreview.pseq%type
)
is
begin
insert into mreview(rseq, id, content, pseq)
values(mreview_seq.nextVal, p_id, p_content, p_pseq);
end;
