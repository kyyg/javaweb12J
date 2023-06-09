package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminReservationConfirmChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		int idx = request.getParameter("idx")== null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String confirm = request.getParameter("confirm")==null ? "" : request.getParameter("confirm");
		
		AdminDAO dao = new AdminDAO();
		
		String res = dao.setReservationConfirmChange(idx, confirm);
		
		response.getWriter().write(res);
		
	}

}
