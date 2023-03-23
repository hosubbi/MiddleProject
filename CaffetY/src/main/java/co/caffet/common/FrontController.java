package co.caffet.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.controller.AddCafe;
import co.caffet.controller.CafeAddControl;
import co.caffet.controller.CafeInfo;
import co.caffet.controller.CafeListForm;
import co.caffet.controller.DeleteMemberControl;
import co.caffet.controller.EtcListControl;
import co.caffet.controller.FoodListControl;
import co.caffet.controller.ItemDeleteControl;
import co.caffet.controller.ItemModifyControl;
import co.caffet.controller.ItemModifyFormControl;
import co.caffet.controller.LoginControl;
import co.caffet.controller.LogoutControl;
import co.caffet.controller.MainControl;
import co.caffet.controller.MemberAddControl;
import co.caffet.controller.ModifyMemberFormControl;
import co.caffet.controller.ModifymemberControl;
import co.caffet.controller.MypageControl;
import co.caffet.controller.NoticeControl;
import co.caffet.controller.RatingsModifyControll;
import co.caffet.controller.ItemInfoControl;
import co.caffet.controller.ItemInsertControl;
import co.caffet.controller.ItemInsertForm;
import co.caffet.controller.ToyListControl;


public class FrontController extends HttpServlet {

	private Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainControl());
		
		//member
		map.put("/login.do", new LoginControl());
		map.put("/memberAdd.do", new MemberAddControl());
		map.put("/logout.do", new LogoutControl());
		map.put("/myPage.do", new MypageControl());
		map.put("/modifyMember.do", new ModifymemberControl());
		map.put("/modifyMemberForm.do", new ModifyMemberFormControl());
		map.put("/deleteMember.do", new DeleteMemberControl());
		//map.put("/orderList.do", new OrderlistControl());
		//map.put("/reserveList.do", new ReservelistControl());
		
		//cafe
		map.put("/cafeListForm.do", new CafeListForm());
		map.put("/cafeInfo.do", new CafeInfo());
		map.put("/addCafe.do", new CafeAddControl());
		map.put("/cafeAdd.do", new AddCafe());
		map.put("/ratingsModify.do", new RatingsModifyControll());
		
		//product
		map.put("/notice.do", new NoticeControl());
		map.put("/toy.do", new ToyListControl());
		map.put("/toyInfo.do", new ItemInfoControl());
		map.put("/toyInsertForm.do", new ItemInsertForm());
		map.put("/itemInsert.do", new ItemInsertControl());
		map.put("/itemModifyForm.do", new ItemModifyFormControl());
		map.put("/itemModify.do", new ItemModifyControl());
		map.put("/itemDelete.do", new ItemDeleteControl());
		map.put("/dogfood.do", new FoodListControl());
		map.put("/etc.do", new EtcListControl());
		
		
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uri = req.getRequestURI(); // /HelloApp/members.do
		String context = req.getContextPath(); // /HelloApp
		String page = uri.substring(context.length()); /// members.do

		System.out.println(uri);
		System.out.println(context);
		System.out.println("요청 do: " + page);

		Control command = map.get(page);
		System.out.println(command);
		String viewPage = command.exec(req, resp); // product/productList.tiles
		
		
		if (viewPage.endsWith(".jsp")) {
			viewPage = "/WEB_INF/views/" + viewPage; // memberList.do
//		}else if(viewPage.endsWith(".tiles")){  //members.do
//			viewPage = "./" + viewPage;
		} else if (viewPage.endsWith(".ajax")) {
			resp.setContentType("text/json;charset=utf-8");
			resp.getWriter().append(viewPage.substring(0, viewPage.length() - 5));
			return;
		}

		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}
