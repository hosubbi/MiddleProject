package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OdrDetailVO {
	private int orderNum;
	private String  orderAdr;
	private String orderDetailadr;
	private int postal;
	private String orderName;
	private int totalPrice;
	private String cardKind;
	private Date orderJoindate;
	private Date orderMdate;
}
