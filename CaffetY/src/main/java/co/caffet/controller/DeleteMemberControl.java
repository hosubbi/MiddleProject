package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.caffet.common.Control;
import co.caffet.service.MemberService;
import co.caffet.service.MemberServiceMybatis;
import co.caffet.vo.MemberVO;

public class DeleteMemberControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("uidaa");
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		
		MemberService ms = new MemberServiceMybatis();
		
		boolean result = ms.removeMember(id);
		
		if(result = true) {
			request.setAttribute("message", "삭제성공");
		}else {
			request.setAttribute("message", "삭제실패");
		}
		
		HttpSession session = request.getSession(); // 요청정보 세션객체 가져오는 메소드.
		session.invalidate();
		return "main.do";
		
	}

}
