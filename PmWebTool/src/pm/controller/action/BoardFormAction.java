package pm.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.BoardDAO;
import pm.dto.MemberVO;
import pm.dto.BoardVO;

public class BoardFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/board/board.jsp";  
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			BoardDAO boardDAO = BoardDAO.getInstance();
			ArrayList<BoardVO> listBoard = boardDAO.listBoard(loginUser.getMid());
			request.setAttribute("listBoard", listBoard);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}