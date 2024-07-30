#날짜: 2024/07/01
#이름: 박수정
#내용: 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`	VARCHAR(10),
    `hp`	CHAR(13),
    `age`	INT
);

#실습 2-2. 데이터 입력
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';


#실습2-3. 데이터 조회
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid` = 'A101';
SELECT * FROM `User1` WHERE `name` = '김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;

#실습2-4. 데이터 수정
set sql_safe_updates=0;
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid` ='A104';
UPDATE `User1` SET `age` =51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 2-5.
#삭제 할 때 You are using safe update mode~ 뜨면서 아래 쿼리 실행
set sql_safe_updates=0;
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >= 30;

#실습 2-6.
ALTER TABLE `User1` ADD `gender` TINYINT;
ALTER TABLE `User1` ADD `birth` CHAR(10) AFTER `name`;
ALTER TABLE `User1` MODIFY `gender` CHAR(1);
ALTER TABLE `User1` MODIFY `age` TINYINT;
ALTER TABLE `User1` DROP `gender`;

#실습 2-7.
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;

#실습 2-8. 아래와 같이 테이블을 생성 후 데이터를 입력하시오.
CREATE TABLE `TblUser` (
	`user_id` VARCHAR(10),
    `user_name`	VARCHAR(10),
    `user_hp` CHAR(13),
    `user_age` INT,
    `user_addr` VARCHAR(10)
);

INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_age`, `user_addr`) VALUES ('p103','장보고',31,'전남 완도군');
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_addr`) VALUES ('p104','강감찬','서울시 중구');
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_hp`, `user_age`) VALUES ('p105','이순신','010-1234-1005',50);

select * from `TblUser`;


CREATE TABLE `TblProduct`(
	`prod_no` CHAR(10),
	`prod_name` VARCHAR(10),
    `prod_price` VARCHAR(20),
    `prod_stock` VARCHAR(10),
    `prod_company`	VARCHAR(10),
    `prod_date` VARCHAR(20)
    );
    
    drop table `TblProduct`;
    
insert into	`TblProduct` VALUES ('1001','냉장고','800,000','25','LG전자','2022-01-06');
insert into	`TblProduct` VALUES ('1002','노트북','1,200,000','120','삼성전자','2022-01-07');
insert into	`TblProduct` VALUES ('1003','모니터','350,000','35','LG전자','2023-01-13');
insert into	`TblProduct` VALUES ('1004','세탁기','1,000,000','80','삼성전자','2021-01-01');
insert into	`TblProduct` VALUES ('1005','컴퓨터','1,500,000','20','삼성전자','2023-10-01');
INSERT INTO `TblProduct` (`prod_no`, `prod_name`, `prod_price`,`prod_stock`) VALUES ('1006','휴대폰','950,000','102');


select * from `Tblproduct`;
