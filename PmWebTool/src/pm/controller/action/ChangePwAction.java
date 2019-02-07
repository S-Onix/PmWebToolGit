package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.MemberDAO;
import pm.dto.MemberVO;

public class ChangePwAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=login_form";

			MemberDAO memberDAO = MemberDAO.getInstance();
			try {
				MemberVO memberVO = memberDAO.getMember(request.getParameter("id"));
				memberVO.setPassword(request.getParameter("password"));
				memberDAO.changePw(memberVO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request,response);
	}
}