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