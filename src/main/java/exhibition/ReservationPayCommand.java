package exhibition;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

public class ReservationPayCommand implements ExhibitionInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int exIdx = request.getParameter("productIdx")==null ? 0 : Integer.parseInt(request.getParameter("productIdx"));
		String reDate = request.getParameter("reDate")==null ? "" : request.getParameter("reDate");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
	
		int price = request.getParameter("price")==null ? 0 :Integer.parseInt(request.getParameter("price"));
	  int peopleNum = request.getParameter("peopleNum")==null ? 0 :Integer.parseInt(request.getParameter("peopleNum"));
		int totalPrice = request.getParameter("totalPrice")==null ? 0 : Integer.parseInt(request.getParameter("totalPrice"));
						
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		ExhibitionDAO dao2 = new ExhibitionDAO();
		ExhibitionVO vo2 = dao2.getReservationContent(exIdx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("vo2", vo2);
		request.setAttribute("exIdx", exIdx);
		request.setAttribute("reDate", reDate);
		request.setAttribute("title", title);
		request.setAttribute("price", price);
		request.setAttribute("peopleNum", peopleNum);
		request.setAttribute("totalPrice", totalPrice);
		
	}

}
