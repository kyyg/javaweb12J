package review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exhibition.ReservationDAO;
import exhibition.ReservationVO;

public class ReviewContentCommand implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		int pag = request.getParameter("pag")==null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		
		ReviewDAO dao = new ReviewDAO();

		// 현재 선택된 게시글(idx)의 전체내용물을 가져오기
		ReviewVO vo = dao.getReviewContent(idx);
		
		ReservationDAO dao2 = new ReservationDAO();
		ReservationVO vo2 = dao2.getReservationInfo(vo.getReIdx());
		
		request.setAttribute("vo", vo);
		request.setAttribute("vo2", vo2);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);


		
	}
}
