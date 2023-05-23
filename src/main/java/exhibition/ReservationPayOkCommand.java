package exhibition;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReservationPayOkCommand implements ExhibitionInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		
		int exIdx = request.getParameter("exIdx")==null ? 0 : Integer.parseInt(request.getParameter("exIdx"));
		String reDate = request.getParameter("reDate")==null ? "" : request.getParameter("reDate");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		int childNum = request.getParameter("childNum")==null ? 0 : Integer.parseInt(request.getParameter("childNum"));
	  int adultNum = request.getParameter("adultNum")==null ? 0 : Integer.parseInt(request.getParameter("adultNum"));
		int totalPrice = request.getParameter("totalPrice")==null ? 0 : Integer.parseInt(request.getParameter("totalPrice"));

		
		
		// 개인 예약번호 
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String strNow = sdf.format(now);

		ExhibitionDAO dao = new ExhibitionDAO();
		ExhibitionVO vo = dao.getReservationContent(exIdx);
		
		int reCnt = vo.getReCnt() + 1;
		String reNum = strNow + "-" + reCnt;
		
		vo.setReCnt(1);
		
		String confirmDate = vo.getEndDate().substring(0,10);

		
		
		ReservationDAO dao2 = new ReservationDAO();
		int res = dao2.setReservation(exIdx,mid,reNum,reDate,childNum,adultNum,totalPrice,reCnt,confirmDate,title);
		
		request.setAttribute("msg", "결제가 완료되었습니다.");
		request.setAttribute("mid", mid);
		request.setAttribute("title", title);
		request.setAttribute("childNum", childNum);
		request.setAttribute("adultNum", adultNum);
		request.setAttribute("totalPrice", totalPrice);
		request.setAttribute("reDate", reDate);
		
		if(res == 1) {
			request.setAttribute("url", request.getContextPath()+"/ReservationComplete.ex");
		}
		else {
			request.setAttribute("msg", "예약에 실패하였습니다. 다시 결제를 진행해 주세요. ");
			request.setAttribute("url", request.getContextPath()+"/ExhibitionList.ex");
		}
		
	}

}
