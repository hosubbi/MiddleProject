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
	public List<CafeVO> cafeList(String all) {
		if(all.equals("all")) {
			return mapper.cafeList(all);
		}else {
			return mapper.selectCafeList(all);
		}
		
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
		
		mapper.insertCafeImg(vo);
	}
	@Override
	public void modifyRatings(CafeVO vo) {
		mapper.RatingsInsert(vo);
	}
	@Override
	public CafeVO searchCafe(int num) {
		// TODO Auto-generated method stub
		return mapper.selectModifyCafe(num);
	}
	@Override
	public boolean modifyCafe(CafeVO vo) {
		return mapper.updateCafe(vo);
	}
	@Override
	public boolean chekedRatings(CafeVO vo) {
		// TODO Auto-generated method stub
		return mapper.checkRatings(vo) == 1;
	}
	@Override
	public void firstRatings(int cafeNum) {
		mapper.insertRatings(cafeNum);
		
	}

}
