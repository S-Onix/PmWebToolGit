package pm.controller.action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import pm.dao.CardCommentDAO;
import pm.dto.CommentVO;

public class CardCommentListAction implements Action{
 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CardCommentDAO cardCommentDAO = CardCommentDAO.getInstance();
		String cseq = request.getParameter("cardSeq");
		
		try {
			ArrayList<CommentVO> list = cardCommentDAO.selectAll(Integer.parseInt(cseq));
			String jsonString = commentJsonParsing(list);
			String a =  URLEncoder.encode(jsonString, "UTF-8");
			System.out.println("JSON 문자열 : " + jsonString);
			System.out.println("인코딩된 문자열 : " + a );
			response.getWriter().print(a);
			} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public String commentJsonParsing(ArrayList<CommentVO> list) {
		
		JSONArray jsonArray = new JSONArray();
		for(CommentVO comment : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put(Integer.toString(comment.getC_cseq()), comment.getC_creply());
			jsonArray.add(jsonObject);
		}
		
		System.out.println(jsonArray.toJSONString());
		return jsonArray.toJSONString();
	}
	
}
