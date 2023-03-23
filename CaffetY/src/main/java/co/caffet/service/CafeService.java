package co.caffet.service;

import java.util.List;

import co.caffet.vo.CafeVO;

public interface CafeService {

	public List<CafeVO> cafeList(String all);

	public CafeVO getCafe(int cafeNum);

	public List<CafeVO> getCafeImg(int parseInt);

	public boolean cafeInsert(CafeVO vo);

	public CafeVO cafeSearch();

	public void addCafeImg(CafeVO vo);

	public void modifyRatings(CafeVO vo);

	public CafeVO searchCafe(int num);

	public boolean modifyCafe(CafeVO vo);

	public boolean chekedRatings(CafeVO vo);

	public void firstRatings(int cafeNum);

}
