package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminReservationConfirmChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String confirm = request.getParameter("confirm")==null ? "" : request.getParameter("confirm");
		
		AdminDAO dao = new AdminDAO();
		
		String res = dao.setReservationConfirmChange(mid, confirm);
		
		response.getWriter().write(res);
		
	}

}
