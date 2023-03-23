package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;

public class BoardPlayRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		BoardVO vo = new BoardVO();
		vo.setBoardNum(boardNum);
		
		BoardService service = new BoardServiceMybatis();
		
		boolean result = service.removeBoard(boardNum);
		
		if(result != false) {
			request.setAttribute("message", "삭제 성공!");
		}else {
			request.setAttribute("message", "삭제 실패!");
		}
		return "boardPlayList.do";
		
	}

}
