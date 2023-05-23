package exhibition;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationListCommand implements ExhibitionInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		ReservationDAO dao = new ReservationDAO();
		
		ArrayList<ReservationVO> vos = dao.getReservationList(mid);
			
		request.setAttribute("vos", vos);
		request.setAttribute("mid", mid);
		
	}

}
