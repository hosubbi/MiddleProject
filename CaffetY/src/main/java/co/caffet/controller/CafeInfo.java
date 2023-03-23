package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class CafeInfo implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cafeNum = request.getParameter("cafeNum");
		System.out.println(cafeNum);
		
		CafeService cs = new CafeServiceMybatis();
		CafeVO vo = cs.getCafe(Integer.parseInt(cafeNum));
		List<CafeVO> img = cs.getCafeImg(Integer.parseInt(cafeNum));
		request.setAttribute("cafe", vo);
		request.setAttribute("img", img);
		
		return "cafe/cafeInfo.tiles";
	}

}
