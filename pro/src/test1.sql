SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS orderitem;
DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS orderinfo;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	board_num int NOT NULL AUTO_INCREMENT,
	board_content varchar(500) NOT NULL,
	board_file varchar(200) NOT NULL,
	board_time date NOT NULL,
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	board_title varchar(100),
	board_readcnt int,
	board_id varchar(2),
	board_grp int,
	board_grplevel int,
	board_grpstep int,
	PRIMARY KEY (board_num),
	UNIQUE (mem_id)
);


CREATE TABLE cart
(
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	goods_code int NOT NULL,
	cart_quantity int NOT NULL,
	PRIMARY KEY (mem_id, goods_code),
	UNIQUE (mem_id)
);


CREATE TABLE comment
(
	board_num int NOT NULL,
	comment_num int NOT NULL AUTO_INCREMENT,
	comment_content varchar(100) NOT NULL,
	comment_time datetime NOT NULL,
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	PRIMARY KEY (board_num, comment_num),
	UNIQUE (mem_id)
);


CREATE TABLE delivery
(
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	delivery_num int NOT NULL,
	delivery_address varchar(200) NOT NULL,
	PRIMARY KEY (mem_id, delivery_num),
	UNIQUE (mem_id)
);


CREATE TABLE goods
(
	goods_code int NOT NULL,
	goods_name varchar(100) NOT NULL,
	goods_price int NOT NULL,
	goods_img varchar(200) NOT NULL,
	PRIMARY KEY (goods_code)
);


CREATE TABLE member
(
	mem_pw varchar(15) NOT NULL,
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	mem_name varchar(15) NOT NULL,
	mem_phone varchar(15) NOT NULL,
	mem_email varchar(200) NOT NULL,
	mem_adress varchar(200) NOT NULL,
	mem_position int NOT NULL,
	mem_point int,
	PRIMARY KEY (mem_id),
	UNIQUE (mem_id),
	UNIQUE (mem_phone),
	UNIQUE (mem_email)
);


CREATE TABLE orderinfo
(
	oder_code int NOT NULL,
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	mem_address varchar(200),
	PRIMARY KEY (oder_code),
	UNIQUE (oder_code),
	UNIQUE (mem_id)
);


CREATE TABLE orderitem
(
	oder_code int NOT NULL,
	goods_code int NOT NULL,
	cart_quantity int,
	-- 아이디
	mem_id varchar(15) NOT NULL COMMENT '아이디',
	PRIMARY KEY (oder_code, goods_code),
	UNIQUE (oder_code),
	UNIQUE (mem_id)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (board_num)
	REFERENCES board (board_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cart
	ADD FOREIGN KEY (goods_code)
	REFERENCES goods (goods_code)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderitem
	ADD FOREIGN KEY (goods_code)
	REFERENCES goods (goods_code)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cart
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE delivery
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderinfo
	ADD FOREIGN KEY (mem_id)
	REFERENCES member (mem_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderitem
	ADD FOREIGN KEY (oder_code)
	REFERENCES orderinfo (oder_code)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



