package pm.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.MemberDAO;

public class ChangePwFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/change_pw.jsp";
		String id = request.getParameter("mid").trim();
		MemberDAO memberDAO = MemberDAO.getInstance();
		try {
			request.setAttribute("message", memberDAO.confirmId(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("mid", id);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}