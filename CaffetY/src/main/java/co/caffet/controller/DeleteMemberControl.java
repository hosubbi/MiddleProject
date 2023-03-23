package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.MemberService;
import co.caffet.service.MemberServiceMybatis;

public class DeleteMemberControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		MemberService service = new MemberServiceMybatis();
		boolean result = service.removeMember(request.getParameter("uid"));
		String json = "";
		if(result) { // {"retCode" : "Success"}
			json = "{\"retCode\" : \"Success\"}";
		} else { // {"retCode" : "Fail"}
			json = "{\"retCode\" : \"Fail\"}";
		}
		
		return "member/deleteMember.do";
		
		
	}

}
