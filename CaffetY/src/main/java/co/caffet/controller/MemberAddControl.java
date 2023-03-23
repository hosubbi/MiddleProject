package co.caffet.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.caffet.common.Control;
import co.caffet.service.MemberService;
import co.caffet.service.MemberServiceMybatis;
import co.caffet.vo.MemberVO;

public class MemberAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO vo = new MemberVO();
		
		vo.setMemberName(request.getParameter("uname"));
		vo.setMemberId(request.getParameter("uid"));
		vo.setMemberPw(request.getParameter("psw"));
		vo.setMemberPwc(request.getParameter("psw-repeat"));
		String birth1 = request.getParameter("birth1");
		LocalDate cdate = LocalDate.now();
		int cyear = cdate.getYear();
		vo.setMemberAge((cyear - Integer.parseInt(birth1))+1);
		vo.setMemberGender(request.getParameter("user_sex"));
		vo.setMemberEmail(request.getParameter("email"));
		vo.setMemberAddress(request.getParameter("address"));
		vo.setMemberTel(request.getParameter("tel"));
		vo.setMemberAuther(request.getParameter("user_auther"));
		
		MemberService service = new MemberServiceMybatis();
		boolean result = service.addMember(vo);
		Map<String, Object> map = new HashMap<>();
		
		Gson gson = new GsonBuilder().create();
		String json ="";
		if(result) {
			map.put("retCode", "Success");
			map.put("member", vo);
		}else {
			map.put("retCode", "Fail");
			map.put("member", null);
		}
		
		json = gson.toJson(map);

		return "main/main.tiles";
	}

}
