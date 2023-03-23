package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;
import co.caffet.vo.PageDTO;

public class BoardPlayListControl implements Control {

	// 놀이터게시판 전체리스트
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");

		if (page == null) {
			page = "1";
		}

		// db에서 결과를 가져오기 -> attribute("list")
		//인터페이스                    클래스 (오버라이딩)
		BoardService service = new BoardServiceMybatis();
		List<BoardVO> list = service.getBoards(Integer.parseInt(page));
		int total = service.getTotalCount();

		request.setAttribute("list", list);
		
		
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));

		
		return "board/boardPlayList.tiles"; // 실행할 페이지
	}

}
