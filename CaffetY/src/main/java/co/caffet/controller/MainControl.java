package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.CafeVO;
import co.caffet.vo.ItemVO;

public class MainControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String all = "all";
		CafeService service = new CafeServiceMybatis();
		List<CafeVO> list = service.cafeList(all);
		
		request.setAttribute("list", list);
		
		ItemService is = new ItemServiceMybatis();
		
		List<ItemVO> item = is.items();
		request.setAttribute("itemList", item);
		
		
		return "main/main.tiles";
	}

}
