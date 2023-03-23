package co.caffet.service;

import java.util.List;

import co.caffet.vo.ItemVO;

public interface ItemService {

	public List<ItemVO> itemTops();
	
	public List<ItemVO> items();
	
	public ItemVO getItem(int itemNum);
	
	public boolean addItem(ItemVO vo);
}
