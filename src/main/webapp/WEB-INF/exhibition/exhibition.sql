show tables;

create table exhibition (
	idx int not null auto_increment primary key,
	title varchar(100) not null,
	author varchar(100) not null,
	startDate datetime  default now(),
	endDate datetime  default now(),
	adultPrice int default 0,
	childPrice int default 0,
	place varchar(100),
	poster varchar(100),
	content text,
	part char(5) default 'open',
	reCnt int default 0
);

alter table exhibition add reCnt int default 0;

desc exhibition;
drop table exhibition;
select * from exhibition;


insert into exhibition values (default, '알폰스 무하 전시전', '알폰스 무하',default,default,15000,8000,'그라운드소소 청주','1','알폰스 무하 전시전 입니다.',default);
insert into exhibition values (default, '요시고 전시전', '요시고',default,default,15000,8000,'그라운드소소 청주','2','요시고 전시전 입니다.',default);
insert into exhibition values (default, '에드가 드가 전시전', '에드가 드가',default,default,15000,8000,'그라운드소소 청주','3','에드가 드가 전시전 입니다.',default);
insert into exhibition values (default, '모네 전시전', '모네 전시전',default,default,15000,8000,'그라운드소소 청주','4','모네 전시전 입니다.',default);
insert into exhibition values (default, '렘브란트 전시전', '렘브란트',default,default,15000,8000,'그라운드소소 청주','5','렘브란트 전시전 입니다.',default);


create table member (
  idx      int not null auto_increment, 	/* 회원 고유번호 */
  mid      varchar(20) not null,					/* 회원 아이디(중복불허) */
  name     varchar(20) not null,					/* 회원 성명 */
  nickName     varchar(20) not null,					/* 회원 닉네임 */
  salt	    char(8) not null,						/* 비밀번호 보안을위한 해시키 */
  pwd      varchar(100) not null,					/* 회원 비밀번호(SHA256 암호화 처리) */
  email    varchar(50) not null,					/* 이메일(아이디/비밀번호 분실시에 사용)-형식체크필수 */
  tel			 varchar(15),										/* 전화번호(010-1234-5678) */
  point			int default 500,							/* 회원 누적포인트(가입포인트500증정, 1회방문시 10포인트증가, 1일 최대 50점까지 증가 */
  visitCnt  int default 0,							/* 총 방문횟수 */
  todayCnt  int default 0,							/* 오늘 방문한 횟수 */
  level     int default 1, 							/* 회원등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원, (4:운영자)) */
  startDate datetime default now(),			/* 최초 가입일 */
  lastDate  datetime default now(),			/* 마지막 접속일 */
  userDel   char(2) default 'NO',					/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  primary key (idx)									/* 주키 : idx(고유번호)*/
);

desc member;
select * from member;
drop table member;


create table reservation(
	idx int not null auto_increment primary key, 
	reNum varchar(15),
	exIdx int not null,
	title varchar(100),
	mid varchar(20) not null,
	wDate datetime default now(),
	reDate varchar(20),
	adultNum int,
	childNum int,
	totalPrice int,
	confirm char(2) default 'NO',
	confirmDate varchar(20),
	foreign key(exIdx) references exhibition(idx)
);
desc reservation;
drop table reservation;



