insert into `Users` values('user1','김유신','1976-01-21','M','010-1101-1976','kimys@naver.com',0,1,'서울','2022-01-10 10:50:12');
insert into `Users` values('user2','계백','1975-06-11','M','010-1102-1975',null,1000,1,'서울','2022-01-10 10:50:12');
insert into `Users` values('user3','김춘추','1989-05-30','M','010-1103-1989',null,1200,2,'서울','2022-01-10 10:50:12');
insert into `Users` values('user4','이사부','1979-04-13','M','010-2101-1979','leesabu@gmail.com',2600,1,'서울','2022-01-10 10:50:12');
insert into `Users` values('user5','장보고','1966-09-12','M','010-2104-1966','jangbg@naver.com',9400,4,'대전','2022-01-10 10:50:12');
insert into `Users` values('user6','선덕여왕','1979-04-13','M','010-3101-1979','gueen@naver.com',1600,2,'대전','2022-01-10 10:50:12');
insert into `Users` values('user7','강감찬','1984-06-15','F','010-4101-1984','kang@daum.net',800,0,'대구','2022-01-10 10:50:12');
insert into `Users` values('user8','신사임당','1965-10-21','M','010-5101-1965','sinsa@gmail.com',1500,1,'대구','2022-01-10 10:50:12');
insert into `Users` values('user9','이이','1972-11-28','F','010-6101-1972','leelee@nate.com',3400,3,'부산','2022-01-10 10:50:12');
insert into `Users` values('user10','허난설현','1992-09-07','F','010-7103-1992',null,4100,3,'광주','2022-01-10 10:50:12');

