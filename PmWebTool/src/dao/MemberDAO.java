package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.MemberVO;

public class MemberDAO {
	
	
	DataSource dataSource;
	
	//��ü ���� �ʿ���
	public MemberDAO(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	/*
	 * CRUD �ʿ�
	 * ��� ����
	 * ��� �б�
	 * ��� ������Ʈ
	 * ��� ����
	 * */
	
	public int insert(MemberVO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		try {
			String sql = "INSERT INTO MEMBER() VALUES()";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			// �ʿ��� ������ �־������
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public ArrayList<MemberVO> selectByTeam(int tseq){
		ArrayList members = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * from project_detail where tseq = ?";
			conn = dataSource.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, tseq);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO member = new MemberVO();
				
				members.add(member);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return members;
	}
	
	public int updateMemImage(String img, MemberVO member) {
		int result = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update member set ming = ? where mseq = ?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, img);
			pstmt.setInt(2, member.getMseq());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
