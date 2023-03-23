package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.caffet.common.Control;
import co.caffet.service.BoardService;
import co.caffet.service.BoardServiceMybatis;
import co.caffet.vo.BoardVO;

public class BoardPlayAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("info", "play");
		return "board/boardAdd.tiles";
	}

}
