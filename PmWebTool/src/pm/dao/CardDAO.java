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
			String sql = "select * from card where pseq=? and deleteyn='n'";
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
	
	public void insertCard(CardVO card) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into card(ctitle, pseq, mseq) values(?, ?, ?)";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, card.getCtitle());
			pstmt.setInt(2, card.getPseq());
			pstmt.setInt(3, card.getMseq());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public CardVO selectCard(int cseq) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from card where cseq = ?";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				CardVO card = new CardVO();
				card.setCseq(rs.getInt(1));
				card.setPseq(rs.getInt(2));
				card.setMseq(rs.getInt(3));
				card.setDueDate(rs.getTimestamp(4));
				card.setCtitle(rs.getString(5));
				card.setCtype(rs.getInt(6));
				return card;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return null;
	}
	
	//디테일 추가해야함
	public void updateCard(CardVO card, int flag) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql;
		try {
			conn = DBAction.getInstance().getConnection();
			if(flag == 2) {//카드 내용 변경
				sql = "update card set ctitle= ? , dueDate = ? where cseq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, card.getCtitle());
				pstmt.setTimestamp(2, card.getDueDate());
				pstmt.setInt(3, card.getCseq());
			}else if(flag == 3) {//타입 변경
				sql = "update card set ctype=? where cseq = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, card.getCtype());
				pstmt.setInt(2, card.getCseq());
			}else {
				System.out.println("Error");
				
			}
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public void deleteCard(int cseq) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from card where cseq = ?";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cseq);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public void deleteAllCard(int projectNum) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from card where pseq = ?";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, projectNum);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
}
