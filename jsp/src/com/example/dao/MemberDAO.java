package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.example.dto.MemberVO;

// 데이터베이스 연동에 관련된 기능을 모아놓은 클래스 : DAO (Database Access Object)
public class MemberDAO { // Singleton : 객체가 한개만 생성되도록 허용
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() { return instance; }
	
	//Connection Pool 을 사용해서 Connection 을 획득
	public Connection getConnection() throws Exception { // DBCP
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/studydb");
		conn = ds.getConnection();
		return conn;
	}
	
	public int userCheck(String userid, String pwd) { // 사용자가 인증시 사용하는 메서드
		int result = -1;
		String sql = "select pwd from member where userid=?";
		ResultSet rs = null;
		//try with resource는 () 안의 자원을 try 문이 완료되면 자동으로 close() 가 수행됨
		try (Connection conn = getConnection();
			  PreparedStatement pstmt = conn.prepareStatement(sql);){
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				if(rs.next()) { // 사용자가 존재
					if(rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
						result = 1; // 인증 성공
					} else {
						result = 0; // 비밀번호 불일치
					}
				} else {
					result = -1; // 존재하지 않느 ㄴ아이디
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public MemberVO getMember(String userid) { // 아이디로 회원 정보 가져오는 메소드
		MemberVO mVo = null;
		String sql = "select * from member where userid=?";
		ResultSet rs = null;
		try (Connection conn = getConnection();
				  PreparedStatement pstmt = conn.prepareStatement(sql);){
					pstmt.setString(1, userid);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						mVo = new MemberVO();
						mVo.setName(rs.getString("name"));
						mVo.setUserid(rs.getString("userid"));
						mVo.setPwd(rs.getString("pwd"));
						mVo.setEmail(rs.getString("email"));
						mVo.setPhone(rs.getString("phone"));
						mVo.setGrade(rs.getInt("grade"));
					}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) {
						rs.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return mVo;
	}
	
	public int confirmID(String userid) { // 아이디 중복 검사
		int result = -1;
		String sql = "select userid from member where userid=?";
		ResultSet rs = null;
		try (Connection conn = getConnection();
				  PreparedStatement pstmt = conn.prepareStatement(sql);){
					pstmt.setString(1, userid);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						result = 1; // 존재하는 아이디
					} else {
						result = -1; // 존재하지 않는 아이디
					}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) {
						rs.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		return result;
	}
	
	public int insertMember(MemberVO mVo) { // 회원정보 추가
		int result = -1;
		String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
		try (Connection conn = getConnection();
				  PreparedStatement pstmt = conn.prepareStatement(sql);){
					pstmt.setString(1, mVo.getName());
					pstmt.setString(2, mVo.getUserid());
					pstmt.setString(3, mVo.getPwd());
					pstmt.setString(4, mVo.getEmail());
					pstmt.setString(5, mVo.getPhone());
					pstmt.setInt(6, mVo.getGrade());
					result = pstmt.executeUpdate();
					
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return result;
		
	}
	
	public int updateMember(MemberVO mVo) { // 회원정보 변경
		int result = -1;
		String sql = "update member set pwd=?, email=?, phone=?, grade=? where userid=?"; // 비밀번호, 이메일, 전화번호, 유형 변경
		try (Connection conn = getConnection();
				  PreparedStatement pstmt = conn.prepareStatement(sql);){
					pstmt.setString(1, mVo.getPwd());
					pstmt.setString(2, mVo.getEmail());
					pstmt.setString(3, mVo.getPhone());
					pstmt.setInt(4, mVo.getGrade());
					pstmt.setString(5, mVo.getUserid());
					result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return result;
		
	}	
}
