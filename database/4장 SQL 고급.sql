#날짜 : 2024/07/03
#이름 : 박수정
#내용 : 4장 SQL 고급

#실습 4-1
CREATE TABLE `Member`(
	`uid` 	VARCHAR(10) PRIMARY KEY,
    `name` 	VARCHAR(10) NOT NULL,
    `hp`	VARCHAR(13) UNIQUE NOT NULL,
    `pos`	VARCHAR(10) default '사원',
    `dep` 	tinyint,
    `rdate`	DATETIME NOT NULL
    );

CREATE TABLE `Department`(
	`depNo`	TINYINT PRIMARY KEY,
    `name`	VARCHAR(10) not null,
    `tel`	VARCHAR(12) not null
    );
    
CREATE TABLE `Sales`(
	`SEQ` 	INT AUTO_INCREMENT PRIMARY KEY,
    `UID`	VARCHAR(10) NOT NULL,
    `YEAR`	YEAR NOT NULL,
    `MONTH`	TINYINT NOT NULL,
    `SALE`	INT
);
	
SELECT * FROM `MEMBER`;
SELECT * FROM `DEPARTMENT`;
SELECT * FROM `SALES`;



#실습 4-2
INSERT INTO `Member` VALUES('a101','박혁거세','010-1234-1001','부장',101,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a102','김유신','010-1234-1002','차장',101,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a103','김춘추','010-1234-1003','사원',101,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a104','장보고','010-1234-1004','대리',102,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a105','강감찬','010-1234-1005','과장',102,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a106','이성계','010-1234-1006','차장',103,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a107','정철','010-1234-1007','차장',103,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a108','이순신','010-1234-1008','부장',104,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a109','허균','010-1234-1009','부장',104,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a110','정약용','010-1234-1010','사원',105,'2020-11-19 11:39:48');
INSERT INTO `Member` VALUES('a111','박지원','010-1234-1011','사원',105,'2020-11-19 11:39:48');


INSERT INTO `Department` VALUES(101,'영업1부','051-512-1001');
INSERT INTO `Department` VALUES(102,'영업2부','051-512-1002');
INSERT INTO `Department` VALUES(103,'영업3부','051-512-1003');
INSERT INTO `Department` VALUES(104,'영업4부','051-512-1004');
INSERT INTO `Department` VALUES(105,'영업5부','051-512-1005');
INSERT INTO `Department` VALUES(106,'영업지원부','051-512-1006');
INSERT INTO `Department` VALUES(107,'인사부','051-512-1007');


INSERT INTO `Sales`	VALUES(1,'a101','2018','1',98100);
INSERT INTO `Sales`	VALUES(2,'a102','2018','1',136000);
INSERT INTO `Sales`	VALUES(3,'a103','2018','1',80100);
INSERT INTO `Sales`	VALUES(4,'a104','2018','1',78000);
INSERT INTO `Sales`	VALUES(5,'a105','2018','1',93000);

INSERT INTO `Sales`	VALUES(6,'a101','2018','2',23500);
INSERT INTO `Sales`	VALUES(7,'a102','2018','2',126000);
INSERT INTO `Sales`	VALUES(8,'a103','2018','2',18500);
INSERT INTO `Sales`	VALUES(9,'a104','2018','2',19000);
INSERT INTO `Sales`	VALUES(10,'a105','2018','2',53000);

INSERT INTO `Sales`	VALUES(11,'a101','2019','1',24000);
INSERT INTO `Sales`	VALUES(12,'a102','2019','1',109000);
INSERT INTO `Sales`	VALUES(13,'a103','2019','1',101000);
INSERT INTO `Sales`	VALUES(14,'a104','2019','1',53500);
INSERT INTO `Sales`	VALUES(15,'a105','2019','1',24000);

INSERT INTO `Sales`	VALUES(16,'a102','2019','2',160000);
INSERT INTO `Sales`	VALUES(17,'a103','2019','2',101000);
INSERT INTO `Sales`	VALUES(18,'a104','2019','2',43000);
INSERT INTO `Sales`	VALUES(19,'a105','2019','2',24000);
INSERT INTO `Sales`	VALUES(20,'a106','2019','2',109000);

INSERT INTO `Sales`	VALUES(21,'a102','2020','1',201000);
INSERT INTO `Sales`	VALUES(22,'a104','2020','1',63000);
INSERT INTO `Sales`	VALUES(23,'a105','2020','1',74000);
INSERT INTO `Sales`	VALUES(24,'a106','2020','1',122000);
INSERT INTO `Sales`	VALUES(25,'a107','2020','1',111000);

INSERT INTO `Sales`	VALUES(26,'a102','2020','2',120000);
INSERT INTO `Sales`	VALUES(27,'a103','2020','2',93000);
INSERT INTO `Sales`	VALUES(28,'a104','2020','2',84000);
INSERT INTO `Sales`	VALUES(29,'a105','2020','2',180000);
INSERT INTO `Sales`	VALUES(30,'a108','2020','2',76000);

SELECT * FROM `MEMBER`;
SELECT * FROM `SALES`;
SELECT * FROM `DEPARTMENT`;


#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `pos` ='차장' and dep=101;
select * from `Member` where `pos` ='차장' or dep=101;
select * from `Member` where `name` != '김춘추';
select * from `Member` where `name` <> '김춘추';  # <> 제외
select * from `Member` where `pos` = '사원' or `pos` = '대리';
select * from `Member` where `pos` IN ('사원','대리');
select * from `Member` where `dep` IN (101,102,103);
select * from `Member` where `name` LIKE '%신';
select * from `Member` where `name` like '김%';
select * from `Member` where `name` like '김__';
select * from `Member` where `name` like '_성_';
select * from `Member` where `name` like '정_';
select * from `Sales` where `sale` > 50000;
select * from `Sales` where `sale` >= 50000 and `sale` < 100000 and `month` =1;
select * from `Sales` where `sale` between 50000 and 100000;
select * from `Sales` where `sale` not between 50000 and 100000;



#실습 4-4
SELECT * FROM `SALES`;
SELECT * FROM `SALES` ORDER BY `SALE` ASC;
SELECT * FROM `SALES` ORDER BY `SALE` DESC;
SELECT * FROM `SALES`
WHERE `SALE` > 50000
ORDER BY `YEAR`, `MONTH`, `SALE` DESC;


#실습 4-5
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3;
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM `Sales` ORDER BY `sale` desc;
SELECT * FROM `Sales` ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year` DESC, `month`, `sale` DESC
LIMIT 5;



#실습 4-6
select sum(`sale`) as `합계` from `Sales`;
select sum(`sale`) as `통장잔액` from `Sales`;
select count(*) as `갯수` from `sales`; 
select concat('Hello', 'World') as `결과`;
select concat(`uid`,`name`,`hp`) from `member` where `uid`='a108';
select now();
INSERT INTO `Member` VALUES ('A112','유관순','010-1234-1012','대리', 107,NOW());


#실습 4-7. 2018년 1월 매출의 총합을 구하시오.
#나의 풀이
select sum(`sale`) as `총합` from `Sales` 
where `year`='2018' and `month`=1;

#강사님 풀이
select sum(`sale`) as `2018년의 1월 매출 총합` 
from `sales` where `year`='2018' and `month`='1';



#실습 4-8. 2019년 2월에 5만원 이상 매출에 대한 총합과 평균을 구하시오.
#나의 풀이
SELECT SUM(`SALE`) AS `총합`, AVG(`SALE`) AS `평균` FROM `SALES`
WHERE `YEAR`='2019' AND `MONTH`=2 AND `SALE`>=50000;

#강사님 풀이
select
	sum(`sale`) as `총합`,
    avg(`sale`) as `평균`
from `sales`
where
	`year` = 2019 and
	`month` = 2 and
    `sale` >= 50000;



#실습 4-9. 2020년 전체 매출 가운데 최저, 최고 매출을 구하시오.
#나의 풀이
select max(`Sale`) as `최고매출`, min(`sale`) as `최저매출` from `sales`
where `year`='2020';

#강사님 풀이
select
	min(`sale`) as `최저매출`,
    max(`sale`) as `최고매출`
from `Sales`
where `year` = 2020;


#실습 4-10
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from `sales` group by `uid`;
select * from `sales` group by `year`;
select * from `sales` group by `uid`, `year`;
select `uid`, count(*) as `건수` from `sales` group by `uid`;
select `uid`, sum(sale) as `합계` from `sales` group by `uid`;
select `uid`, avg(sale) as `평균` from `sales` group by `uid`;

select `uid`, `year`, sum(SALE) as `합계`
from `sales`
group by `uid`, `year`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale` >= 50000
group by `uid`, `year`
order by `합계` desc;


#실습 4-11
select `uid`, sum(sale) as `합계` from `sales`
group by `uid`
having `합계` >= 200000;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
where `sale` >= 100000
group by `uid`, `YEAR`
having `합계` >= 200000
order by `합계` desc;



#실습 4-12
CREATE TABLE `SALES2` LIKE `SALES`;  #테이블복사
INSERT INTO `SALES2` SELECT * FROM `SALES`; #데이터복사

SET SQL_SAFE_UPDATES=0; #조건 없이 UPDATE 모드 해제
update `SALES2` SET `YEAR` = `YEAR` +3;

select * from `sales` union select * from `sales2`;

select * FROM `SALES` WHERE `SALE` >= 100000
union
select * FROM `SALES2` where `sale` >= 100000;

select `uid`, `year`, `sale` from `sales`
union
select `uid`, `year`, `sale` from `sales2`;

select `uid`, `year`, sum(sale) as `합계`
from `sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(sale) as `합계`
from `sales2`
group by `uid`, `year`
order by `year` asc, `합계` desc;


#실습 4-13
select * from `sales`
inner join `member` on `sales`.uid = `member`.`uid`;

select * from `member`
inner join `department` on `member`.dep = `department` .depNo;

select * from `sales` as a
join `member` as b
on a.uid = b.uid;

select * from `member` as a
join `department` as b
on a.dep = b.depNo;

select * from `sales` as a, `member` as b
where a.uid = b.uid;

select * from `member` as a, `department` as b
where a.dep = b.depno;



select * from `sales` as a
join `member` as b
on a.uid = b.uid;

select * from `sales` as a
join `member` as b
using (`uid`);

select * from `member` as a 
join `department` as b
on a.dep = b.depNo;

SELECT a.`seq`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a
JOIN `Member` AS b ON a.`uid` = b.`uid`;

select
		a. `seq`,
		a. `uid`,
		a. `sale`,
		b. `name`,
		b.	`pos`
from	`sales` as a
join 	`member` as b
using 	(`uid`);



SELECT a.`seq`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid
JOIN `Department` AS c ON b.dep = c.depNo
WHERE `sale` > 100000
ORDER BY `sale` DESC;


#실습 4-14
select * from `sales` as a 
LEFT join `member` as b 
on a.uid= b.uid;

select * from `sales` as a
right join `member` as b
on a.uid = b.uid;

select a.seq, a.uid, `sale`,`name`,`pos` from sales as a
left join `member` as b using(uid);



#실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오
select
	`uid`, a.`name` as '이름', pos, b.`name` as '부서명'
from member as a
join department as b
on a.dep = b.depNo;


#실습 4-16 `김유신` 직원의 2019년도 매출의 합을 조회하시오
select
	sum(`sale`) as '2019 매출합'
from `sales` as a
join `member` as b
on a.uid = b.uid
where name='김유신' and year='2019';
    



#실습 4-17 
#2019년 50,000원이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름,
#부서명, 직급, 년도, 매출의 합을 조회하시오. 단, 매출의 합이 큰 순서부터 정렬하시오.
select 
	b. name as '직원이름',
	c. name as '부서명',
	b. pos as '직급',
	a. year as '년도',
	sum(sale) as '매출합'
from sales a
join member b on a.uid=b.uid
join department c on b.dep = c.depno
where year=2019 and sale>=50000
group by a.uid
having 매출합 >=100000
order by 매출합 desc;

