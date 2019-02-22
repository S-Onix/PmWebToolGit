package pm.controller.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import pm.dao.CardDAO;
import pm.dto.CardVO;
import pm.dto.MemberVO;

public class CardUpdateAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "PmServlet?command=project_detail_form&pseq=" + request.getParameter("pseq");
		System.out.println(request.getParameter("cseq"));
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginUser");
		CardDAO cardDAO = CardDAO.getInstance();

		if (loginMember != null) {
			try {
					CardVO card = jsonParseing(request.getParameter("data"));
					cardDAO.updateCard(card, 2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.getWriter().print("success");

	/*	response.sendRedirect(url);

		
		 * RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		 * 
		 * dispatcher.forward(request, response);
		 */
	}
	
	public CardVO jsonParseing(String data) throws ParseException{
		CardVO card = null;
		
		if(data.substring(0, 1).equals("{")) {
			Object obj = JSONValue.parse(data);
			JSONObject jObj = (JSONObject) obj;
			
			if(jObj.get("cseq") != null || jObj.get("mseq") != null || jObj.get("pseq") != null) {
				card = new CardVO();
				card.setCseq(Integer.parseInt((String) jObj.get("cseq")));
				card.setMseq(Integer.parseInt((String) jObj.get("mseq")));
				card.setPseq(Integer.parseInt((String) jObj.get("pseq")));
				card.setCtitle((String) jObj.get("ctitle"));
				card.setDueDate(Timestamp.valueOf((String) jObj.get("dueDate")));
				
				return card;
			}
			
		}
		
		return card;
	}
	
	
}