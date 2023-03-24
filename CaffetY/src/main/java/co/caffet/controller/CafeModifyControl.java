package co.caffet.controller;

import java.io.IOException;
import java.util.List;

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
			vo.setCafeNum(Integer.parseInt(multi.getParameter("cafeNum")));
			vo.setCafeName(multi.getParameter("cafeName"));
			vo.setCafeAddress(multi.getParameter("cafeAddress"));
			vo.setLocation(multi.getParameter("location"));
			vo.setCafeTel(multi.getParameter("cafeTel"));
			vo.setCafeHomepage(multi.getParameter("cafeHomepage"));
			vo.setCafeWriting(multi.getParameter("cafeWriting"));
			// 카페 정보 등록
			cs.modifyCafe(vo);

			// 카페 번호 찾기
			CafeVO imgVo = new CafeVO();
			List<CafeVO> imgList = cs.imgSearch(vo.getCafeNum());
			
			
			for(int i=0 ; i<imgList.size(); i++) {
			 imgVo = imgList.get(i);
			 System.out.println("-------------------------------");
			 System.out.println(imgVo);
			 
			 
			 if (multi.getFilesystemName("img"+i) != null) {
					cs.modifyImgDelete(imgVo.getCafeimgNum());
					
					vo.setCafeNum(imgVo.getCafeNum());
					vo.setCafeimgNum(imgVo.getCafeimgNum());
					vo.setCafeimgRoute(multi.getFilesystemName("img"+i));
					cs.modifyCafeImg(vo);
				}
				
//				
//				if (multi.getFilesystemName("subImg1") != null) {
//					cs.modifyImgDelete(imgVo.getCafeimgNum());
//					
//					vo.setCafeNum(imgVo.getCafeNum());
//					vo.setCafeimgNum(imgVo.getCafeimgNum());
//					vo.setCafeimgRoute(multi.getFilesystemName("subImg1"));
//					cs.modifyCafeImg(vo);
//				}
//				if (multi.getFilesystemName("subImg2") != null) {
//					cs.modifyImgDelete(imgVo.getCafeimgNum());
//					
//					vo.setCafeNum(imgVo.getCafeNum());
//					vo.setCafeimgNum(imgVo.getCafeimgNum());
//					vo.setCafeimgRoute(multi.getFilesystemName("subImg2"));
//					cs.modifyCafeImg(vo);
//				}
			}
			
			
			

			//이미저장
			
			return "cafeInfo.do?cafeNum="+Integer.parseInt(multi.getParameter("cafeNum"));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return "cafeInfo.do";
	}

}
