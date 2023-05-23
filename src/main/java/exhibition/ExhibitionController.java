package exhibition;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ex")
public class ExhibitionController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ExhibitionInterface command = null;
		String viewPage = "/WEB-INF/exhibition";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));{

		if(com.equals("/ExhibitionList")) {
			command = new ExhibitionListCommand();
			command.execute(request, response);
			viewPage += "/exhibitionList.jsp";
		}
		else if(com.equals("/ExhibitionInput")) {
			viewPage += "/exhibitionInput.jsp";
		}
		else if(com.equals("/ExhibitionInputOk")) {
			command = new ExhibitionInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ReservationContent")) {
			command = new ReservationContentCommand();
			command.execute(request, response);
			viewPage += "/reservationContent.jsp";
		}
		else if(com.equals("/ReservationPay")) {
			command = new ReservationPayCommand();
			command.execute(request, response);
			viewPage += "/reservationPay.jsp";
		}
		else if(com.equals("/ReservationPayOk")) {
			command = new ReservationPayOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/ReservationComplete")) {
			viewPage += "/reservationComplete.jsp";
		}
		else if(com.equals("/ReservationList")) {
			command = new ReservationListCommand();
			command.execute(request, response);
			viewPage += "/reservationList.jsp";
		}
		else if(com.equals("/ReservationCancel")) {
			command = new ReservationCancelCommand();
			command.execute(request, response);
			return;
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		}
	}
}
