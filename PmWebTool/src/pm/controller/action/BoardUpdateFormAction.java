package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.BoardDAO;
import pm.dto.BoardVO;
import pm.dto.MemberVO;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/board_update.jsp";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    int bseq =  Integer.parseInt(request.getParameter("bseq"));
		String tpage =  request.getParameter("tpage");
		String key = request.getParameter("key");

		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			/*int bseq = Integer.parseInt(request.getParameter("bseq"));*/
			BoardDAO boardDAO = BoardDAO.getInstance();
			BoardVO boardVO = boardDAO.getBoard(bseq);
			request.setAttribute("boardVO", boardVO);
			request.setAttribute("checkId", loginUser.getMid());
			request.setAttribute("tpage", tpage);
			request.setAttribute("key", key);
			System.out.println("게시물 번호 : " + bseq + " 페이지 : " + tpage);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}