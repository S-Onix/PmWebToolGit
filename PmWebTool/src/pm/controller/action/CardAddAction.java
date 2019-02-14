package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardDAO;
import pm.dto.CardVO;
import pm.dto.MemberVO;

public class CardAddAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_detail_form&pseq=" + request.getParameter("pseq");
		
		
		HttpSession session = request.getSession();
		CardDAO cardDao = CardDAO.getInstance();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
	
		if(loginMember != null) {
			CardVO cardVO = new CardVO();
			cardVO.setCtitle(request.getParameter("newCTitle"));
			cardVO.setMseq(loginMember.getMseq());
			cardVO.setPseq(Integer.parseInt(request.getParameter("pseq")));
			try {
				cardDao.insertCard(cardVO);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else {
			url = "PmServlet?command=login_form";	
		}
		
		
		response.sendRedirect(url);
	}
}
