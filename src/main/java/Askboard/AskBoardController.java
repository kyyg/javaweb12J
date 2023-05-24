package Askboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ask")
public class AskBoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AskBoardInterface command = null;
		String viewPage = "/WEB-INF/askBoard";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));

		if(com.equals("/AskBoardList")) {
			command = new AskBoardListCommand();
			command.execute(request, response);
			viewPage += "/askBoardList.jsp";
		}
		else if(com.equals("/AskBoardInput")) {
			viewPage += "/askBoardInput.jsp";
		}
		else if(com.equals("/AskBoardInputOk")) {
			command = new AskBoardInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AskBoardContent")) {
			command = new AskBoardContentCommand();
			command.execute(request, response);
			viewPage += "/askBoardContent.jsp";
		}
		else if(com.equals("/AskBoardGoodCheckAjax")) {
			command = new AskBoardGoodCheckAjaxCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AskBoardGoodPlusMinus")) {
			command = new AskBoGoodPlusMinusCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AskBoardSearch")) {
			command = new AskBoardSearchCommand();
			command.execute(request, response);
			viewPage += "/askBoardSearch.jsp";
		}
		else if(com.equals("/BoardDelete")) {
			command = new AskBoardDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AskBoardUpdate")) {
			command = new AskBoardUpdateCommand();
			command.execute(request, response);
			viewPage += "/askBoardUpdate.jsp";
		}
		else if(com.equals("/AskBoardUpdateOk")) {
			command = new AskBoardUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AskBoardReplyInput")) {
			command = new AskBoardReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AskBoardReplyDelete")) {
			command = new AskBoardReplyDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/AskBoardSearchMember")) {
			command = new AskBoardSearchMemberCommand();
			command.execute(request, response);
			viewPage += "/askBoardSearchMember.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
