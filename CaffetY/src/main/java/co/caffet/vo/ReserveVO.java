package co.caffet.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	private int reserv_num;
	private String member_id;
	private int cafe_num;
	private int member_tel;
	private Date reserv_date;
	private Date reserv_joindate;
}
