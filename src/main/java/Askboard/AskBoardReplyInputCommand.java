package Askboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AskBoardReplyInputCommand implements AskBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardIdx = request.getParameter("boardIdx")==null ? 0 : Integer.parseInt(request.getParameter("boardIdx"));
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		AskBoardReplyVO replyVo = new AskBoardReplyVO();
		
		replyVo.setAskBoardIdx(boardIdx);
		replyVo.setMid(mid);
		replyVo.setNickName(nickName);
		replyVo.setContent(content);
		
		AskBoardDAO dao = new AskBoardDAO();
		
		String res = dao.setReplyInputOk(replyVo);
		
		response.getWriter().write(res);
	}

}
