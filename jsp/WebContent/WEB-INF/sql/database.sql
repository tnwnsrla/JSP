select * from member;

create table member (
	name varchar(10),
	userid varchar(10),
    pwd varchar(10),
    email varchar(20),
    phone varchar(13),
    grade integer(1) default 0, -- 0: 사용자, 1:관리자
    primary key(userid));
    
    -- 테이블 정보를 보는 방법
    desc member;
    
    insert into member values('이소미', 'somi', '1234', 'gmd@naver.com', '010-2362-5157', 0);
    insert into member values('하상오', 'sang12', '1234', 'ha12@naver.com', '010-5629-8888', 1);
    insert into member values('김윤승', 'light', '1234', 'youn1004@naver.com', '010-9999-8282', 0);
    
    -- 데이터 검색
    select * from member;