package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ItemImgVO {
	private int itemimgNum;
	private int itemNum;
	private String itmeimgRoute;
	private Date itemimgJoindate;
	private Date itemimgMdate;
}
