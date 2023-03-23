package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class ItemDeleteControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int iNum = Integer.parseInt(request.getParameter("num"));
		ItemVO vo = new ItemVO();
		vo.setItemNum(iNum);
		
		
		System.out.println(vo);
		
		ItemService service = new ItemServiceMybatis();
		
		service.itemDelete(iNum);
		
		return "main.do";
	}              

}
