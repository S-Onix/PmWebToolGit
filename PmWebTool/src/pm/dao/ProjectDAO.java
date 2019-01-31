package pm.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBAction;
import pm.dto.ProjectVO;

public class ProjectDAO {
	private static ProjectDAO instance = new ProjectDAO();
	
	public static ProjectDAO getInstance() {
		return instance;
	}
	
	/*
	 * 1. ������Ʈ ���� O
	 * 2. ������Ʈ ���� O
	 * 3. ������Ʈ ����
	 * 4. ������Ʈ ����Ʈ �������� O
	 * */
	
	public void insertProject(ProjectVO projectVO) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into project(mseq, pname) values(?,?)";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, projectVO.getMseq());
			pstmt.setString(2, projectVO.getPname());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public void modifyProjectName(int pseq, String pname) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update project set pname = ? where pseq = ?";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setInt(2, pseq);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public ArrayList<ProjectVO> selectLsit(int mseq) throws Exception{
		ArrayList<ProjectVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select p.pseq, p.mseq, p.pname from member m , project p where m.mseq=p.mseq and p.mseq = ? order by p.mseq desc";
			conn = DBAction.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProjectVO project = new ProjectVO();
				project.setPseq(rs.getInt("pseq"));
				project.setMseq(rs.getInt("mseq"));
				project.setPname(rs.getString("pname"));
				list.add(project);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return list;
	}
	
	public void deleteProject(ProjectVO project) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		/*
		 * 1. ī�� ����
		 * 2. ī������� �Ϸ��� ������Ʈ ������ �ؾ���
		 * */
		try {
			
			//ī�� ���� �κ�
			String sql = "delete from card where pseq = ?";
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}
	
}
