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
		
		String id = request.getParameter("uid");
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		
		MemberService ms = new MemberServiceMybatis();
		
		ms.removeMember(id);
		

		if(ms.removeMember(id)==true) {
			System.out.println("탈퇴성공");
			return "main/main.tiles";
		}else {
			System.out.println("탈퇴실패");
			return "main/main.tiles";
		}
		
		//HttpSession session = request.getSession(); // 요청정보 세션객체 가져오는 메소드.
		//session.invalidate();
		
		
	}

}
