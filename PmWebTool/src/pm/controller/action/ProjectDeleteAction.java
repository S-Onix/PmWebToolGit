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

public class ProjectDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_form";

		int pseq = Integer.parseInt(request.getParameter("pseq"));
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		CardDAO cardDao = CardDAO.getInstance();
		ProjectDAO projectDao = ProjectDAO.getInstance();
		
		
		if(loginMember != null) {
			try {
				cardDao.deleteAllCard(pseq);
				projectDao.deleteProject(pseq);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			url = "PmServlet?command=login";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
