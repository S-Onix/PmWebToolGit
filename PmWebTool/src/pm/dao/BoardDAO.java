package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBAction;
import pm.dto.BoardVO;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public void insertBoard(BoardVO boardVO, String session_id) {
		String sql = "insert into board (subject, content, mid) values(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(session_id);
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVO.getSubject());
			pstmt.setString(2, boardVO.getContent());
			pstmt.setString(3, session_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<BoardVO> listBoard(String id) {
		ArrayList<BoardVO> listBoard = new ArrayList<BoardVO>();
		String sql = "select * from board where mid=? order by bseq desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setBseq(rs.getInt("bseq"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setMid(rs.getString("mid"));
				boardVO.setIndate(rs.getTimestamp("indate"));
				boardVO.setReply(rs.getString("reply"));
				boardVO.setRep(rs.getString("rep"));
				listBoard.add(boardVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listBoard;
	}
	
	public ArrayList<BoardVO> listAllBoard() {
		ArrayList<BoardVO> listBoard = new ArrayList<BoardVO>();
		String sql = "select * from board order by indate asc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setBseq(rs.getInt("bseq"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setMid(rs.getString("mid"));
				boardVO.setIndate(rs.getTimestamp("indate"));
				boardVO.setReply(rs.getString("reply"));
				boardVO.setRep(rs.getString("rep"));
				listBoard.add(boardVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return listBoard;
	}


	public BoardVO getBoard(int seq) {
		BoardVO boardVO = null;
		String sql = "select * from board where bseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardVO = new BoardVO();
				boardVO.setBseq(seq);
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setMid(rs.getString("mid"));
				boardVO.setIndate(rs.getTimestamp("indate"));
				boardVO.setReply(rs.getString("reply"));
				boardVO.setRep(rs.getString("rep"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return boardVO;
	}

	public void deleteBoard(int bseq) {
		String sql = "delete from board where bseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public BoardVO getBoardDetail(String bseq) {
		BoardVO boardVO = new BoardVO();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where bseq =?";
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bseq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardVO.setBseq(rs.getInt("bseq"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReply(rs.getString("reply"));
				boardVO.setMid(rs.getString("mid"));
				boardVO.setRep(rs.getString("rep"));
				boardVO.setIndate(rs.getTimestamp("indate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return boardVO;
	}


	public void updateBoard(BoardVO boardVO) {
		String sql = "update board set reply=?, rep='2' where bseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVO.getReply());
			pstmt.setInt(2, boardVO.getBseq());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<BoardVO> getList() {
		ArrayList<BoardVO> allBoard = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board order by bseq desc";

		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO boardVO = new BoardVO();
				boardVO.setBseq(rs.getInt("bseq"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
				boardVO.setReply(rs.getString("reply"));
				boardVO.setMid(rs.getString("mid"));
				boardVO.setRep(rs.getString("rep"));
				boardVO.setIndate(rs.getTimestamp("indate"));
				allBoard.add(boardVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return allBoard;
	}

	public void setBoardReply(BoardVO boardVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set reply=?, rep='2' where bseq=?";

		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVO.getReply());
			pstmt.setInt(2, boardVO.getBseq());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
	}
}