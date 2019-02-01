package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.BoardDAO;
import pm.dto.BoardVO;
import pm.dto.MemberVO;

public class BoardViewFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/board_view.jsp";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			int bseq = Integer.parseInt(request.getParameter("bseq"));
			BoardDAO boardDAO = BoardDAO.getInstance();
			BoardVO boardVO = boardDAO.getBoardvView(bseq);
			request.setAttribute("boardVO", boardVO);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}