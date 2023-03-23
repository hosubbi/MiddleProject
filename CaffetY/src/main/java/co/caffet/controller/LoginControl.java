package co.caffet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.caffet.common.Control;
import co.caffet.service.MemberService;
import co.caffet.service.MemberServiceMybatis;
import co.caffet.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("uid");
		String pw = request.getParameter("upw");
		
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPw(pw);
		
		MemberService service = new MemberServiceMybatis();
		vo = service.login(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("my", vo);
//		session.setAttribute("id", vo.getMemberId());
//		session.setAttribute("pw", vo.getMemberPw());
//		session.setAttribute("age", vo.getMemberAge());
//		session.setAttribute("gend", vo.getMemberGender());
//		session.setAttribute("ema", vo.getMemberEmail());
//		session.setAttribute("addr", vo.getMemberAddress());
//		session.setAttribute("tel", vo.getMemberTel());
//		session.setAttribute("auther", vo.getMemberAuther());
//		
		
		
		
		return "main.do";
		
		
	}

}
