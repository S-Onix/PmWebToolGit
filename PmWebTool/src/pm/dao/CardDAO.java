package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBAction;
import pm.dto.CardVO;

public class CardDAO {
private static CardDAO instance = new CardDAO();
	
	public static CardDAO getInstance() {
		return instance;
	}
	
	public ArrayList<CardVO> cardList(int projectNum) throws Exception{
		ArrayList<CardVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from card where pseq=?";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, projectNum);
			rs = pstmt.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()) {
				CardVO card = new CardVO();
				card.setCseq(rs.getInt(1));
				card.setPseq(rs.getInt(2));
				card.setMseq(rs.getInt(3));
				card.setDueDate(rs.getTimestamp(4));
				card.setCtitle(rs.getString(5));
				card.setCtype(rs.getInt(6));
				card.setCompleteyn(rs.getString(7));
				card.setDeleteyn(rs.getString(8));
				list.add(card);
			}
			
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return null;
	}
	
	
}
