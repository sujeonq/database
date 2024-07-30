#날짜 : 2024/07/12
#이름 : 박수정
#내용 : SQL 연습문제5

#실습 5-1.
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on BookStore.* to 'bookstore'@'%';
flush privileges;

#실습 5-2.
CREATE TABLE Customer (
    custId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    address VARCHAR(20) DEFAULT 'NULL',
    phone VARCHAR(13) DEFAULT 'NULL'
);

CREATE TABLE Book (
    bookId INT PRIMARY KEY,
    bookName VARCHAR(20) NOT NULL,
    publisher VARCHAR(20) NOT NULL,
    price INT DEFAULT null
);

CREATE TABLE `Order` (
    orderId INT AUTO_INCREMENT primary key,
    custId INT NOT NULL,
    bookId INT NOT NULL,
    salePrice INT NOT NULL,
    orderDate DATE NOT NULL
);

#실습 5-3.
-- 고객 테이블(Customer) 데이터 삽입
INSERT INTO Customer (custId, name, address, phone) VALUES 
(1, '박지성', '영국 맨체스타', '000-5000-0001'),
(2, '김연아', '대한민국 서울', '000-6000-0001'),
(3, '장미란', '대한민국 강원도', '000-7000-0001'),
(4, '추신수', '미국 클리블랜드', '000-8000-0001'),
(5, '박세리', '대한민국 대전', NULL);

-- 책 테이블(Book) 데이터 삽입
INSERT INTO book (bookId, bookName, publisher, price) VALUES 
(1, '축구의 역사', '굿스포츠', 7000),
(2, '축구아는 여자', '나무수', 13000),
(3, '축구의 이해', '대한미디어', 22000),
(4, '골프 바이블', '대한미디어', 35000),
(5, '피겨 교본', '굿스포츠', 8000),
(6, '역도 단계별기술', '굿스포츠', 6000),
(7, '야구의 추억', '이상미디어', 20000),
(8, '야구를 부탁해', '이상미디어', 13000),
(9, '올림픽 이야기', '삼성당', 7500),
(10, 'Olympic Champions', 'Pearson', 13000);

-- 주문 테이블(Order) 데이터 삽입
INSERT INTO `Order` (custId, bookId, salePrice, orderDate) VALUES 
(1, 1, 6000, '2014-07-01'),
(1, 3, 21000, '2014-07-03'),
(2, 5, 8000, '2014-07-03'),
(3, 6, 6000, '2014-07-04'),
(4, 7, 20000, '2014-07-05'),
(1, 2, 12000, '2014-07-07'),
(4, 8, 13000, '2014-07-07'),
(3, 10, 12000, '2014-07-08'),
(2, 10, 7000, '2014-07-09'),
(3, 8, 13000, '2014-07-10');

#실습 5-4.
select custid, name, address from `Customer`;

#실습 5-5.
select bookname, price from `book`;

#실습 5-6.
select price, bookname from `book`;

#실습 5-7.
select * from book;

#실습 5-8.
select publisher from book;

#실습 5-9.
select distinct publisher from book;
#select publisher from book group by publisher;

#실습 5-10.
select * from book where price >= 20000;

#실습 5-11.
select * from book where price < 20000;

#실습 5-12.
select * from book where 10000<= price and price <= 20000;

#실습 5-13.
select bookid, bookname, price from book
where 15000 <= price and price <= 30000;

#실습 5-14. >>> 조건들에 해당하는 데이터를 조회할때 "in (조건,조건,조건)"
select * from book
where bookid in (2,3,5);

#실습 5-15.
select * from book
where bookid % 2 = 0;

#실습 5-16.
select * from customer
where name like '박%';

#실습 5-17.
select * from customer
where address like '%대한민국%';

#실습 5-18.
select * from customer
where phone is not null;

#실습 5-19. >>> 조건들에 해당하는 데이터를 조회할때 "in (조건,조건,조건)"
select * from book
where publisher in ('굿스포츠','대한미디어');

#실습 5-20.
select publisher from book
where bookname like '축구의 역사';

#실습 5-21.
select publisher from book
where bookname like '%축구%';

#실습 5-22.
select * from book
where bookname like '_구%';
#where substring(bookname, 2, 1) = '구';

#실습 5-23.
select * from book
where bookname like '%축구%' and price >= 20000;

#실습 5-24.
select * from book
order by bookname asc;

#실습 5-25.
select * from book
order by price, bookname;

#실습 5-26.
select * from book
order by price desc, publisher asc;

#실습 5-27.
select * from book
order by price desc 
limit 3;

#실습 5-28.
select * from book
order by price asc
limit 3;

#실습 5-29.
select sum(salePrice) as `총판매액` from `Order`;

#실습 5-30.
select 
sum(salePrice) as `총판매액`,
avg(salePrice) as `평균값`,
min(salePrice) as `최저가`,
max(salePrice) as `최고가`
from `Order`;

#실습 5-31.
select count(*) as `판매건수` from `Order`;

## 실습 5-32. >>> replace(위치,기존데이터,변경데이터) 사용
select bookid, replace(`bookname`, '야구', '농구') as bookname, publisher, price
from book;

## 실습 5-33. >>> 다시 풀어보기 난이도 ★★★
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select custid, count(*) as `수량`
from `Order`
where saleprice>= 8000
group by custid
having `수량` >= 2;

#실습 5-34.
select * from customer as a
join `Order` as b
using (custid);

#실습 5-35.
select * from customer as a
join `Order` as b
using (custid)
order by custid;

#실습 5-36.
select name, saleprice from customer as a
join `Order` as b using(custid);

#실습 5-37.
select name, sum(saleprice) from customer as a
join `Order` as b using(custid)
group by name 
order by name;

#실습 5-38.
select name, bookname from customer as a
join `Order` as b using(custid)
join book as c using(bookid);

#실습 5-39.
select name, bookname from customer as a
join `Order` as b using(custid)
join book as c using(bookid)
where price = 20000;

## 실습 5-40. >> 도서를 구매하지 않은 고객 포함은 Left join 다시 풀어보기★★
select name,saleprice from customer as a
left join `Order` as b 
using(custid);

#실습 5-41. 
select sum(saleprice) as `총매출` from customer as a
join `Order` as b using(custid)
where name = '김연아';

#실습 5-42.
select bookname from book
order by price desc limit 1;

#실습 5-43. >> 다시 풀어보기
select name from customer as a
left join `Order` as b using(custid)
where orderid is null;

#실습 5-44. >> 중간에 정보를 추가할때 insert into..values 사용
insert into `book` (bookid, bookname, publisher, price) values (11,'스포츠 의학', '한솔의학서적', null);

## 실습 5-45. >> update..set
update customer set address = '대한민국 부산' 
where custid=5;

## 실습 5-46. >> 해당 데이터만 삭제할때는 delete from ~ 
delete from customer
where custid = 5;
select * from customer

