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

-----------------------------------------------------------------------------------

--QnaList
create or replace procedure listQna_m(
p_id in mqna.id%type ,
c_cur out sys_refcursor 
)

is 
begin
open c_cur for 
  select * from qna where id=p_id ;
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







