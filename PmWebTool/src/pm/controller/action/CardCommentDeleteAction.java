package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pm.dao.CardCommentDAO;

public class CardCommentDeleteAction implements Action{
 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String c_cseq = request.getParameter("c_cseq");
		CardCommentDAO commentDao = CardCommentDAO.getInstance();
		
		try {
			commentDao.deleteComment(Integer.parseInt(c_cseq));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
