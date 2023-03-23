package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;
import co.caffet.vo.PageDTO;

public class BoardQnAListControl implements Control {
	// QnA게시판 전체리스트
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}

		// db에서 결과를 가져오기 -> attribute("list")
		BoardService service = new BoardServiceMybatis();
		List<BoardVO> list = service.getQna(Integer.parseInt(page));
		int total = service.getTotalCount();

		request.setAttribute("list", list);
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));

		return "board/boardQnAList.tiles"; // 실행할페이지
	}

}
