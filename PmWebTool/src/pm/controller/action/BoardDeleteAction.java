package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=board_form";
		String[] bseqArr = request.getParameterValues("bseq");
		for (String bseq : bseqArr) {
			BoardDAO boardDAO = BoardDAO.getInstance();
			boardDAO.deleteBoard(Integer.parseInt(bseq));
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}