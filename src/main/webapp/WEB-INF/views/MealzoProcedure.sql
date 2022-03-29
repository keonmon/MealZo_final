-- MealZo Procedure

-------------- >> 프로시저문 하나에 경계선 하나 << ---------------------------------

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

--------------------------------------------------------------------------------





















