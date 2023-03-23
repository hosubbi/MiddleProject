package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class EtcListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ItemService service = new ItemServiceMybatis();
		
		List<ItemVO> etcTopList =  service.etcTops();
		request.setAttribute("etcTopList", etcTopList);
		
		List<ItemVO> foodList = service.foods();
		request.setAttribute("foodList", foodList);
		
		return "product/etc.tiles";
	}

}
