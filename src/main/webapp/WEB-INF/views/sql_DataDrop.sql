-- ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ 주의 ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀

--▶ ▶ ▶ ▶ ▶ ▶ DB 삭제용 sql문입니다.  ◀ ◀ ◀ ◀ ◀ ◀

-- ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ 주의 ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀

--▶ ▶ ▶ ▶ ▶ ▶ DB 삭제용 sql문입니다.  ◀ ◀ ◀ ◀ ◀ ◀

-- ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ ▶ 주의 ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀ ◀

--▶ ▶ ▶ ▶ ▶ ▶ DB 삭제용 sql문입니다.  ◀ ◀ ◀ ◀ ◀ ◀
-- drop table 테이블명 cascade constraints;

--테이블 삭제
drop table mmember cascade constraints;

drop table mproduct cascade constraints;

drop table mpdimg cascade constraints;

drop table mpdimg2 cascade constraints;

drop table madmin cascade constraints;

drop table mcart cascade constraints;

drop table morders cascade constraints;

drop table morder_detail cascade constraints;

drop table mevent cascade constraints;

drop table mqna cascade constraints;

drop table mreview cascade constraints;

drop table subscribeinfo cascade constraints;

drop table ask cascade constraints;

drop table ask_reply cascade constraints;

drop table notice cascade constraints;

-- 시퀀스 삭제
drop sequence mproduct_seq;
drop sequence mpdimg_seq;
drop sequence mpdimg2_seq;
drop sequence mcart_seq;
drop sequence morders_seq;
drop sequence morder_detail_seq;
drop sequence mevent_seq;
drop sequence mqna_seq;
drop sequence mreview_seq;
drop sequence subscribeInfo_seq;
drop sequence ask_seq;
drop sequence ask_reply_seq;
drop sequence notice_seq;

-- 뷰 삭제
DROP VIEW hight_mpro_view;
DROP VIEW morder_view;
DROP VIEW mordercancel_view;
DROP VIEW subscribe;
DROP VIEW ask_view;
DROP VIEW mcart_view;


