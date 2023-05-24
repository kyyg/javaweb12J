package Askboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AskBoardReplyDeleteCommand implements AskBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyIdx = request.getParameter("replyIdx")==null ? 0 : Integer.parseInt(request.getParameter("replyIdx"));
    
    AskBoardDAO dao = new AskBoardDAO();
    String res = dao.setReplyDeleteOk(replyIdx);
    response.getWriter().write(res);
	}

}
