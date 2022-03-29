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


















