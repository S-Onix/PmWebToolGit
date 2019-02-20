package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBAction;
import pm.dto.CommentVO;

public class CardCommentDAO {
	private static CardCommentDAO instance = new CardCommentDAO();

	public static CardCommentDAO getInstance() {
		return instance;
	}
	
	public ArrayList<CommentVO> selectAll(int cardSeq) throws Exception{
		String sql = "select * from card_comment where cseq = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentVO> list = new ArrayList<>();
		
		try {
		conn = DBAction.getInstance().getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cardSeq);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			CommentVO comment = new CommentVO();
			comment.setC_cseq(rs.getInt(1));
			comment.setCseq(rs.getInt(2));
			comment.setMseq(rs.getInt(3));
			comment.setC_creply(rs.getString(4));
			
			list.add(comment);
		}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		
		
		return list;
	}
	
	public void deleteAllComment(int cseq) throws Exception{
		String sql = "delete from card_comment where cseq = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
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
	
	public void deleteComment(int c_cseq) throws Exception{
		String sql = "delete from card_comment where c_cseq = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_cseq);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
}
