package pm.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.BoardDAO;
import pm.dto.BoardVO;
import pm.dto.MemberVO;

public class BoardFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "board/board.jsp";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			ArrayList<BoardVO> listBoard;
			try {
				listBoard = BoardDAO.getInstance().listAllBoard();
				request.setAttribute("listBoard", listBoard);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}

/*
 * @Override public void execute(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException { String url =
 * "/board/board.jsp"; HttpSession session = request.getSession(); MemberVO
 * loginUser = (MemberVO) session.getAttribute("loginUser"); if (loginUser ==
 * null) { url = "PmServlet?command=login_form"; } else { BoardDAO boardDAO =
 * BoardDAO.getInstance(); ArrayList<BoardVO> allBoard =
 * boardDAO.allBoard(loginUser.getMid()); request.setAttribute("allBoard",
 * allBoard); } request.getRequestDispatcher(url).forward(request, response); }
 * }
 */