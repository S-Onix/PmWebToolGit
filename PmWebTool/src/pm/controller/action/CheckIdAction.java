package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.MemberDAO;

public class CheckIdAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "PmServlet?command=change_pw_form";
		int exitId = 0;
		System.out.println("들어옴");
		MemberDAO memberDao = MemberDAO.getInstance();
		try {
			if(memberDao.getMember(request.getParameter("id")) != null) {
				System.out.println("아이디 있다");
				exitId = 1;
				request.setAttribute("id", request.getParameter("id"));
				request.setAttribute("exitId", exitId);
			}else {
				System.out.println("아이디 없다");
				request.setAttribute("exitId", exitId);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request,response);
		
		
	}

}
