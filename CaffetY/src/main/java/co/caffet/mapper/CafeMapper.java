package co.caffet.mapper;

import java.util.List;

import co.caffet.vo.CafeVO;

public interface CafeMapper {
	
	public List<CafeVO> cafeList();

	public CafeVO selectCafe(int cafeNum);

	public List<CafeVO> selectCafeImg(int cafeNum);

	public void updateCount(int cafeNum);

	public int insertCafe(CafeVO vo);

	public CafeVO selectCafeNum();

	public void insertCafeImg(CafeVO vo);

	public void insertRatings(CafeVO vo);

	public void RatingsInsert(CafeVO vo);

	

}