insert into `Points` values(1,'user1', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into `Points` values(2,'user1', 6000, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into `Points` values(3,'user3', 2835, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into `Points` values(4,'user7', 3610, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into `Points` values(5,'user5', 3000, '이벤트 응모 3000 적립','2022-01-10 10:50:12');
insert into `Points` values(6,'user2', 1000, '회원가입 1000 적립', '2022-01-10 10:50:12');
insert into `Points` values(7,'user2', 2000, '이벤트 응모 2000 적립', '2022-01-10 10:50:12');
insert into `Points` values(8,'user2', 2615, '상품구매 5% 적립', '2022-01-10 10:50:12');
insert into `Points` values(9,'user3', 1500, '이벤트 응모 1500 적립', '2022-01-10 10:50:12');
insert into `Points` values(10,'user6', 15840, '상품구매 2% 적립', '2022-01-10 10:50:12');

insert into `Sellers`
values  (10001, '(주)다팔아', '02-201-1976', '정우성', '서울'),
		(10002, '판매의민족', '02-102-1975', '이정재', '서울'),
		(10003, '멋남', '031-103-1989', '원빈', '경기'),
		(10004, '스타일살아', '032-201-1979', '이나영', '경기'),
		(10005, '(주)삼성전자', '02-214-1966', '장동건', '서울'),
		(10006, '복실이옷짱', '051-301-1979', '고소영', '부산'),
		(10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구'),
		(10008, '(주)LG전자', '02-511-1965','강호동', '서울'),
		(10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산'),
		(10010, '누리푸드', '051-710-1992', '강동원', '부산');
        
insert into `Categories`
values (10, '여성의류패션'),
	   (11, '남성의류패션'),
	   (12, '식품·생필품'),
	   (13, '취미·반려견'),
	   (14, '홈·문구'),
	   (16, '스포츠·건강'),
	   (17, '컴퓨터·가전·디지털'),
	   (18, '여행'),
	   (19, '도서');
       
insert into `Products`
 values (100101, 11, 10003, '반팔티 L~2XL', 869, 25000, 132, 20),
		(100110, 10, 10004, '트레이닝 통바지', 1602, 38000, 398, 15),
		(110101, 10, 10003, '신상 여성운동화', 160, 76000, 40, 5),
		(120101, 12, 10010, '암소 1등급 구이셋트 1.2kg', null, 150000, 87, 15),
		(120103, 12, 10010, '바로구이 부채살 250g', null, 21000, 61, 10),
		(130101, 13, 10006, '[ANF] 식스프리 강아지 사료', 58, 56000, 142, 0),
		(130112, 13, 10006, '중대형 사계절 강아지옷', 120, 15000, 80, 0),
		(141001, 14, 10001, '라떼 2인 소파/방수 패브릭', null, 320000, 42, 0),
		(170115, 17, 10007, '지포스 3080 그래픽카드', 28, 900000, 12, 12),
		(160103, 16, 10009, '치닝디핑 33BR 철봉', 32, 120000, 28, 0);
        
insert into `Orders` values('22010210001', 'user2', 52300, '서울시 마포구 121', 1, '2022-01-10 10:50:12');
insert into `Orders` values('22010210002', 'user3', 56700, '서울시 강남구 21-1', 1, '2022-01-10 10:50:12');
insert into `Orders` values('22010210010', 'user4', 72200, '서울시 강서구 큰대로 38', 2, '2022-01-10 10:50:12');
insert into `Orders` values('22010310001', 'user5', 127000, '경기도 광주시 초월로 21', 1, '2022-01-10 10:50:12');
insert into `Orders` values('22010310100', 'user1', 120000, '경기도 수원시 120번지', 0, '2022-01-10 10:50:12');
insert into `Orders` values('22010410101', 'user6', 792000, '부산시 남구 21-1', 2, '2022-01-10 10:50:12');
insert into `Orders` values('22010510021', 'user7', 92200 ,'부산시 부산진구 56 10층' ,4 ,'2022-01-10 10:50:12');
insert into `Orders` values('22010510027', 'user8', 112000, '대구시 팔달로 19' ,3 ,'2022-01-10 10:50:12');
insert into `Orders` values('22010510031', 'user10', 792000, '대전시 한밭로 24-1', 2, '2022-01-10 10:50:12');
insert into `Orders` values('22010710110', 'user9', 94500, '광주시 충열로 11', 1, '2022-01-10 10:50:12');

insert into `OrderItems` (orderNo, prodNo, itemPrice, itemDiscount, itemCount)
values (22010210001, 100110, 38000, 15, 1),
	   (22010210001, 100101, 25000, 20, 1),
	   (22010210002, 120103, 21000, 10, 3),
	   (22010310001, 130112, 15000, 0, 1),
	   (22010310001, 130101, 56000, 0, 2),
	   (22010210010, 110101, 76000, 5, 1),
	   (22010310100, 160103, 120000, 0, 1),
	   (22010410101, 170115, 900000, 12, 1),
	   (22010510021, 110101, 76000, 5, 1),
	   (22010510027, 130101, 56000, 0, 2),
	   (22010510021, 100101, 25000, 20, 1),
	   (22010510031, 170115, 900000, 12, 1),
	   (22010710110, 120103, 21000, 10, 5);
       
insert into `Carts` values(1, 'user1', 100101, 1, '2022-01-10 10:50:12');
insert into `Carts` values(2, 'user1', 100110, 2, '2022-01-10 10:50:12');
insert into `Carts` values(3, 'user3', 120103, 1, '2022-01-10 10:50:12');
insert into `Carts` values(4, 'user4', 130112, 1, '2022-01-10 10:50:12');
insert into `Carts` values(5, 'user5', 130101, 1, '2022-01-10 10:50:12');
insert into `Carts` values(6, 'user2', 110101, 3, '2022-01-10 10:50:12');
insert into `Carts` values(7, 'user2', 160103, 1, '2022-01-10 10:50:12');
insert into `Carts` values(8, 'user2', 170115, 1, '2022-01-10 10:50:12');
insert into `Carts` values(9, 'user3', 110101, 1, '2022-01-10 10:50:12');
insert into `Carts` values(10, 'user6', 130101, 1, '2022-01-10 10:50:12');

#문제1. 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. 단 상품수량 2건이상만 조회 할 것
select userId, prodName, cartProdCount from Carts
join users using(userId)
join products using(prodNo)
where cartProdCount >=2;

#문제2. 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오.
select prodNo, cateName, prodName, prodPrice, sellerManager, sellerPhone from products
join sellers using(sellerNo)
join Categories using(cateno);

#문제3. 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오. 단 적립포인트 내역이 없으면 0으로 출력
select userid, userName, userHp, userPoint, if(sum(point) is null, 0, sum(point)) as `적립포인트` from users
left join points using (userid)
group by userid;

#문제4. 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오. 단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될것
select orderNo, userId, userName, orderTotalPrice, orderDate from orders
join users using(userid)
where orderTotalPrice >= 100000
order by orderTotalPrice desc, userName;

#문제5. 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 주문번호는 중복 없이 상품명은 구분자 ,로 나열할것
select orderNo, userId, userName, group_concat(prodname separator ','), orderDate from orders
join users using(userid)
join orderItems o using(orderNo)
join Products p on  o.prodno=p.prodno
group by orderno;

#문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오.
#floor(prodPrice * (1 - prodDiscount / 100)) as 할인가:
#제품 가격(prodPrice)에 할인율(prodDiscount)을 적용하여 할인된 가격을 계산합니다.
#floor 함수는 소수점을 버리고 내림값을 반환합니다. 이 결과를 할인가라는 별칭으로 표시합니다.
select *, floor(`prodPrice` * (1 - `prodDiscount` / 100)) as `할인가`
from `products`;


#문제7. 고소영이 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오. 
select prodNo, prodName, prodPrice, prodStock, sellerManager from products
join sellers using(sellerNo)
where sellerManager = '고소영';

#문제8. 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자 이름, 판매자 연락처를 조회하시오. 
select sellerNo, sellerBizname, sellerManager, sellerPhone from sellers s
left join products p using(sellerNo)
where p.sellerNo is null;

#문제9. 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 가격을 구하고 그 가격으로 주문별 총합을 구해서 주문별 총합이 10만원이상 그리고 큰 금액 순으로 `주문번호`, `최종총합`을 조회하시오. 
select `orderNo`, SUM(`할인가`) as `최종총합` 
from ( select *, floor(`itemPrice` * (1 - `itemDiscount` / 100)) as `할인가` from `orderitems`) as a
group by `orderNo`
having `최종총합` >= 100000
order by `최종총합` desc;

#문제10. 장보고 고객이 주문했던 모든 상품명을 `고객명`, `상품명`으로 조회하시오. 단 상품명은 중복 안됨, 상품명은 구분자 , 로 나열
SELECT `userName` as `고객명`, GROUP_CONCAT(`prodName` SEPARATOR ',') as `상품명` FROM `Orders` o
JOIN `Users` u using(userId)
JOIN `OrderItems` i using(orderNo)
JOIN `Products` p ON p.prodNo=i.prodNo
WHERE `userName` = '장보고';