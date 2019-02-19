package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.MemberDAO;
import pm.dto.MemberVO;

public class WithdrawAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=logout";
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			url = "PmServlet?command=login_form";
		} else {
			MemberVO loginMember = new MemberVO();
			loginMember.setMseq(Integer.parseInt(request.getParameter("mseq")));
			loginMember.setUseyn(request.getParameter("useyn"));
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.deleteMember(loginMember);
		}		
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}