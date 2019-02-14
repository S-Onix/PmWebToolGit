package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.MemberDAO;
import pm.dto.MemberVO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/login_fail.jsp";
		HttpSession session = request.getSession();
		String id = request.getParameter("mid");
		String pw = request.getParameter("password");
		String useyn = "y";
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO memberVO = null;
		try {
			memberVO = memberDAO.getMember(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (memberVO != null) {
			if (memberVO.getPassword().equals(pw) && memberVO.getUseyn().equals(useyn)) {
				session.removeAttribute("mid");
				session.setAttribute("loginUser", memberVO);
				url = "PmServlet?command=project_form";
				System.out.println(id + "님 환영합니다");
			}
		}

		request.getRequestDispatcher(url).forward(request, response);
	}
}