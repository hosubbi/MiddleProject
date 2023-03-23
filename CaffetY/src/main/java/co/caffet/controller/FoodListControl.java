package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class FoodListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		ItemService service = new ItemServiceMybatis();
		
		List<ItemVO> foodTopList =  service.foodTops();
		request.setAttribute("foodTopList", foodTopList);
		
		List<ItemVO> foodList = service.foods();
		request.setAttribute("foodList", foodList);
		

		return "product/dogfood.tiles";
	}

}
