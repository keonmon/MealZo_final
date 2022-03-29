-- MealZo Procedure


-------------- >> 프로시저문 하나에 경계선 하나 << -------------------

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
-- 전체보기 상품 개수 카운트
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
-- 최신순
create or replace procedure listProduct_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
    v_cnt number := 0;
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
-- 가격 낮은 순
create or replace procedure getalow_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
    v_cnt number := 0;
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
-- 가격 높은 순
create or replace procedure getahight_m(
    p_startNum number,
    p_endNum number,
    p_key VARCHAR2,
    p_cur out sys_refcursor )
is
    v_cnt number := 0;
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

-------------------------------------------------------------------
select * from mqna;
--QNA 디테일
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
  


