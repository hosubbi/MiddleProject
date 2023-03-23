package co.caffet.mapper;

import java.util.List;

import co.caffet.vo.ItemVO;

public interface ItemMapper {
	
	public List<ItemVO> itemTopList();
	
	public List<ItemVO> itemList();
	
	public ItemVO selectItem(int itemNum);
	
	public int updateItemCount(int itemNum);
	
	//등록
	public int insertItem(ItemVO vo);
	
	
}
