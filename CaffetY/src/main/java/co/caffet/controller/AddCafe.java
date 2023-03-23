package co.caffet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class AddCafe implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String dir = request.getServletContext().getRealPath("imgupload");

		System.out.println("dir: " + dir);
		int maxSize = 5 * 1024 * 1024;
		String enc = "UTF-8";

		try {

			MultipartRequest multi = new MultipartRequest(request, dir, maxSize, enc, new DefaultFileRenamePolicy());
			
			
			//카페 정보 입력
			CafeService cs = new CafeServiceMybatis();
			CafeVO vo = new CafeVO();
			vo.setMemberId(multi.getParameter("busiId"));
			vo.setCafeAddress(multi.getParameter("cafeAddress"));
			vo.setCafeName(multi.getParameter("cafeName"));
			vo.setCafeTel(multi.getParameter("cafeTel"));
			vo.setLocation(multi.getParameter("location"));
			vo.setCafeHomepage(multi.getParameter("cafeHomepage"));
			vo.setCafeWriting(multi.getParameter("cafeWriting"));
			
			
			System.out.println("=======================================");
			cs.cafeInsert(vo);
			System.out.println("=======================================");
			
			
			//카페 번호 찾기
			System.out.println(vo);		
			CafeVO cafeNum = cs.cafeSearch();
			
			cs.firstRatings(cafeNum.getCafeNum());
			
			//이미저장
			if (multi.getFilesystemName("mainImg") != null) {
				vo.setCafeNum(cafeNum.getCafeNum());
				vo.setCafeimgRoute(multi.getFilesystemName("mainImg"));
				cs.addCafeImg(vo);
			}
			if (multi.getFilesystemName("subImg1") != null) {
				vo.setCafeNum(cafeNum.getCafeNum());
				vo.setCafeimgRoute(multi.getFilesystemName("subImg1"));
				cs.addCafeImg(vo);
			}
			if (multi.getFilesystemName("subImg2") != null) {
				vo.setCafeNum(cafeNum.getCafeNum());
				vo.setCafeimgRoute(multi.getFilesystemName("subImg2"));
				cs.addCafeImg(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/cafeListForm.do";

	}

}
