package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class ToyListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ItemService service = new ItemServiceMybatis();
		
		List<ItemVO> topList =  service.itemTops();
		request.setAttribute("topList", topList);
		
		List<ItemVO> list = service.items();
		request.setAttribute("list", list);
		
		
		return "product/toy.tiles";
	}

}
