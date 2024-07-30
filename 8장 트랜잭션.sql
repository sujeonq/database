#날짜 : 2024/07/19
#이름 : 박수정
#내용 : 8장 트랜잭션 실습하기

#실습  8-1.
set autocommit = 0;
select @@autocommit;

update `bank_account` set `a_balance` = 100000 
where `a_no` = '101-11-1001';

start transaction; ------ 트랜잭션 시작
select * from `bank_account`;

update `bank_account` set `a_balance` = `a_balance`-10000
where `a_no` = '101-11-1001';

update `bank_account` set `a_balance` = `a_balance`+10000
where `a_no` = '101-11-1212';

commit;
select * from `bank_account`;


#실습 8-2.
START TRANSACTION;

UPDATE `bank_account` SET `a_balance` = `a_balance` - 10000 
WHERE  `a_no` = '101-11-1001';
 
UPDATE `bank_account` SET `a_balance` = `a_balance` + 10000 
WHERE `a_no` = '101-11-1212';

SELECT * FROM `bank_account`;
ROLLBACK;
SELECT * FROM `bank_account`;
