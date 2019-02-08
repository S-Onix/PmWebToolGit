package pm.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.MemberDAO;
import pm.dto.MemberVO;

public class ProfileUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=profile_form";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			MemberVO loginMember = new MemberVO();
			loginMember.setMseq(Integer.parseInt(request.getParameter("mseq")));
			loginMember.setMid(request.getParameter("mid"));
			loginMember.setEmail(request.getParameter("email"));
			loginMember.setMname(request.getParameter("mname"));
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.updateMember(loginMember);
			session.setAttribute("loginMember", loginMember);
			System.out.println(request.getParameter("mname") + "/" + request.getParameter("email"));
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}