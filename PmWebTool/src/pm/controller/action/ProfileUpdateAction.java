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
		String name = request.getParameter("mname");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			MemberVO loginMember = new MemberVO();
			loginMember.setMseq(Integer.parseInt(request.getParameter("mseq")));
			loginMember.setMid(request.getParameter("mid"));
			loginMember.setMname(request.getParameter("mname"));
			loginMember.setEmail(request.getParameter("email"));
			System.out.println("이름 : " + name + " 이메일 : " + email);
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.updateMember(loginMember);
			session.setAttribute("loginUser", loginMember);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}