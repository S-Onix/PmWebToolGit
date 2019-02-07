package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.BoardDAO;
import pm.dto.BoardVO;
import pm.dto.MemberVO;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=board_form";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			BoardVO boardVO = new BoardVO();
			boardVO.setBseq(Integer.parseInt(request.getParameter("bseq")));
			boardVO.setSubject(request.getParameter("subject"));
			boardVO.setContent(request.getParameter("content"));
			BoardDAO boardDAO = BoardDAO.getInstance();
			System.out.println(request.getParameter("bseq") + " " + request.getParameter("subject") + " " + request.getParameter("content"));
			boardDAO.updateBoard(boardVO);

		}

/*		response.sendRedirect(url);
		*/
		request.getRequestDispatcher(url).forward(request, response);
	}
}
