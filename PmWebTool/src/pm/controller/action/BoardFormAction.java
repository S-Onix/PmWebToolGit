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
		String url = "/board/board.jsp";
		String key = request.getParameter("key");
		String tpage = request.getParameter("tpage");
		if (key == null) {
			key = "";
		}
		if (tpage == null) {
			tpage = "1";
		} else if (tpage.equals("")) {
			tpage = "1";
		}
		request.setAttribute("key", key);
		request.setAttribute("tpage", tpage);
		ArrayList<BoardVO> listBoard = null;
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			try {
				if (!key.equals("")) {
					listBoard = BoardDAO.getInstance().listMidBoard(key);
				} else {
					listBoard = BoardDAO.getInstance().listAllBoard();
				}
				BoardDAO boardDAO = BoardDAO.getInstance();
				ArrayList<BoardVO> boardList = boardDAO.listBoard(Integer.parseInt(tpage), key); //
				String paging = boardDAO.pageNumber(Integer.parseInt(tpage), key);
				request.setAttribute("listBoard", listBoard);
				int n = boardList.size();
				request.setAttribute("boardListSize", n);
				request.setAttribute("paging", paging);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}