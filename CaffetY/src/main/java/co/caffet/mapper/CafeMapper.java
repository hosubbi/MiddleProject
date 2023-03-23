package co.caffet.mapper;

import java.util.List;

import co.caffet.vo.CafeVO;

public interface CafeMapper {
	
	public List<CafeVO> cafeList(String all);

	public CafeVO selectCafe(int cafeNum);

	public List<CafeVO> selectCafeImg(int cafeNum);

	public void updateCount(int cafeNum);

	public int insertCafe(CafeVO vo);

	public CafeVO selectCafeNum();

	public void insertCafeImg(CafeVO vo);

	public void insertRatings(int cafeNum);

	public void RatingsInsert(CafeVO vo);

	public List<CafeVO> selectCafeList(String all);

	public CafeVO selectModifyCafe(int num);

	public boolean updateCafe(CafeVO vo);

	public int checkRatings(CafeVO vo);

	

}
