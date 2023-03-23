package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class CafeModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CafeService cs = new CafeServiceMybatis();
		CafeVO vo = new CafeVO();
		vo.setCafeNum(Integer.parseInt(request.getParameter("cafeNum")));
		vo.setCafeName(request.getParameter("cafeName"));
		vo.setCafeAddress(request.getParameter("cafeAddress"));
		vo.setLocation(request.getParameter("location"));
		vo.setCafeTel(request.getParameter("cafeTel"));
		vo.setCafeHomepage(request.getParameter("cafeHomepage"));
		vo.setCafeWriting(request.getParameter("cafeWriting"));
		System.out.println(vo);
		
		cs.modifyCafe(vo);
		
		//return "cafeInfo.do?cafeNum="+ Integer.parseInt(request.getParameter("cafeNum"));
		return "cafeInfo.do?cafeNum="+Integer.parseInt(request.getParameter("cafeNum"));
	}

}
