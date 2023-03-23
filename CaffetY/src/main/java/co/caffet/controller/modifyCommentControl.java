package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CommentsService;
import co.caffet.service.CommentsServiceMybatis;

public class modifyCommentControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String commentNum = request.getParameter("commentNum");
		CommentsService service =new CommentsServiceMybatis();
		
		
		
		return "board/boardPlayView.tiles";
	}

}
