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
	
}
