package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;

public class RemoveCafeControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
		CafeService cs = new CafeServiceMybatis();
		System.out.println(request.getParameter("cafeNum"));
		cs.removeCafe(Integer.parseInt(request.getParameter("cafeNum")));
		
		return "main.do";
	}

}
