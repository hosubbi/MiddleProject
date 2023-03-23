package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.caffet.common.Control;

public class ItemInsertForm implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "product/toyinsertform.tiles";
	}

}
