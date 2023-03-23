package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;

public class BoardQnAAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("info", "QnA");
		//info가 QnA라는 게시판에서 글등록 하는 페이지 요청
		return "board/boardAdd.tiles"; 
	}

}
