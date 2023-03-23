package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.caffet.common.Control;
import co.caffet.service.MemberService;
import co.caffet.service.MemberServiceMybatis;
import co.caffet.vo.MemberVO;

public class MypageControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("uid");
		MemberService ms = new MemberServiceMybatis();
		MemberVO vo= ms.getMember("id");
		
		
		return "member/myPage.tiles";
	}

}
