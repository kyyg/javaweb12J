package Askboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AskBoardInputOkCommand implements AskBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
		
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String openSw = request.getParameter("openSw")==null ? "" : request.getParameter("openSw");
		
		AskBoardVO vo = new AskBoardVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setOpenSw(openSw);
		
		AskBoardDAO dao = new AskBoardDAO();
		
		int res = dao.setBoardInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "게시글이 등록되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/AskBoardList.ask");
		}
		else {
			request.setAttribute("msg", "게시글이 등록에 실패하였습니다.");
			request.setAttribute("url", request.getContextPath()+"/AskBoardInput.ask");
		}
	}

}
