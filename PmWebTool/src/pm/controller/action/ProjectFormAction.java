package pm.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.ProjectDAO;
import pm.dto.MemberVO;
import pm.dto.ProjectVO;

public class ProjectFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/project/project.jsp";

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		}
			try {
				ProjectDAO projectDAO = ProjectDAO.getInstance();
				ArrayList<ProjectVO> projectList = projectDAO.selectLsit(loginUser.getMseq());
				request.setAttribute("projectList", projectList);
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}