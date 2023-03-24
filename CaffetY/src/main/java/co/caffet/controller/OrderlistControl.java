package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.OrdersService;
import co.caffet.service.OrdersServiceMybatis;
import co.caffet.vo.OrdersVO;


public class OrderlistControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		OrdersService service = new OrdersServiceMybatis();

		List<OrdersVO> list = service.orders();
		request.setAttribute("list", list);
		
		System.out.println(list);
		

		return "order/orderList.tiles";
	}

}
