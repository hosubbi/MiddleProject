package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cartNum;
	private String cartMid;
	private int cartItmenum;
	private Date cartJoindate;
	private Date cartMdate;
}
