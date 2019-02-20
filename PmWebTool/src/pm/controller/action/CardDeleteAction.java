package pm.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardCommentDAO;
import pm.dao.CardDAO;
import pm.dto.CardVO;
import pm.dto.MemberVO;

public class CardDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CardDAO cardDao = CardDAO.getInstance();
		CardCommentDAO commentDAO = CardCommentDAO.getInstance();
		
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		String[] cardSeq = request.getParameterValues("deleteCardList");
		if (cardSeq != null) {
			int[] intCardSeq = new int[cardSeq.length];
			
			for (int i = 0; i < cardSeq.length; i++) {
				intCardSeq[i] = Integer.parseInt(cardSeq[i]);
			}

			if (loginMember != null) {
				for (int cseq : intCardSeq) {
					try {
						commentDAO.deleteAllComment(cseq);
						cardDao.deleteCard(cseq);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
		}else {
			
		}
	}
}
