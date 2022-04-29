# MealZo
spring boot를 이용한 온라인 밀키트 쇼핑몰    
    
        
<br><br>
        

## 0. 목차

[1. 개요](#1-개요)

[2. 기술](#2-기술)

[3. database EER Diagram](#3-database-eer-diagram)

[4. 유즈케이스 다이어그램](#4-유즈케이스-다이어그램)

[5. 추가적인 기능구현](#5-추가적인-기능구현)

<br><br>

## 1. 개요

![image](https://user-images.githubusercontent.com/89569867/165932599-a1c0035d-4ab7-4715-9d65-fd027dfb23c3.jpg)

spring Boot로 구현한 온라인 밀키트 쇼핑몰입니다.    
유저는 회원가입, 로그인이 가능하며   
더불어 원하는 상품을 검색, 장바구니, 찜하기, 구매 등이 가능한 웹페이지 입니다.   

관리자는 회원관리, 상품관리, 상품배송 리뷰관리 등 필수요소를 관리 가능하며,   
추가적으로 공지사항, 이벤트, 배너관리등 웹페이지 관리도 가능합니다.   

   <br><br>

## 2. 기술
![image](https://user-images.githubusercontent.com/89569867/165933271-f1a6d9fd-efa8-40f8-80f7-45062c566797.jpg)
1. Web Front : `HTML5` , `CSS`, `JavaScript`, `jQuery`
2. Web Server :  `Java`, `Spring boot`, `Gradle`, `MyBatis`, 
3. DBMS : `Oracle DB`
4. 개발환경 : `Eclipse`, `Oracle SQL Developer`

   
<br><br>   
   

## 3. database EER Diagram
![image](https://user-images.githubusercontent.com/89569867/165932165-0506efec-d748-47a3-9c57-0e90acc0a497.png)

   
<br><br>   
   

## 4. 유즈케이스 다이어그램
![image](https://user-images.githubusercontent.com/89569867/165933260-deeb9793-0e85-4686-85d2-75d99bcebaec.jpg)



<br><br>
   

## 5. 추가적인 기능구현
### 1. 상품 디테일페이지 기능 다수 구현
<img src="https://user-images.githubusercontent.com/89569867/165934378-78feb0d5-b5ce-4c86-bf48-d9fcc1027743.jpg" width="70%"><br>
1. 상품수량 선택버튼
2. 장바구니에 담기 / 바로구매 (장바구니는 ajax로 구현)
3. 찜하기 기능 구현
4. 구매자에 한하여 리뷰 작성이 가능 (구매 여부 확인 로직 구현)

   
   
   <br><br>

### 2. 주문취소 
<img src="https://user-images.githubusercontent.com/89569867/165934382-c8f5f2a1-98a9-4e3f-b181-1ad01ff155b0.jpg" width="70%"><br>
배송이 시작되면 주문취소가 불가능하도록 로직 구현

   <br><br>

### 3. 공지사항에서 필독게시물기능 추가
<img src="https://user-images.githubusercontent.com/89569867/165934384-88fa2c28-04f0-4eeb-84dc-b93305d5744b.jpg" width="70%"><br>
필독 게시물은 게시판 최상단에 고정된다.    
관리자가 관리자페이지에서 게시물을 필독 게시물로 지정할 수 있다. 

   
   <br><br>
   

### 4. 로그인 요청 후, 시도했던 페이지로 url로 이동
<img src="https://user-images.githubusercontent.com/89569867/165934386-153469d3-aee5-4d96-8fdd-094f4381bf2a.jpg" width="70%"><br>
로그인 되지 않은 상태에서 로그인이 필요한 페이지로 이동 시,   
유저는 로그인 페이지로 redirect하고, 로그인 성공시 앞서 시도했던 페이지로 이동하는 로직 구현.

<br><br>

   

### 5. 헤더 장바구니 버튼에 상품 수량 표시
<img src="https://user-images.githubusercontent.com/89569867/165934388-aff51d11-fb11-4e49-99bb-c7d7f80ba789.jpg" width="70%"><br>
회원이 장바구니에 담은 상품 개수를 모든 페이지에서 확인할 수 있도록   
헤더 장바구니 버튼에 개수를 표시되도록 구현했다.   
(상품 추가, 삭제시 즉시 변화한다)   

   
   <br><br>
   

### 6. 롤링배너 관리 시스템 구현
<img src="https://user-images.githubusercontent.com/89569867/165934391-f36559a4-2f1e-4edd-9c66-df42dff24f15.jpg" width="70%"><br>
관리자는 관리자페이지에서 메인페이지의 롤링배너를 관리할 수 있다.    
배너의 순서, 클릭시 이동하는 url, 배너 이미지 등을 수정, 관리할 수 있다.    

<br><br>

