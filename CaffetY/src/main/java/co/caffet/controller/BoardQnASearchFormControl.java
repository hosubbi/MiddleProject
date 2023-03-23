package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;

public class BoardQnASearchFormControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String boardNum = request.getParameter("boardNum");
		int num = Integer.parseInt(boardNum);
		System.out.println(num);
		
		BoardService service = new BoardServiceMybatis();
		
		BoardVO vo = service.boardQnAView(num);
		
		request.setAttribute("vo", vo);
		
		
		return "board/boardQnAView.tiles";
	}

}
