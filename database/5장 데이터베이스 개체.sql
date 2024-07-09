# 날짜 : 2024/07/05
# 이름 : 박수정
# 내용 : 5장 데이터베이스 개체

# 실습 5-1
show index from `user1`;
show index from `user2`;
show index from `user3`;

# 실습 5-2
create index `idx_user1_uid` on `user1` (`uid`);
analyze table `user1`;
select * from `user5`;
insert into `user5` (`name`,`gender`,`age`,`addr`) select `name`,`gender`,`age`,`addr` from `user5`;

update `user5` set `name`='홍길동' where `seq`=3;
update `user5` set `name`='정약용' where `seq`=1500000;

drop table `user5`;

select count(*) from `user5`;
select * from `user5` where `seq`='21000';
select * from `user5` where `name`='정약용';

create index `idx_user5_name` on `user5` (`name`);
analyze table `user5`;

delete from `user5` where `seq` > 5;

#실습 5-4
drop view `vw_user1`; 
create view `vw_user1` as (select `name`, `hp`, `age` from `user1`);
create view `vw_user4_age_under30` as (select * from `user4` where `age` <30);
create view `vm_member_with_sales` as (
	select
		a.`uid`		as	`직원아이디`,
        b.`name`	as	`직원이름`,
        b.`pos`		as 	`직급`,
        c.`name`	as	`부서명`,
        a.`year`	as	`매출년도`,
        a.`month`	as	`월`,
		a.`sale`	as	`매출액`
	from `sales`	as a
    join	`member` as b on a.uid = b.uid
    join	`department` as c on b.dep = c.depNo
    );
        

#실습 5-5
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vm_member_with_sales`;

#실습 5-6
#실습 5-7
delimiter $$
	create procedure proc_test1()
    begin
		select * from `member`;
        select * from `department`;
	end $$
delimiter ;

call proc_test1();

#실습 5-8
DELIMITER $$
	CREATE PROCEDURE PROC_TEST2(IN _USERNAME VARCHAR(10))
    BEGIN
		SELECT * FROM `MEMBER` WHERE `NAME`=_USERNAME;
	END $$
DELIMITER ;

call proc_test2('김유신');

delimiter $$
	create procedure proc_test3(in _pos varchar(10), in _dep TINYINT)
    begin
		select * from `member` where `pos` = _pos and `dep`=_dep;
	end $$
    delimiter ;
    
    call proc_test3('차장',101);
    
delimiter $$
	create procedure proc_test4(in _pos varchar(10), out _count int)
    begin
		select count(*) into _count from `member` where `pos` =_pos;
	end $$
    delimiter ;
    
    call proc_test4('대리', @_count);
    select concat('_count : ', @_count)
    
    
#실습 5-9. 프로시저 프로그래밍

delimiter $$
	create procedure proc_test5(in _name varchar(10))
    begin
		declare userId varchar(10);
        select `uid` into userId from `member` where `name` = _name;
        select * from `sales` where `uid`=userId;
	end $$
    delimiter ; 
    
call proc_test5('김유신');

delimiter $$
	create procedure proc_test6()
    begin
		declare num1 int;
        declare num2 int;
        
        set num1 = 1;
        set num2 = 2;
        
        if (num1>num2) then
			select 'num1이 num2보다 크다.' as `결과2`;
		
        else 
			select 'num1이 num2보다 작다.' as `결과2`;
		end if;
        end $$
        delimiter ;
	
    call proc_test6 () ;
    
    delimiter $$
		create procedure proc_test7()
        begin
			declare sum int;
            declare num int;
            
            set sum = 0;
            set num = 1;
            
            while (num <=10 ) do
				set sum = sum +num;
                set num = num +1;
			end while;
            
            select sum as '1부터 10까지 합계';
		end $$
        delimiter ;
        
        call proc_test7();


#실습 5-10. 커서를 활용하는 프로시저

delimiter $$
	create procedure proc_test8()
	begin
		#변수 선언
        declare total int default 0;
        declare price int;
        declare end0fRow BOOLEAN default false;
        
        #커서 선언
        declare salesCursor cursor for
			select `sale` from `Sales`;
            
		#커서 열기
        open salesCursor;
        
        cursor_loop : loop
			fetch salesCursor into price;
            
            if end0fRow THEN
				leave cursor_loop;
			end if;
            
            set total = total + price;
        end loop;
        
        select total as '전체 합계';
        
        close salesCursor;
        end $$
        delimiter ;
        
        call proc_test8();
        
        
        #실습 5-11. 저장 함수 생성 및 호출
        DELIMITER $$
			CREATE FUNCTION FUNC_TEST1(_USERID VARCHAR(10)) RETURNS INT
            BEGIN
				DECLARE TOTAL INT;
                
                SELECT SUM(`sale`) INTO TOTAL FROM `sales` WHERE `UID`=_USERID;
                
                RETURN TOTAL;
			END $$
            DELIMITER ;
            
        SET GLOBAL  log_bin_trust_function_creators=ON;    
		SELECT FUNC_TEST1('A101');
        
        

	


