package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class SearchCafeControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String all = request.getParameter("all");
		System.out.println(all);
		
		CafeService cafeList = new CafeServiceMybatis();
		List<CafeVO> list = cafeList.cafeList(all);
		
		request.setAttribute("list", list);
		
		return "cafe/cafeList.tiles";
	}

}
