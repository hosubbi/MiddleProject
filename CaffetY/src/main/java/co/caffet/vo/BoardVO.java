package co.caffet.vo;

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO {
<<<<<<< HEAD
	private int boardNum; //게시번호
	private String boardDiv; //게시구분
	
	private String boardimgName; //게시이미지이름
	
	private String boardTitle; //게시글제목
	private String boardContent; //게시글내용
	private String memberId; //아이디
	private int boardCount; //게시글조회수
	private Date boardJoindate; //게시글등록일
	private Date boardMdate; //게시글수정일
	
=======
	private int boardNum;
	private String boardDiv;
	private String boardTitle;
	private int boardCount;
	private Date boardJoindate;
	private Date boardMdate;
>>>>>>> branch 'main' of https://github.com/hosubbi/MiddleProject.git
}
