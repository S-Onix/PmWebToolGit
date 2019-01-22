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
			conn = dataSource.getConnection();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		return members;
	}
	
	
}
