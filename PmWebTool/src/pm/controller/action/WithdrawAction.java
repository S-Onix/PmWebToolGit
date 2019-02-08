package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.MemberDAO;

public class WithdrawAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=index";
		String[] mseqArr = request.getParameterValues("mseq");
		for (String mseq : mseqArr) {
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.deleteMember(Integer.parseInt(mseq));
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}