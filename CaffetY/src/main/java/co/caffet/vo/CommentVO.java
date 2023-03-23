package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int boardNum;
	private int commentNum;
	private String commentContent;
	private int commentRecomnum;
	private Date commentJoindate;
	private Date commentMdate;
	
	
	private String replyId;
}
