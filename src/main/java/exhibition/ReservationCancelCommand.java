package exhibition;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationCancelCommand implements ExhibitionInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int idx = request.getParameter("idx") == null ? 0  : Integer.parseInt(request.getParameter("idx"));
		
		ReservationDAO dao = new ReservationDAO();
		
		String res = dao.setReservationCalcel(idx);
		
		response.getWriter().write(res);
		
	}

}
