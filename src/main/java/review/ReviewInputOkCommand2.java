package review;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;
import exhibition.ExhibitionDAO;
import exhibition.ExhibitionVO;

public class ReviewInputOkCommand2 implements ReviewInterface {

	@SuppressWarnings("rawtypes")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/images");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장할 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드처리.....(객체가 생성되면서 파일이 업로드처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName1 = multipartRequest.getOriginalFileName("fName");  // 업로드 시킬때의 업로드 파일명이다.
		String filesystemName1 = multipartRequest.getFilesystemName("fName");	
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		// 전송된 폼의 값들을 모두 받아준다.
		int reIdx = multipartRequest.getParameter("reIdx")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("reIdx"));
		//String reIdx = multipartRequest.getParameter("reIdx")==null ? "" :multipartRequest.getParameter("reIdx");
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
  		
		
		// 앞에서 전송된 자료와 가공된 자료들을 모두 vo에 담아서 DB에 저장할 수 있게 한다.
		ReviewVO vo = new ReviewVO();
		
		
		ReviewDAO dao = new ReviewDAO();
		int res = dao.setReviewInputOk(mid,reIdx,title,content,pwd,filesystemName1);
		System.out.println("reIdx : " + reIdx);
		
		if(res == 1) {
			request.setAttribute("msg", "리뷰를 등록하였습니다.");
			request.setAttribute("url", request.getContextPath()+"/ReviewList.rv");
		}
		else {
			request.setAttribute("msg", "리뷰 등록에 실패하였습니다.");
			request.setAttribute("url", request.getContextPath()+"/ReviewInput.rv");
		}
	}
}
