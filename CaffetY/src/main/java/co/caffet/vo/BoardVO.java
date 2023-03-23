package co.caffet.vo;

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO {
	private int boardNum;
	private String boardDiv;
	private String boardTitle;
	private int boardCount;
	private Date boardJoindate;
	private Date boardMdate;
}
