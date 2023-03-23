package co.caffet.vo;

import java.util.Date;

import lombok.Data;
@Data
public class CafeVO {
	private int cafeNum;
	private String cafeName;
	private String cafeAddress; 
	private String cafeTel; 
	private String cafeHomepage;
	private String location;
	private int cafeCount;
	private int cafeBnum;
	private Date cafeJoindate;
	private Date cafeMdate; 
	private String cafeWriting;
	
	
	private int cafeimgNum;
	private String cafeimgRoute;
	private Date cafeimgJoindate;
	private Date cafeimgMdate;
	
	private String memberId;
	private int itmeNum;
	private int likeit;
	
	private float avg;
}
