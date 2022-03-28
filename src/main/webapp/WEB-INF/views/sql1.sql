
--유저회원 생성
insert into mmember (id, pwd, name, email, zip_num, address, phone, service ) 
values('somi','1234', '이소미' , 'somi@abc.com', '133-110', '서울시 성동구 성수동1가 1번지21호' , '010-1212-1212', 1);
insert into mmember (id, pwd, name, email, zip_num, address, phone, service ) 
values('hong','1234', '홍길동' , 'kang@abc.com', '133-110', '서울시 성동구 성수동1가 1번지21호' , '010-1212-1212', 1);
insert into mmember (id, pwd, name, email, zip_num, address, phone ) 
values('kim', '1234', '김길동', 'kim@kim.kim', '413-704', '경기 파주시 금촌동 경신아파트 123동 123호', '123-1233-1233');


-- 관리자 회원 추가
insert into madmin(id, pwd, name, phone) values('admin', 'admin', '밀조왕', '123-1234-1234');


-- 상품 추가 (한10 중10 양10 = 총 30개)
select * from mproduct;
insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '수육국밥', '한식', 3000, 4900, 'y', '한겨울에 먹으면 뜨끈뜨근', 'h_1_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '소머리설렁탕', '한식', 4200, 6900, 'y', '오산할머니 손맛', 'h_2_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '장어탕', '한식', 3900, 6500, 'y', '흑산도에서 맨손사냥', 'h_3_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '해물탕', '한식', 17800, 21900, 'y', '알짜배기 듬뿍', 'h_4_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '마늘통닭', '한식', 7500, 11900, 'y', '풍미백산통닭', 'h_5_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '간장소불고기', '한식', 13100, 15900, 'n', '스미스푸줏간 흑마늘첨가', 'h_6_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '매콤제육볶음', '한식', 13800, 16900, 'n', '스미스푸줏간 대추첨가', 'h_7_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '돈육맥적구이', '한식', 12900, 16900, 'n', '스미스푸줏간 통대파첨가', 'h_8_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '전복솥밥용 ', '한식', 5400, 9900, 'n', '오늘 저녁으로 제격', 'h_9_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '순두부그라탕8', '한식', 7300, 11900, 'n', '베러댄 비프', 'h_10_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '마파두부', '중식', 13100, 16900, 'y', '백리향 냄새 듬뿍', 'j_1_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '삼선짬뽕', '중식', 7500, 12900, 'y', '백리향 매콤', 'j_2_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '마라탕', '중식', 14200, 19900, 'y', '여지껏 맛본적없는 마라탕', 'j_3_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '정통마라훠궈', '중식', 21300, 27900, 'y', '한화이글스 화이팅', 'j_4_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '마라탄탄면', '중식', 6400, 10900, 'y', '한화이글스 우승해라', 'j_5_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '돈규볶음', '중식', 11900, 14900, 'n', '편스토랑 제공', 'j_6_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '깐쇼새우', '중식', 11800, 15900, 'n', '지동관 제공', 'j_7_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '동파육', '중식', 20000, 26900, 'n', '백리향냄새 듬뿍', 'j_8_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '우삼겹 짬뽕', '중식', 11400, 16900, 'n', '짬뽕이 이가격 맞나요', 'j_9_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '복분자탕수육', '중식', 7800, 10900, 'n', '발재반점 생산', 'j_10_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '스윗스테이크', '양식', 10900, 14900, 'y', '편스토랑 제공', 'y_1_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '크리스피치킨텐더', '양식', 7100, 8900, 'y', '프레시몬스터 제공', 'y_2_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '스파이시치킨텐더', '양식', 7100, 8900, 'n', '프레시몬스터 제공', 'y_3_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '머쉬룸리조또', '양식', 9400, 13900, 'y', 'V2 두유와 곁들여 먹으면 존맛탱', 'y_4_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '함박스테이크', '양식', 8700, 14900, 'y', '골든커리', 'y_5_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '찹스테이크', '양식', 12000, 14900, 'y', '치폴레에', 'y_6_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '떡갈비구이', '양식', 36900, 49000, 'n', '너무 비싼거 아니오', 'y_7_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '스테이크세트', '양식', 16200, 19900, 'n', '블랙라벨', 'y_8_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '안심스테이크', '양식', 43000, 79000, 'n', '내돈내산', 'y_9_thum.jpg');

insert into mproduct (pseq, name, kind, price1, price2, bestyn, content, image)
values(mproduct_seq.nextval, '토마호크스테이크', '양식', 51000, 69000, 'n', '내돈내산2', 'y_10_thum.jpg');



--mpdimg(상세이미지) / mpdimg2(상품정보) (상세이미지1,2 /  한중양 * 10개씩 30,30개임 )

select * from mpdimg;
	--한식
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_1_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_2_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_3_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_4_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_5_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_6_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_7_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_8_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_9_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'h_10_in1.jpg');

	--중식
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_1_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_2_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_3_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_4_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_5_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_6_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_7_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_8_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_9_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'j_10_in1.jpg');

	--양식
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_1_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_2_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_3_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_4_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_5_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_6_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_7_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_8_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_9_in1.jpg');
insert into mpdimg(pseq, image) values (mpdimg_seq.nextval, 'y_10_in1.jpg');


select * from mpdimg2;
	--한식
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_1_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_2_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_3_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_4_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_5_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_6_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_7_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_8_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_9_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'h_10_in2.jpg');


	--중식
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_1_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_2_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_3_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_4_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_5_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_6_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_7_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_8_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_9_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'j_10_in2.jpg');


	--양식
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_1_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_2_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_3_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_4_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_5_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_6_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_7_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_8_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_9_in2.jpg');
insert into mpdimg2(pseq, image) values (mpdimg2_seq.nextval, 'y_10_in2.jpg');


