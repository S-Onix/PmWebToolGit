package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBAction;
import pm.dto.MemberVO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

/*	public int insertMember(MemberVO memberVO) throws Exception {
		int result = -1;
		String sql = "insert into member(mid, mname, email, password)" + " values(?,?,?,?)";
		Connection conn = null;
		conn = DBAction.getInstance().getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMid());
			pstmt.setString(2, memberVO.getMname());
			pstmt.setString(3, memberVO.getEmail());
			pstmt.setString(4, memberVO.getPassword());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}*/
	public int insertMember(MemberVO memberVO) throws Exception {
		int result = -1;
		String sql = "insert into member(mid, password, mname, email)" + " values(?,?,?,?)";
		Connection conn = DBAction.getInstance().getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVO.getMid());
			pstmt.setString(2, memberVO.getPassword());
			pstmt.setString(3, memberVO.getMname());
			pstmt.setString(4, memberVO.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int confirmId(String userId) throws Exception {
		int result = -1;
		String sql = "select * from member where mid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public MemberVO getMember(String id) throws Exception {// LoginAction
		MemberVO memberVO = null;
		String sql = "select * from member where mid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setEmail(rs.getString("mid"));
				memberVO.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return memberVO;
	}
}