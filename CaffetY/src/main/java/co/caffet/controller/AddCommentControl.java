package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.service.CommentsService;
import co.caffet.service.CommentsServiceMybatis;
import co.caffet.vo.BoardVO;
import co.caffet.vo.CommentVO;

public class AddCommentControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("coment=========================================");
		
		String writerId = request.getParameter("writerId");
		String comment = request.getParameter("comment");
		
		// BoardPlaySearchFormControl 의 기능.
		String boardNum = request.getParameter("boardNum");
		int num = Integer.parseInt(boardNum);
		System.out.println(num);
		
		// 댓글입력.
		CommentVO commentVO = new CommentVO();
		commentVO.setBoardNum(num);
		commentVO.setCommentContent(comment);
		commentVO.setReplyId(writerId);
		
		CommentsService cService = new CommentsServiceMybatis();
		cService.addComments(commentVO);
 
		// 게시글번호 조회. 댓글정보 조회.
		BoardService service = new BoardServiceMybatis();
		BoardVO vo = service.boardPlayView(num);

		request.setAttribute("vo", vo);

		// ----------------------------------------------------------------------------

		CommentsService service2 = new CommentsServiceMybatis();
		List<CommentVO> cvo = service2.getComments(num);
		System.out.println("-----------------------------");
		System.out.println(cvo);
		request.setAttribute("cvo", cvo);
		return "board/boardPlayView.tiles";

	}

}
