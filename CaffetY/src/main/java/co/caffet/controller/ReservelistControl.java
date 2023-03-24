package co.caffet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;
import co.caffet.service.ReserveService;
import co.caffet.service.ReserveServiceMybatis;
import co.caffet.vo.ReserveVO;

public class ReservelistControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		ReserveService rs = new ReserveServiceMybatis();
		
		List<ReserveVO> list = rs.reserves();
		request.setAttribute("list", list);
		
		return "reserve/reserveList.tiles";
	}

}
