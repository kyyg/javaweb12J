package Askboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AskBoGoodPlusMinusCommand implements AskBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int goodCnt = Integer.parseInt(request.getParameter("goodCnt"));
		
		AskBoardDAO dao = new AskBoardDAO();
		
		dao.setGoodPlusMinus(idx, goodCnt);
		
	}

}
