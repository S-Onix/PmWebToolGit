package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardDAO;
import pm.dto.CardVO;
import pm.dto.MemberVO;

public class CardUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_detail_form&pseq="+ request.getParameter("pseq");
		System.out.println(request.getParameter("cseq"));
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		CardDAO cardDAO = CardDAO.getInstance();
		
		if(loginMember != null) {
			try {
				CardVO card = cardDAO.selectCard(Integer.parseInt(request.getParameter("cseq")));
				card.setCtitle(request.getParameter("newCtitle"));
				cardDAO.updateCard(card, 1);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.sendRedirect(url);
		
		/*RequestDispatcher dispatcher = request.getRequestDispatcher(url);

		dispatcher.forward(request, response);*/
	}
}