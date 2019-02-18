package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.BoardDAO;
import pm.dto.MemberVO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=board_form";
		String[] bseqArr = request.getParameterValues("bseq");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			for (String bseq : bseqArr) {
				BoardDAO boardDAO = BoardDAO.getInstance();
				boardDAO.deleteBoard(Integer.parseInt(bseq));
				System.out.println("삭제 완료");
			}
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}