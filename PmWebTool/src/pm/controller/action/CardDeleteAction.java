package pm.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardDAO;
import pm.dto.CardVO;
import pm.dto.MemberVO;

public class CardDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] cardSeq = request.getParameterValues("deleteCardList");
		int[] intCardSeq = new int[cardSeq.length];

		HttpSession session = request.getSession();
		CardDAO cardDao = CardDAO.getInstance();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");

		for (int i = 0; i < cardSeq.length; i++) {
			intCardSeq[i] = Integer.parseInt(cardSeq[i]);
		}

		if (loginMember != null) {
			for (int cseq : intCardSeq) {
				try {
					cardDao.deleteCard(cseq);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}
}
