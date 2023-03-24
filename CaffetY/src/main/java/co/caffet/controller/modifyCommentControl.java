package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.CommentsService;
import co.caffet.service.CommentsServiceMybatis;
import co.caffet.vo.CommentVO;

public class modifyCommentControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String commentNum = request.getParameter("cNo");
		String comment = request.getParameter("comment");
		
		CommentsService service =new CommentsServiceMybatis();
		CommentVO cvo = service.modifyComments(Integer.parseInt(commentNum));
		request.setAttribute("cvo", cvo);
		
		return "board/boardPlayView.tiles";
	}

}
