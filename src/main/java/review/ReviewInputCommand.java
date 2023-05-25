package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exhibition.ExhibitionDAO;
import exhibition.ExhibitionVO;
import exhibition.ReservationDAO;
import exhibition.ReservationVO;

public class ReviewInputCommand implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// 예약 번호
		int reIdx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ReservationDAO dao = new ReservationDAO();
		ReservationVO vo = dao.getReservationInfo(reIdx);
		
		// 예약 번호에 대한 리뷰가 이미 있으면 돌려 보내야한다.
		
		request.setAttribute("title", vo.getTitle());
		request.setAttribute("reDate", vo.getReDate());
		request.setAttribute("reIdx", reIdx);
		
		
	}

}
