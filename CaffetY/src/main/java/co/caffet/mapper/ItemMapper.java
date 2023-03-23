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
	
<<<<<<< HEAD
=======
	//수정
	public int updateItem(ItemVO vo);
	
	public int deleteItem(int itemNum);
	
	public List<ItemVO> foodTopList();
	
	public List<ItemVO> foodList();
	
	public List<ItemVO> etcTopList();
>>>>>>> branch 'main' of https://github.com/hosubbi/MiddleProject.git
	
}
