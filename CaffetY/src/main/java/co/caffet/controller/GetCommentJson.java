package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.caffet.common.Control;
import co.caffet.service.CommentsService;
import co.caffet.service.CommentsServiceMybatis;
import co.caffet.vo.CommentVO;

public class GetCommentJson implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String cNum = request.getParameter("cNum");
		CommentsService service = new CommentsServiceMybatis();
		CommentVO vo = service.getComment(Integer.parseInt(cNum)); // {"id":"user1","name":"HOng"}->object:
																	// JSON.parse();
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(vo);
		System.out.println(json);
		return json + ".ajax";
	}

}
