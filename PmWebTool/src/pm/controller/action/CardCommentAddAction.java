package pm.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pm.dao.CardCommentDAO;
import pm.dto.CommentVO;
import pm.dto.MemberVO;

public class CardCommentAddAction implements Action{
 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cseq = request.getParameter("cseq");
		String c_creply = request.getParameter("c_creply");
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		
		CardCommentDAO commentDAO = CardCommentDAO.getInstance();
		CommentVO commentVO = new CommentVO();
		commentVO.setCseq(Integer.parseInt(cseq));
		commentVO.setMseq(loginMember.getMseq());
		commentVO.setC_creply(c_creply);
		
		try {
			commentDAO.insert(commentVO);
			response.getWriter().print(commentDAO.selectLastData());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
