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

public class ProfileFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/profile/profile.jsp";
		String tpage = request.getParameter("tpage");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (tpage == null) {
			tpage = "1";
		} else if (tpage.equals("")) {
			tpage = "1";
		}
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			try {
				BoardDAO boardDAO = BoardDAO.getInstance();
				ArrayList<BoardVO> boardList = boardDAO.profileBoard(Integer.parseInt(tpage), loginUser);
				String paging = boardDAO.profilepageNumber(loginUser, Integer.parseInt(tpage));
				request.setAttribute("profileBoard", boardList);
				int n = boardList.size();
				request.setAttribute("boardListSize", n);
				request.setAttribute("paging", paging);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("mid", loginUser.getMid());
			request.setAttribute("tpage", tpage);	
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}