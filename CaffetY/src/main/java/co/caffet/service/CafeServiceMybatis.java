package co.caffet.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.CafeMapper;
import co.caffet.vo.CafeVO;

public class CafeServiceMybatis implements CafeService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CafeMapper mapper = sqlSession.getMapper(CafeMapper.class);
	@Override
	public List<CafeVO> cafeList() {
		// TODO Auto-generated method stub
		return mapper.cafeList();
	}
	@Override
	public CafeVO getCafe(int cafeNum) {
		mapper.updateCount(cafeNum);
		return mapper.selectCafe(cafeNum);
	}
	@Override
	public List<CafeVO> getCafeImg(int cafeNum) {
		// TODO Auto-generated method stub
		return mapper.selectCafeImg(cafeNum);
	}
	@Override
	public boolean cafeInsert(CafeVO vo) {
		
		return mapper.insertCafe(vo) == 1;
	}
	@Override
	public CafeVO cafeSearch() {
		// TODO Auto-generated method stub
		return mapper.selectCafeNum();
	}
	@Override
	public void addCafeImg(CafeVO vo) {
		mapper.insertRatings(vo);
		mapper.insertCafeImg(vo);
	}
	@Override
	public void modifyRatings(CafeVO vo) {
		mapper.RatingsInsert(vo);
	}

}
