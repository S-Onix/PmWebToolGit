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
		String url = "PmServlet?command=login";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
		MemberVO memberVO = new MemberVO();
		memberVO.setMseq(Integer.parseInt(request.getParameter("mseq")));
		memberVO.setPassword(request.getParameter("passowrd"));
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.changePw(memberVO);
		}
	request.getRequestDispatcher(url).forward(request,response);
	}
}