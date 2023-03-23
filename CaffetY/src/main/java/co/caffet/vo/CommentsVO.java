package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentsVO {
	private int boardNum;
	private int commentNum;
	private String commentContent;
	private int commentRecomnum;
	private Date commentJoindate;
	private Date commentMdate;
}
