package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBAction;
import pm.dto.BoardVO;
import pm.dto.MemberVO;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	public void insertBoard(BoardVO boardVO, String key) {// 게시물 작성
		String sql = "insert into board (subject, content, mid) values(?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVO.getSubject());
			pstmt.setString(2, boardVO.getContent());
			pstmt.setString(3, key);
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


	public BoardVO getBoard(int bseq) {//board_view
		BoardVO boardVO = null;
		String sql = "select * from board where bseq=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				boardVO = new BoardVO();
				boardVO.setBseq(bseq);
				boardVO.setMid(rs.getString("mid"));
				boardVO.setSubject(rs.getString("subject"));
				boardVO.setContent(rs.getString("content"));
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

	public void deleteBoard(int bseq) {//게시물 삭제
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

	public void updateBoard(BoardVO board) {
		String sql = "update board set subject = ?, content = ? where bseq = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBseq());
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

	static int view_rows = 5; // 페이지 개수
	static int counts = 5; // 한 페이지에 나타낼 상품의 개수
	
	public String pageNumber(int tpage, String key) {
		String str = "";
		int total_pages = totalRecord(key);
		int page_count = total_pages / counts + 1;
		if (total_pages % counts == 0) {
			page_count--;
		}
		if (tpage < 1) {
			tpage = 1;
		}
		int start_page = tpage - (tpage % view_rows) + 1;
		int end_page = start_page + (counts - 1);
		if (end_page > page_count) {
			end_page = page_count;
		}
		if (start_page > view_rows) {
			str += "<a href='PmServlet?command=board_form&page=1&key=" + key + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='PmServlet?command=board_form&tpage=" + (start_page - 1);
			str += "&key=<%=mid%>'>&lt;</a>&nbsp;&nbsp;";
		}
		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='PmServlet?command=board_form&tpage=" + i + "&key=" + key + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}
		if (page_count > end_page) {
			str += "<a href='PmServlet?command=board_form&tpage=" + (end_page + 1) + "&key=" + key + "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='PmServlet?command=board_form&tpage=" + page_count + "&key=" + key + "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

	public int totalRecord(String key) { // 전체 게시글
		int total_pages = 0;
		String sql = "select count(*) from board where mid like '%" + key + "%'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet pageset = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pageset = pstmt.executeQuery();
			if (pageset.next()) {
				total_pages = pageset.getInt(1);// 레코드의 개수
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pageset != null)
					pageset.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return total_pages;
	}

	public ArrayList<BoardVO> listBoard(int tpage, String key) {
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		String str = "select * from board where mid like '%" + key + "%' order by bseq desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int absolutepage = 1;// 커서 절대지정
		try {
			conn = DBAction.getInstance().getConnection();
			absolutepage = (tpage - 1) * counts + 1;
			pstmt = conn.prepareStatement(str, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rs.absolute(absolutepage);
				int count = 0;
				while (count < counts) {
					BoardVO board = new BoardVO();
					board.setBseq(rs.getInt(1));
					board.setSubject(rs.getString(2));
					board.setContent(rs.getString(3));
					board.setReply(rs.getString(4));
					board.setMid(rs.getString(5));
					board.setRep(rs.getString(6));
					board.setIndate(rs.getTimestamp(7));
					boardList.add(board);
					if (rs.isLast()) {
						break;
					}
					rs.next();
					count++;
				}
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
		return boardList;
	}
	
	public String profilepageNumber(MemberVO member, int tpage) {
		String str = "";
		int total_pages = profiletotalRecord(member);
		int page_count = total_pages / counts + 1;
		if (total_pages % counts == 0) {
			page_count--;
		}
		if (tpage < 1) {
			tpage = 1;
		}
		int start_page = tpage - (tpage % view_rows) + 1;
		int end_page = start_page + (counts - 1);
		if (end_page > page_count) {
			end_page = page_count;
		}
		if (start_page > view_rows) {
			str += "<a href='PmServlet?command=profile_form&page=1>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='PmServlet?command=profile_form&tpage=" + (start_page - 1);
			str += "'>&lt;</a>&nbsp;&nbsp;";
		}
		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='PmServlet?command=profile_form&tpage=" + i + "' >[" + i + "]</a>&nbsp;&nbsp;";
			}
		}
		if (page_count > end_page) {
			str += "<a href='PmServlet?command=profile_form&tpage=" + (end_page + 1) + "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='PmServlet?command=profile_form&tpage=" + page_count + "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

	public int profiletotalRecord(MemberVO member) { // 전체 게시글
		int total_pages = 0;
		String sql = "select count(*) from board where mid = '" + member.getMid() + "'";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet pageset = null;
		try {
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pageset = pstmt.executeQuery();
			if (pageset.next()) {
				total_pages = pageset.getInt(1);// 레코드의 개수
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pageset != null)
					pageset.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return total_pages;
	}

	public ArrayList<BoardVO> profileBoard(int tpage, MemberVO member) {
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
		/*String str = "select * from board where mid like '%" + mid + "%' order by bseq desc";*/
		String str = "select * from board where mid = '"+ member.getMid() +"' order by bseq desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int absolutepage = 1;// 커서 절대지정
		try {
			conn = DBAction.getInstance().getConnection();
			absolutepage = (tpage - 1) * counts + 1;
			pstmt = conn.prepareStatement(str, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rs.absolute(absolutepage);
				int count = 0;
				while (count < counts) {
					BoardVO board = new BoardVO();
					board.setBseq(rs.getInt(1));
					board.setSubject(rs.getString(2));
					board.setContent(rs.getString(3));
					board.setReply(rs.getString(4));
					board.setMid(rs.getString(5));
					board.setRep(rs.getString(6));
					board.setIndate(rs.getTimestamp(7));
					boardList.add(board);
					if (rs.isLast()) {
						break;
					}
					rs.next();
					count++;
				}
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
		return boardList;
	}
}