-- 주문 추가
insert into morders (oseq, id) 
values(morders_seq.nextVal, 'somi');
insert into morders (oseq, id) 
values(morders_seq.nextVal, 'somi');
insert into morders (oseq, id) 
values(morders_seq.nextVal, 'somi');
insert into morders (oseq, id) 
values(morders_seq.nextVal, 'somi');

insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 1, 1, 1, '1');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 2, 1, 1, '2');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 3, 2, 3, '3');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 3, 1, 2, '4');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 4, 2, 1, '1');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 4, 3, 2, '2');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 4, 6, 3, '3');
insert into morder_detail(odseq, oseq, pseq, quantity,result ) 
values(morder_detail_seq.nextVal, 4, 2, 2, '4');


-- 상품리뷰/후기
insert into mreview(rseq, pseq, content, id) values(mreview_seq.nextVal, 1, '정말 맛있어요', 'somi');


-- 구독정보 추가
insert into subscribeinfo(siseq, id, okyn ) 
values(subscribeInfo_seq.nextVal, 'somi', 'y');
insert into subscribeinfo(siseq, id, okyn ) 
values(subscribeInfo_seq.nextVal, 'kim', 'y');


-- 상품 문의 데이터 
insert into ask(aseq, title, content, id, pseq) 
	values(ask_seq.nextVal, '제품 문의 드립니다', '오늘 구매하면 언제오나여', 'somi', 1);
insert into ask(aseq, title, content, id, pseq) 
	values(ask_seq.nextVal, '제품 문의 드립니다2', '오늘 구매하면 언제오나여2', 'somi', 2);
	

-- 문의 답변 데이터 
insert into ask_reply(arseq, aseq, content ) 
	values(ask_reply_seq.nextVal, 2, '답변드립니다 테스트입니다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ');

update ask_reply set content='추천 받으신 제품이시군요 맛나게 드세요' , arseq=1 where aseq=2;
	
	
	
	-- 질문 데이터
insert into mqna(qseq, subject, content, id) 
values(mqna_seq.nextVal, '협박 편지', '음식이 너무 맛있는데 비결 공개하세요👊👊👊', 'somi');
insert into mqna(qseq, subject, content, id) 
values(mqna_seq.nextVal, '협박 편지2', '음식이 너무 맛있는데 비결 공개하세요👊👊👊2', 'kim');
insert into mqna(qseq, subject, content, id) 
values(mqna_seq.nextVal, '안녕하세요 kbs 한신강이 기자입니다.', '최근 sns에서 화제인 밀조에 대해 취재 요청차 메시지 남깁니다. \n 음식이 너무 맛있는데 비결 공개하세요👊👊👊!', 'somi');
insert into mqna(qseq, subject, content, id) 
values(mqna_seq.nextVal, '일식에 관련하여', '일식은 추가할 생각 없으세요? 답변 부탁 드립니다.', 'kim');


	-- 답변 데이터 rep=1 -> 답변x / rep=2 -> 답변함
update mqna 
set reply='안녕하세요. 밀조 대표 밀조왕입니다. 저는 고객님의 질문을 읽고 신변의 위협을 느꼈습니다. 무섭네요. 경찰에 신고할거예요.', rep=2 
where qseq=1;

update mqna 
set reply='안녕하세요. 밀조 대표 밀조왕입니다. 저는 고객님의 질문을 읽고 신변의 위협을 느꼈습니다. 무섭네요. 경찰에 신고할거예요.', rep=2  
where qseq=2;


-- 공지 데이터 추가
insert into notice(nseq, subject, content, image1) 
values(notice_seq.nextVal, '공지게시글 테스트입니다.', 
 '이것은 공지 게시글 테스트입니다. 길이를 무진장 길게 써야 나중에 화면에서 어떻게 보여질지 모르기 때문에 뭐라도 써보려고 하는데 뭐라 써야할지 생각할 시간에 그 생각을 쓰는 방법을 사용하여 작성하는 중이니까 이것을 보는 사람은 이해를 해주길 바라는 마음으로 이 글을 마칩니다. 이상 이건희 올림.', 
 'banner2.jpg');
 
 
-- 이벤트 데이터 추가
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2021-12-25','yyyy-MM-dd hh24:mi:ss'), to_date('2022-01-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모2', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2021-12-25','yyyy-MM-dd hh24:mi:ss'), to_date('2022-03-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모3', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2020-12-25','yyyy-MM-dd hh24:mi:ss'), to_date('2021-03-01 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모4', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2021-12-25','yyyy-MM-dd hh24:mi:ss'), to_date('2022-04-30 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모5', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2021-12-25','yyyy-MM-dd hh24:mi:ss'), to_date('2022-01-25 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모6', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2022-03-25','yyyy-MM-dd hh24:mi:ss'), to_date('2023-01-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모6', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2022-02-25','yyyy-MM-dd hh24:mi:ss'), to_date('2023-03-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));
insert into mevent(eseq, title, content, image1, image2, subtitle, startdate, enddate) 
values(mevent_seq.nextVal, '박막례 할머니의 이모저모6', '박막례시피 출시', 'event1.jpg','event1_inner1.jpg','막례 할머니와 함께!', to_date('2022-01-25','yyyy-MM-dd hh24:mi:ss'), to_date('2023-05-31 23:59:59','yyyy-MM-dd hh24:mi:ss'));





