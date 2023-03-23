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

public class BoardPlaySearchFormControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String boardNum = request.getParameter("boardNum");
		int num = Integer.parseInt(boardNum);
		System.out.println(num);

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
