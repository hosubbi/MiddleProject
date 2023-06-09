package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class ItemInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String itemNum = request.getParameter("itemNum");
		
		ItemService service = new ItemServiceMybatis();
		ItemVO vo = service.getItem(Integer.parseInt(itemNum));
		request.setAttribute("item", vo);
		return "product/toyinfo.tiles";
	}

}
