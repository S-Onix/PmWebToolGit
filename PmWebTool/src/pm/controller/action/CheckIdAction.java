package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.MemberDAO;

public class CheckIdAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=change_pw_form";
		int exitId = 0;
		MemberDAO memberDao = MemberDAO.getInstance();
		String id = request.getParameter("id");
		try {
			if(memberDao.getMember(request.getParameter("id")) != null) {
				System.out.println(id + "�� ������ ��й�ȣ�� �Է����ּ���");
				exitId = 1;
				request.setAttribute("id", request.getParameter("id"));
				request.setAttribute("exitId", exitId);
			}else {
				System.out.println("�������� �ʴ� ���̵��Դϴ�");
				request.setAttribute("exitId", exitId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request,response);	
	}
}