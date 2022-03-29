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






