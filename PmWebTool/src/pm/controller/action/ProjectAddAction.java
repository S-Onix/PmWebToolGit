package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.ProjectDAO;
import pm.dto.MemberVO;
import pm.dto.ProjectVO;

public class ProjectAddAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_form";
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		ProjectDAO projectDao = ProjectDAO.getInstance();
		
		if(loginMember == null) {
			url = "PmServlet?command=index";
		}else {
			String pname = request.getParameter("newName");
			System.out.println(pname);
			ProjectVO newProject = new ProjectVO();
			newProject.setMseq(loginMember.getMseq());
			newProject.setPname(pname);
			
			try {
				projectDao.insertProject(newProject);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		response.sendRedirect(url);
	}
}
