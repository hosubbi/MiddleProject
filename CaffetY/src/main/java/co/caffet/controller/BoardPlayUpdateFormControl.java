package co.caffet.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;

public class BoardPlayUpdateFormControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 수정할때 필요한 요청 파라미터값들을 나열한다.
		// parameter: member_id,board_mdate,board_title,board_content
		String boardNum = request.getParameter("boardNum");
		BoardService service = new BoardServiceMybatis();
		
		BoardVO vo = service.boardPlayView(Integer.parseInt(boardNum));
		request.setAttribute("vo", vo);
		
		
		
		
		
		
		
		// 수정메소드 호출.
//		BoardService service = new BoardServiceMybatis();
//		if(service.modifyBoard(vo)) {
//			request.setAttribute("message", "정상 처리 완료");
//		}else {
//			request.setAttribute("message", "예외발생");
//		}

		return "board/boardPlayModify.tiles";
	}

}
