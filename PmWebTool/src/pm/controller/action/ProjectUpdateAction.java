package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.ProjectDAO;
import pm.dto.MemberVO;
import pm.dto.ProjectVO;

public class ProjectUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_detail_form&pseq=" + request.getParameter("pseq");
		
		HttpSession session = request.getSession();
		ProjectDAO projectDao = ProjectDAO.getInstance();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			ProjectVO projectVO = new ProjectVO();
			projectVO.setPseq(Integer.parseInt(request.getParameter("pseq")));
			projectVO.setPname(request.getParameter("newPname"));
			try {
				projectDao.modifyProjectName(projectVO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			url = "PmServlet?command=login_form";
		}
		
		response.sendRedirect(url);
		
	}
}
