#날짜 : 2024/07/15
#이름 : 박수정
#내용 : 데이터 모델링 실습하기

#실습 6-1 Shop 모델링
#실습 6-2
insert into `customer` (`custId`, `name`, `hp`, `addr`, `rdate`) values 
('c101','김유신','010-1234-1001','경남 김해시','2023-01-01'),
('c102','김춘추','010-1234-1002','경남 경주시','2023-01-01'),
('c103','장보고','010-1234-1003','전남 완도군','2023-01-01'), 
('c104','강감찬','010-1234-1004','서울시 관악구','2023-01-01'), 
('c105','이순신','010-1234-1005','부산시 금정구','2023-01-01'); 

insert into `product` (`prodNo`,`prodName`,`stock`,`price`,`company`) values
(1, '새우깡', 5000,1500, '농심'),
(2, '초코파이', 2500,2500, '오리온'),
(3, '포카칩', 3600,1700, '오리온'),
(4, '양파링', 1250,1800, '농심'),
(5, '죠리퐁', 2200,null, '크라운');

insert into `order` (`orderNo`,`orderId`,`orderProduct`,`orderCount`,`orderDate`) values
(1, 'c102',3,2,'2023-01-01 13:15:10'),
(2, 'c101',4,1,'2023-01-01 13:15:12'),
(3, 'c102',1,1,'2023-01-01 13:15:14'),
(5, 'c105',2,1,'2023-01-01 13:15:18');

#실습 6-3.
select 
	o.`orderNo` as `주문번호`,
    c.`name` as `고객명`,
    p.`prodName` as `상품명`,
    o.`orderCount` as `주문수량`,
    o.`orderDate` as `주문일`
from `Order` o
join customer c
	on o.`orderid`=c.`custid`
join product p
	on o.`orderproduct` = p.`prodNo`;
    
select 
	o.`orderNo` as `주문번호`,
    p.`prodNo` as `상품번호`,
    p.`prodName` as `상품명`,
    p.`price` as `가격`,
    o.`orderCount` as `주문수량`,
    o.`orderDate` as `주문일`
from `Order` o
join customer c
	on o.`orderid`=c.`custid`
join product p
	on o.`orderproduct` = p.`prodNo`
where c.name = '김유신';

select sum(price) * sum(orderCount) as `총 주문 금액`
from `Order` o
join product p
	on o.`orderproduct` = p.`prodNo`;
    
#실습 6-4
-- BankERD 모델링 실습

# 실습 6-5
insert into `bank_customer` values ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
insert into `bank_customer` values ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
insert into `bank_customer` values ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
insert into `bank_customer` values ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
insert into `bank_customer` values ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');

insert into `bank_account` values ('101-11-1001', 'S1', '자유저축예금', '730423-1000001', 1550000, '2011-04-11');
insert into `bank_account` values ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', 260000, '2011-05-12');
insert into `bank_account` values ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', 75000, '2011-06-13');
insert into `bank_account` values ('101-12-1001', 'S2', '기업저축예금', '102-12-51094', 15000000, '2011-07-14');
insert into `bank_account` values ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', 1200000, '2011-08-15');

insert into `bank_transaction` set `t_a_no`='101-11-1001', `t__dist`=1, `t_amount`=50000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-12-1001', `t__dist`=2, `t_amount`=1000000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t__dist`=3, `t_amount`=260000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1002', `t__dist`=2, `t_amount`=100000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1003', `t__dist`=3, `t_amount`=750000, `t_datetime`=NOW();
insert into `bank_transaction` set `t_a_no`='101-11-1001', `t__dist`=1, `t_amount`=150000, `t_datetime`=NOW();


# 실습 6-6
select 
	`c_no`,
	`c_name`,
	`c_phone`,
    `a_no`,
    `a_item_name`,
    `a_balance`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no;

select 
	`t__dist`,
    `t_amount`,
    `t_datetime`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no
join `bank_transaction` as c on b.a_no = c.t_a_no
where `c_name` = '이순신';

select 
	`c_no`,
    `c_name`,
    `a_no`,
    `a_balance`,
    `a_open_date`
from `bank_customer` as a 
join `bank_account` as b on a.c_no = b.a_c_no
where `c_dist`=1
order by `a_balance` desc
limit 1;

# 실습 6-7
-- CollegeERD 모델링 실습

# 실습 6-8
insert into `Student` values ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
insert into `Student` values ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
insert into `Student` values ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
insert into `Student` values ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
insert into `Student` values ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

insert into `Lecture` values (101, '컴퓨터과학 개론', 2, 40, '본301');
insert into `Lecture` values (102, '프로그래밍 언어', 3, 52, '본302');
insert into `Lecture` values (103, '데이터베이스', 3, 56, '본303');
insert into `Lecture` values (104, '자료구조', 3, 60, '본304');
insert into `Lecture` values (105, '운영체제', 3, 52, '본305');

insert into `Register` values ('20220415', 101, 60, 30, null, null);
insert into `Register` values ('20210324', 103, 54, 36, null, null);
insert into `Register` values ('20201011', 105, 52, 28, null, null);
insert into `Register` values ('20220415', 102, 38, 40, null, null);
insert into `Register` values ('20210324', 104, 56, 32, null, null);
insert into `Register` values ('20210213', 103, 48, 40, null, null);

# 실습 6-9
select 
	`stdNo`,
    `stdName`,
    `stdHp`,
    `stdYear`
from `Student` as a
left join `Register` as b on a.stdNo = b.regStdNo
where `regStdNo` is null; 

select 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;

select 
	`stdNo`,
    `stdName`,
    `stdYear`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
from `Student` as a
join `Register` as b on a.stdNo = b.regStdNo
join `Lecture` as c on b.regLecNo = c.lecNo
where `stdYear` = 2;