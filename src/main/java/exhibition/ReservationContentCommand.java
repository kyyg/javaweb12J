package exhibition;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationContentCommand implements ExhibitionInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
				
		ExhibitionDAO dao = new ExhibitionDAO();
		
		ExhibitionVO vo = dao.getReservationContent(idx);
		
		
		request.setAttribute("vo", vo);
	
		
	}

}
