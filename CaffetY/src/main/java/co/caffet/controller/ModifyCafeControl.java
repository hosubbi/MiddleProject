package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class ModifyCafeControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("cafeNum"));
	
		CafeService sv = new CafeServiceMybatis();
		CafeVO vo = sv.searchCafe(Integer.parseInt(request.getParameter("cafeNum")));
		System.out.println("-------------------------------------------------");
		System.out.println(vo);

		request.setAttribute("cafe", vo);
		

		return "cafe/cafeModify.tiles";
	}

}
