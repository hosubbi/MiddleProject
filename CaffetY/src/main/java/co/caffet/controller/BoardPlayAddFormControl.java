package co.caffet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;

public class BoardPlayAddFormControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 글쓰기에서 입력요청받을 파라미터값
		String memberId = request.getParameter("memberId");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String boardDiv = request.getParameter("boardDiv");

		System.out.println("-------------------------------");
		System.out.println(memberId);
		System.out.println(boardTitle);
		System.out.println(boardContent);
		System.out.println(boardDiv);
		System.out.println("-------------------------------");

		BoardVO vo = new BoardVO();
		vo.setMemberId(memberId);
		vo.setBoardTitle(boardTitle);
		vo.setBoardContent(boardContent);
		vo.setBoardDiv(boardDiv);
		System.out.println(vo);

		BoardService service = new BoardServiceMybatis();
		service.addBoard(vo);

		if (boardDiv.equals("play")) {
			return "boardPlayList.do";
		} else if (boardDiv.equals("QnA")) {
			return "boardQnAList.do";
		}
		return "boardPlayList.do";
	}

}
