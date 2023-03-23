package co.caffet.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.caffet.common.Control;
import co.caffet.service.MemberService;
import co.caffet.service.MemberServiceMybatis;
import co.caffet.vo.MemberVO;

public class ModifymemberControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String nm = request.getParameter("uname");
		String id = request.getParameter("uid");
		String pw = request.getParameter("psw");
		String pwc = request.getParameter("psw-repeat");
		int age = 0;
		if(request.getParameter("uage")==null) {
			age = 0;
		}else {
			age=Integer.parseInt(request.getParameter("uage"));
		}
		String gend = request.getParameter("user_sex");
		String ema = request.getParameter("email");
		String addr = request.getParameter("address");
		String tel = request.getParameter("tel");
		String auth = request.getParameter("user_auther");

		MemberVO vo = new MemberVO();
		vo.setMemberName(nm);
		vo.setMemberId(id);
		vo.setMemberPw(pw);
		vo.setMemberPwc(pwc);
		vo.setMemberAge(age);
		vo.setMemberGender(gend);
		vo.setMemberEmail(ema);
		vo.setMemberAddress(addr);
		vo.setMemberAuther(auth);
		vo.setMemberTel(tel);
		System.out.println("====================================================");
		System.out.println(vo);

		MemberService service = new MemberServiceMybatis();
		
		if (service.updateMember(vo)) {
			request.setAttribute("message", "정상 처리 완료.");
		} else {
			request.setAttribute("message", "예외 발생.");
		}

		
		
		
//		boolean result = service.updateMember(vo);
//
//		Map<String, Object> map = new HashMap<>();
//
//		Gson gson = new GsonBuilder().create();
//		String json = "";
//		if (result) {
//			map.put("retCode", "Success");
//			map.put("member", vo);
//		} else {
//			map.put("retCode", "Fail");
//			map.put("member", null);
//		}
//
//		json = gson.toJson(map);

		return "main.do";
	}

}
