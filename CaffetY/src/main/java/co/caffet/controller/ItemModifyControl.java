package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class ItemModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int itemNum = Integer.parseInt(request.getParameter("num"));
		String itemName = request.getParameter("name");
		int itemPrice = 0;
		if(request.getParameter("price")==null) {
			itemPrice = 0;
		}else {
			itemPrice=Integer.parseInt(request.getParameter("price"));
		}
		
		int itemStock = Integer.parseInt(request.getParameter("stock"));
		String itemDiv = request.getParameter("div");
		String itemContent = request.getParameter("content");	
		
		ItemVO item = new ItemVO();
		item.setItemNum(itemNum);
		item.setItemName(itemName);
		item.setItemPrice(itemPrice);
		item.setItemStock(itemStock);
		item.setItemDiv(itemDiv);
		item.setItemContent(itemContent);
		
		System.out.println(item);
		
		ItemService service = new ItemServiceMybatis();
		service.itemModify(item);
		
		
		if(itemDiv.equals("장난감")) {
			return "/toy.do";
		}else {
			return "/main.do";
		}
	}

}
