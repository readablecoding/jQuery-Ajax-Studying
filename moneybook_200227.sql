*moneybook 프로젝트

create table moneybook_member(
	userid			varchar2(20)		primary key 
	,userpwd 		varchar2(20)		not null
);

create table moneybook_info(
	infonum 		number 				primary key
	,userid			varchar2(20)		not null
	,memo			varchar2(1000)		not null
	,type			vachar2(20)			not null
	,amount			number				default 0
	,inputdate 		date				default sysdate
	,constraint moneybook_info_kf foreign key(userid)
	references moneybook_member(userid) on delete cascade 
);
create sequence moneybook_seq;