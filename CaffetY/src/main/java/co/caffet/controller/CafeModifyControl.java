package co.caffet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.caffet.common.Control;
import co.caffet.service.CafeService;
import co.caffet.service.CafeServiceMybatis;
import co.caffet.vo.CafeVO;

public class CafeModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		

		String dir = request.getServletContext().getRealPath("imgupload");

		System.out.println("dir: " + dir);
		int maxSize = 5 * 1024 * 1024;
		String enc = "UTF-8";
		
		try {
			MultipartRequest multi = new MultipartRequest(request, dir, maxSize, enc, new DefaultFileRenamePolicy());
			
			
			CafeService cs = new CafeServiceMybatis();
			CafeVO vo = new CafeVO();
			vo.setCafeNum(Integer.parseInt(request.getParameter("cafeNum")));
			vo.setCafeName(request.getParameter("cafeName"));
			vo.setCafeAddress(request.getParameter("cafeAddress"));
			vo.setLocation(request.getParameter("location"));
			vo.setCafeTel(request.getParameter("cafeTel"));
			vo.setCafeHomepage(request.getParameter("cafeHomepage"));
			vo.setCafeWriting(request.getParameter("cafeWriting"));
			System.out.println(vo);
			
			cs.modifyCafe(vo);
			
			
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
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		//return "cafeInfo.do?cafeNum="+ Integer.parseInt(request.getParameter("cafeNum"));
		return "cafeInfo.do?cafeNum="+Integer.parseInt(request.getParameter("cafeNum"));
	}

}
