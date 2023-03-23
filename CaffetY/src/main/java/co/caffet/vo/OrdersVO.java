package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrdersVO {
	private int orderNum;
	private String memberId;
	private int itemNum;
	private int orderCount;
	private Date orderJoindate;
	private Date orderMdate;
}
