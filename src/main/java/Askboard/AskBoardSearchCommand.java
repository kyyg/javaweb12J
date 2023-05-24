package Askboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AskBoardSearchCommand implements AskBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		AskBoardDAO dao = new AskBoardDAO();
		
		ArrayList<AskBoardVO> vos = dao.getBoardContentSearch(search, searchString);
		
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "글제목";
		else if(search.equals("nickName")) searchTitle = "글쓴이";
		else searchTitle = "글내용";
		
		request.setAttribute("vos", vos);
		request.setAttribute("search", search);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("searchString", searchString);
		request.setAttribute("searchCount", vos.size());
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
