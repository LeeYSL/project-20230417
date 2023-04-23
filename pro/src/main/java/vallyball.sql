create table vmember (
	id varchar(20) primary key,
	pass varchar(20),
	name varchar(20),
	gender int(1),
	tel varchar(15),
	emaile varchar(50),
	birthday varchar(15),
	address varchar(100)
);

select * from vmember

create table board (
   board_num int primary key, --게시글번호. 기본키
   board_writer varchar(30),  --작성자이름
   board_pass varchar(20),    --비밀번호
   board_title varchar(100),  --글제목
   board_content varchar(2000), --글내용
   board_file1 varchar(200),   -- 첨부파일명
   board_boardid varchar(2),   -- 게시판종류:1:공지사항,2:자유게시판,3:QNA
   board_regdate datetime,     -- 등록일시
   board_readcnt int(10),      -- 조회수. 상세보기 시 1씩증가
   board_grp int,              -- 답글 작성시 원글의 게시글번호
   board_grplevel int(3),      -- 답글의 레벨. 
   board_grpstep int(5)        -- 그룹의 출력 순서
);

create table board (
   board_num int primary key, 
   board_writer varchar(30), 
   board_title varchar(100),  
   board_content varchar(2000),
   board_file1 varchar(200),  
   board_boardid varchar(2), 
   board_regdate datetime,     
   board_readcnt int(10),      
   board_grp int,           
   board_grplevel int(3),      
   board_grpstep int(5)        
);