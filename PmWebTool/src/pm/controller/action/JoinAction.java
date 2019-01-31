package pm.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.MemberDAO;
import pm.dto.MemberVO;

public class JoinAction implements Action {
	/*
	 * @Override public void execute(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { String url =
	 * "/member/login.jsp"; System.out.println("JOIN ACTION CONNECT");
	 * 
	 * MemberVO member = new MemberVO(); member.setMid(request.getParameter("mid"));
	 * member.setPassword(request.getParameter("password"));
	 * member.setMname(request.getParameter("mname"));
	 * member.setEmail(request.getParameter("email"));
	 * 
	 * MemberDAO memberDao = MemberDAO.getInstance();
	 * 
	 * try { // Id 중복X if (memberDao.confirmId(member.getMid()) != 1) {
	 * System.out.println("DB CONNECT // INSERT START");
	 * memberDao.insertMember(member);
	 * System.out.println("DB CONNECT // INSERT END"); } else
	 * System.out.println("아이디 중복 에러");
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * RequestDispatcher dispatcher = request.getRequestDispatcher(url);
	 * dispatcher.forward(request, response); System.out.println("JOIN ACTION OUT");
	 * 
	 * }
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/login.jsp";
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO.setMid(request.getParameter("mid"));
		memberVO.setPassword(request.getParameter("password"));
		memberVO.setMname(request.getParameter("mname"));
		memberVO.setEmail(request.getParameter("email"));
		session.setAttribute("mid", request.getParameter("mid"));
		MemberDAO memberDAO = MemberDAO.getInstance();
		try {
			memberDAO.insertMember(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}