package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminExhibitionPartChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		
		AdminDAO dao = new AdminDAO();
		
		String res = dao.setExhibitionPartChange(idx, part);
		
		response.getWriter().write(res);
		
	}

}
