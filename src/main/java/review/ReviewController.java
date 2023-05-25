package review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.rv")
public class ReviewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewInterface command = null;
		String viewPage = "/WEB-INF/review";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if(com.equals("/ReviewList")) {
			command = new ReviewListCommand();
			command.execute(request, response);
			viewPage += "/reviewList.jsp";
		}
		else if(com.equals("/ReviewInput")) {
			command = new ReviewInputCommand();
			command.execute(request, response);
			viewPage += "/reviewInput.jsp";
		}
		else if(com.equals("/ReviewInputOk")) {
			command = new ReviewInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ReviewContent")) {
			command = new ReviewContentCommand();
			command.execute(request, response);
			viewPage += "/reviewContent.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
