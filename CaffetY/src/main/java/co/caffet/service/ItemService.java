package co.caffet.service;

import java.util.List;

import co.caffet.vo.ItemVO;

public interface ItemService {

	public List<ItemVO> itemTops();
	
	public List<ItemVO> items();
	
	public ItemVO getItem(int itemNum);
	
	//추가
	public boolean addItem(ItemVO vo);
	
	//수정
	public boolean itemModify(ItemVO vo);
	
	//삭제
	public int itemDelete(int itemNum);
	
	public List<ItemVO> foodTops();
	
	public List<ItemVO> foods();
	
	public List<ItemVO> etcTops();
	
}
