package co.caffet.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.ItemMapper;
import co.caffet.vo.ItemVO;

public class ItemServiceMybatis implements ItemService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ItemMapper mapper = sqlSession.getMapper(ItemMapper.class);
	
	@Override
	public List<ItemVO> itemTops() {
		return mapper.itemTopList();
	}

	@Override
	public List<ItemVO> items() {
		return mapper.itemList();
	}

	@Override
	public ItemVO getItem(int itemNum) {
		mapper.updateItemCount(itemNum);
		mapper.selectItem(itemNum);
		return mapper.selectItem(itemNum);
	}

	@Override
	public boolean addItem(ItemVO vo) {
		int r = mapper.insertItem(vo);
		return r == 1;
	}


	@Override
	public boolean itemModify(ItemVO vo) {
		int r = mapper.updateItem(vo);
		return r == 1;
	}

	@Override
	public int itemDelete(int itemNum) {
		return mapper.deleteItem(itemNum);
	}

	@Override
	public List<ItemVO> foodTops() {
		return mapper.foodTopList();
	}

	@Override
	public List<ItemVO> foods() {
		return mapper.foodList();
	}

	@Override
	public List<ItemVO> etcTops() {
		return mapper.etcTopList();
	}

	@Override
	public List<ItemVO> etcs() {
		return mapper.etcList();
	}

	
}
