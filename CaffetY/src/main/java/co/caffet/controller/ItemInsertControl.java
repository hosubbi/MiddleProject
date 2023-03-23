package co.caffet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ItemService;
import co.caffet.service.ItemServiceMybatis;
import co.caffet.vo.ItemVO;

public class ItemInsertControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response){
		
		String itemName = request.getParameter("name");
		int itemPrice = 0;
		if(request.getParameter("price") == null) {
			itemPrice = 0;
		}else {
			itemPrice = Integer.parseInt(request.getParameter("price"));
		}
		int itemStock = Integer.parseInt(request.getParameter("stock"));
		String itemContent = request.getParameter("content");
		String itemDiv = request.getParameter("div");
		
		ItemVO vo = new ItemVO();
		vo.setItemName(itemName);
		vo.setItemPrice(itemPrice);
		vo.setItemStock(itemStock);
		vo.setItemContent(itemContent);
		vo.setItemDiv(itemDiv);
		
		System.out.println(vo);
		
		
		ItemService service = new ItemServiceMybatis();
		service.addItem(vo);
		if(itemDiv.equals("장난감")) {
			return "/toy.do";
		}else if(itemDiv.equals("사료")){
			return "/dogfood.do";
		}else {
			return "toyInsertForm.do";
		}
			
		
	

	}

}
