package co.caffet.vo;

import java.util.Date;

import lombok.Data;
@Data
public class ItemVO {
	private int itemNum;
	private String itemName;
	private int itemPrice;
	private int itemStock;
	private String itemContent;
	private int itemCount;
	private Date itemJoindate;
	private Date itemMdate;
	private String itemDiv;
}
