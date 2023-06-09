package review;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exhibition.ReservationDAO;
import exhibition.ReservationVO;

public class ReviewListCommand implements ReviewInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewDAO dao = new ReviewDAO();
		
		// 페이징처리...
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.getTotRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1 ;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 블록페이징처리....
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		// 지정된 페이지의 자료를 요청한 한페이지 분량만큼 가져온다. 
		
		// 페이지에 리뷰 자료 + 예약한 자료에 대해서도 같이 써야함.
		// 예약한 자료는 리뷰에 속한 reIdx를 가져와서 자료를 가져와야함.
		ArrayList<ReviewVO> vos = dao.getReviewList(startIndexNo, pageSize);
		

		 ReservationDAO dao2 = new ReservationDAO(); 
		 		  
		 
		 ReservationVO vo2 = new ReservationVO();
		 for(int i=0; i<vos.size(); i++) {
			 vo2 = dao2.getReservationInfo(vos.get(i).getReIdx());
		 } 		
		 
		 
		
		request.setAttribute("vos", vos);
		request.setAttribute("vo2", vo2);
		
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
	}

}
