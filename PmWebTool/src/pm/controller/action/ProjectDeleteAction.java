package pm.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardCommentDAO;
import pm.dao.CardDAO;
import pm.dao.ProjectDAO;
import pm.dto.MemberVO;

public class ProjectDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_form";

		int pseq = Integer.parseInt(request.getParameter("pseq"));
		System.out.println("pseq : " + pseq);
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		CardDAO cardDao = CardDAO.getInstance();
		CardCommentDAO commentDao = CardCommentDAO.getInstance();
		ProjectDAO projectDao = ProjectDAO.getInstance();
		
		
		if(loginMember != null) {
			try {
				ArrayList<Integer> cseqList = cardDao.selectAllCseq(pseq);
				for(Integer cseq : cseqList) {
					commentDao.deleteAllComment(cseq);
				}
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
