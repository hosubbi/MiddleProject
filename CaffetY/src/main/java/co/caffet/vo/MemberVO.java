package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
//	member_id varchar2(15) primary key,
//	member_pw varchar2(30) not null,
//	member_name varchar2(15) not null,
//	member_age number(3) not null,
//	member_gender varchar2(10) not null,
//	member_address varchar2(90) not null,
//	member_auther varchar2(20) not null,
//	member_email varchar2(90) not null,
//	member_joindate date default sysdate,
//	member_tel varchar(20) not null
	
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberAge; 
	private String memberGender;
	private String memberAddress; 
	private String memberAuther;
	private String memberEmail; 
	private Date memberJoindate; 
	private String memberTel;
	private String memberPwc;
	
}
