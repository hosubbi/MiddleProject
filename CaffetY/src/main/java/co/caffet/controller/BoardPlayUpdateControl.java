package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;

public class BoardPlayUpdateControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글번호, 제목, 내용.
		BoardService service = new BoardServiceMybatis();
		BoardVO vo = new BoardVO();
		String boardNum = request.getParameter("boardNum");

		vo.setBoardContent(request.getParameter("boardContent"));
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardNum(Integer.parseInt(boardNum));
		System.out.println("---------------------------");
		System.out.println(vo);
		
		service.modifyBoard(vo);
		
		
		//service.modifyBoard(board);

		return "boardPlayList.do";
	}
}