package co.caffet.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.caffet.common.Control;
import co.caffet.service.OdrDetailService;
import co.caffet.service.OdrDetailServiceMybatis;
import co.caffet.vo.OdrDetailVO;

public class OdrDetailControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		OdrDetailVO vo = new OdrDetailVO();

		vo.setOrderName(request.getParameter("name"));
		vo.setPostal(Integer.parseInt(request.getParameter("post")));
		vo.setOrderAdr(request.getParameter("baddr"));
		vo.setOrderDetailadr(request.getParameter("daddr"));
		vo.setCardKind(request.getParameter("div"));
		vo.setTotalPrice(Integer.parseInt(request.getParameter("tprice")));

		OdrDetailService os = new OdrDetailServiceMybatis();
		boolean result = os.orderDtl(vo);

		Map<String, Object> map = new HashMap<>();

		Gson gson = new GsonBuilder().create();
		String json = "";
		if (result) {
			map.put("retCode", "Success");
			map.put("odrdetail", vo);
		} else {
			map.put("retCode", "Fail");
			map.put("odrdetail", null);
		}

		json = gson.toJson(map);

		return "main.do";
	}

}
