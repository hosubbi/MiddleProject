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
import co.caffet.controller.AddCommentControl;
import co.caffet.controller.BoardPlayAddControl;
import co.caffet.controller.BoardPlayAddFormControl;
import co.caffet.controller.BoardPlayListControl;
import co.caffet.controller.BoardPlayRemoveControl;
import co.caffet.controller.BoardPlaySearchFormControl;
import co.caffet.controller.BoardPlayUpdateControl;
import co.caffet.controller.BoardPlayUpdateFormControl;
import co.caffet.controller.BoardPlayView;
import co.caffet.controller.BoardQnAAddControl;
import co.caffet.controller.BoardQnAAddFormControl;
import co.caffet.controller.BoardQnAListControl;
import co.caffet.controller.BoardQnASearchFormControl;
import co.caffet.controller.BoardQnAView;
import co.caffet.controller.CafeAddControl;
import co.caffet.controller.CafeInfo;
import co.caffet.controller.CafeListForm;
import co.caffet.controller.CafeModifyControl;
import co.caffet.controller.DeleteMemberControl;
import co.caffet.controller.LoginControl;
import co.caffet.controller.LogoutControl;
import co.caffet.controller.MainControl;
import co.caffet.controller.MemberAddControl;
import co.caffet.controller.ModifyCafeControl;
import co.caffet.controller.ModifyMemberFormControl;
import co.caffet.controller.ModifymemberControl;
import co.caffet.controller.MypageControl;
import co.caffet.controller.NoticeControl;
import co.caffet.controller.RatingsModifyControll;
import co.caffet.controller.SearchCafeControl;
import co.caffet.controller.ToyInfoControl;
import co.caffet.controller.ToyInsertControl;
import co.caffet.controller.ToyInsertFormControl;
import co.caffet.controller.ToyListControl;
import co.caffet.controller.modifyCommentControl;


public class FrontController extends HttpServlet {

	private Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		map.put("/main.do", new MainControl());
		map.put("/searchCafe.do", new SearchCafeControl());
		
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
		
		map.put("/modifyCafe.do", new ModifyCafeControl());
		
		map.put("/cafeModify.do", new CafeModifyControl());
		
		
		
		//product
		map.put("/notice.do", new NoticeControl());
		map.put("/toy.do", new ToyListControl());
		map.put("/toyInfo.do", new ToyInfoControl());
		map.put("/toyInsertForm.do", new ToyInsertFormControl());
		map.put("/itemInsert.do", new ToyInsertControl());
		
		
		//board
		map.put("/boardPlayList.do", new BoardPlayListControl());
		// 게시글보는화면
		map.put("/boardPlayView.do", new BoardPlayView());
		// 게시글등록화면
		map.put("/boardPlayAdd.do", new BoardPlayAddControl());
		// 게시글등록처리된화면
		map.put("/boardPlayAddForm.do", new BoardPlayAddFormControl());
		// 놀이터글조회화면
		map.put("/boardPlaySearchForm.do", new BoardPlaySearchFormControl());
		// 놀이터글조회처리화면
		// map.put("/boardPlaySearch.do", new BoardPlaySearchControl());
		// 놀이터수정화면
		map.put("/boardPlayUpdateForm.do", new BoardPlayUpdateFormControl());
		// 놀이터수정처리화면
		map.put("/boardPlayUpdate.do", new BoardPlayUpdateControl());
		// 놀이터삭제화면
		map.put("/boardPlayRemove.do", new BoardPlayRemoveControl());
		
		//댓글등록	
		map.put("/addComment.do", new AddCommentControl());
		//댓글수정
		map.put("/modifyComment.do", new modifyCommentControl());
		
	//-----------------------------------------------------------------------------------//

		// 2.Q&A
		// QnA목록리스트
		map.put("/boardQnAList.do", new BoardQnAListControl());
		// 게시글보는화면
		map.put("/boardQnAView.do", new BoardQnAView());
//		//게시글등록화면
		map.put("/boardQnAAdd.do", new BoardQnAAddControl());
//		//게시글등록처리
		map.put("/boardQnAAddForm.do", new BoardQnAAddFormControl());
//		//QnA글조회화면
		map.put("/boardQnASearchForm.do", new BoardQnASearchFormControl());
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
			viewPage = "/WEB-INF/views/" + viewPage; // memberList.do
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
