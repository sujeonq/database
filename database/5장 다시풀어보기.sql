#실습 5-1. 인덱스 조회
show index from `user1`;
show index from `user2`;
show index from `user3`;

#실습 5-2. 인덱스 생성 및 적용
create index `idx_user1_uid` on `user1`(`uid`);
analyze table `user1`;

#실습 5-3. 인덱스 삭제
drop index `idx_user1_uid` on `user1`;

#실습 5-4. 뷰 생성
create view `vw_user1` as (select `name`,`hp`,`age` from `user1`);
create view `vw_user4_age_under30` as (select * from `user4` where `age` <30);
create view `vm_member_with_sales` as (
	select
		a.`uid`	as `직원아이디`,
        b.`uid`	as `직원이름`,
        b.`pos` as `직급`,
        c.`name` as `부서명`,
        a.`year` as `매출년도`,
        a. `month` as `월`,
        a. `sale` as `매출액`
	from `sales` as a
    join `member` as b 
		on a.`uid`=b.`uid`
	join `department` as c
		on b.`dep`=c.`depNo`
	);
    
#실습 5-5. 뷰 조회
select * from `vw_user1`;
select * from `vw_user4_age_under30`;

#실습 5-6. 뷰 삭제
drop view `vw_user1`;
drop view `vw_user4_age_under30`;

#실습 5-7. 프로시저 생성 및 실행기본
delimiter $$
	create procedure proc_test5(in _name varchar(10))
    begin
		declare userid varchar(10);
        select `uid` into userid from `member` where `name` = _name;
        select * from `sales` where `uid`=userid;
	end $$
delimiter ;


