package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.MemberDAO;
import pm.dto.MemberVO;

public class ChangePwAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=login_form";
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		
			MemberDAO memberDAO = MemberDAO.getInstance();
			try {
				MemberVO memberVO = memberDAO.getMember(request.getParameter("id"));
				memberVO.setPassword(request.getParameter("password"));
				memberDAO.changePw(memberVO);
				System.out.println(id + "님의 비밀번호가 " + pw + "로 변경되었습니다");
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request,response);
	}
}