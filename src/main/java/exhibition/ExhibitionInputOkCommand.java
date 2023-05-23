package exhibition;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ExhibitionInputOkCommand implements ExhibitionInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/images");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장할 최대용량을 10MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드처리.....(객체가 생성되면서 파일이 업로드처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName1 = multipartRequest.getOriginalFileName("poster");  // 업로드 시킬때의 업로드 파일명이다.
		String filesystemName1 = multipartRequest.getFilesystemName("poster");	
		String originalFileName2 = multipartRequest.getOriginalFileName("content");  
		String filesystemName2 = multipartRequest.getFilesystemName("content");	

		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		// 전송된 폼의 값들을 모두 받아준다.
		int fileSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String author = multipartRequest.getParameter("author")==null ? "" : multipartRequest.getParameter("author");
		String startDate = multipartRequest.getParameter("startDate")==null ? "" : multipartRequest.getParameter("startDate");
		String endDate = multipartRequest.getParameter("endDate")==null ? "" : multipartRequest.getParameter("endDate");
		int adultPrice = multipartRequest.getParameter("adultPrice") ==null? 0 : Integer.parseInt(multipartRequest.getParameter("adultPrice"));
		int childPrice = multipartRequest.getParameter("childPrice") ==null? 0 : Integer.parseInt(multipartRequest.getParameter("childPrice"));
		String place = multipartRequest.getParameter("place")==null ? "" : multipartRequest.getParameter("place");
  		
		
		// 앞에서 전송된 자료와 가공된 자료들을 모두 vo에 담아서 DB에 저장할 수 있게 한다.
		ExhibitionVO vo = new ExhibitionVO();
		vo.setTitle(title);
		vo.setAuthor(author);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setAdultPrice(adultPrice);
		vo.setChildPrice(childPrice);
		vo.setPlace(place);
		vo.setPoster(filesystemName1);
		vo.setContent(filesystemName2);
		
		
		ExhibitionDAO dao = new ExhibitionDAO();
		int res = dao.setExhibitionInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "전시 등록에 성공하였습니다.");
			request.setAttribute("url", request.getContextPath()+"/ExhibitionList.ex");
		}
		else {
			request.setAttribute("msg", "전시 등록에 실패하였습니다.");
			request.setAttribute("url", request.getContextPath()+"/ExhibitionInput.ex");
		}
	}
	}


