package pm.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardDAO;
import pm.dao.ProjectDAO;
import pm.dto.MemberVO;

public class ProjectDetailFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/project/project_detail.jsp";

		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		CardDAO cardDao = CardDAO.getInstance();
		ProjectDAO projectDao = ProjectDAO.getInstance();
		
		
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		System.out.println(pseq);
		
		if(loginMember == null) {
			url = "PmServlet?command=index";
		}else {
			try {
				request.setAttribute("project", projectDao.selectProjectByPseq(pseq));
				request.setAttribute("cardList", cardDao.cardList(pseq));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
