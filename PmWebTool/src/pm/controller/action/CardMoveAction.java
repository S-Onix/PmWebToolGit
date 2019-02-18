package pm.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;

import pm.dao.CardDAO;
import pm.dto.CardVO;

public class CardMoveAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<CardVO> cardList = null;
		String data = request.getParameter("data");
		String flag = request.getParameter("flag");

		CardDAO cardDao = CardDAO.getInstance();
		try {
			cardList = jsonParsing(data);
			// next

			for (CardVO card : cardList)
				cardDao.updateCard(card, 3);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*
		 * String url = "PmServlet?command=project_detail_form&pseq=" +
		 * cardList.get(0).getPseq(); System.out.println(url); RequestDispatcher
		 * dispatcher = request.getRequestDispatcher(url); dispatcher.forward(request,
		 * response);
		 */
	}

	// JSON µ•¿Ã≈Õ ∆ƒΩÃ
	public ArrayList<CardVO> jsonParsing(String data) throws ParseException {
		ArrayList<CardVO> list = new ArrayList<>();

		if (data.substring(0, 1).equals("[")) {
			Object objArray = JSONValue.parse(data);
			JSONArray jsonArray = (JSONArray) objArray;

			for (int i = 0; i < jsonArray.size(); i++) {
				JSONObject jObj = (JSONObject) jsonArray.get(i);

				String cseq = (String) jObj.get("cseq");
				String mseq = (String) jObj.get("mseq");
				String pseq = (String) jObj.get("pseq");
				String ctype = (String) jObj.get("ctype");

				CardVO card = new CardVO();
				card.setCseq(Integer.parseInt(cseq));
				card.setPseq(Integer.parseInt(pseq));
				card.setMseq(Integer.parseInt(mseq));
				card.setCtype(Integer.parseInt(ctype));
				card.setCtitle((String) jObj.get("ctitle"));
				list.add(card);
			}
		}

		return list;
	}

}
