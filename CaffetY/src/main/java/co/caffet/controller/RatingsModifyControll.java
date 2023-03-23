package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class RatingsModifyControll implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String rating =request.getParameter("reviewStar");
		String cafeNum = request.getParameter("cafeNum");
		String loginId = request.getParameter("loginId");
		CafeVO vo = new CafeVO();
		System.out.println("---------------------------------------------------");
		System.out.println(rating);
		vo.setLikeit(Integer.parseInt(rating));
		vo.setCafeNum(Integer.parseInt(cafeNum));
		vo.setMemberId(loginId);
		
		CafeService cs = new CafeServiceMybatis();
		cs.modifyRatings(vo);
		
		return "/cafeInfo.do";
	}

}
