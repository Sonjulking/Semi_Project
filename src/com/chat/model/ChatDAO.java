package com.chat.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ChatDAO {
	// DB와 연동하는 객체.
	Connection con = null;
	
	// DB에 SQL문을 전송하는 객체.
	PreparedStatement pstmt = null;
	
	// SQL문을 실행한 후에 결과값을 가지고 있는 객체.
	ResultSet rs = null;
	
	// 쿼리문을 저장할 객체.
	String sql = null;
	
	// BoardDAO 클래스를 싱클턴 방식으로 만들어 보자.
	// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로 기본생성자의 접근제어자를 public이 아니라 private으로 바꾸어 주저야 한다.
	// 		   즉, 외부에서는 직접적으로 기본생성자를 호출하지 못하게 하는 방식이다.
	
	// 2단계 : BoardDAO 클래스의 정적(static) 멤버로 선언을 해 주어야 한다.
	private static ChatDAO instance;
	
	private ChatDAO() {
	}	// 기본생성자
	
	// 3단계 : 기본생성자 대신에 싱그턴 객체를 return 해 주는
	//		 getInstance() 메서드를 만들어서 해당 getInstance() 메서드를 외부에서 접근할 수 있도록 해 주면 됨.
	public static ChatDAO getInstance() {
		if(instance == null) {
			instance = new ChatDAO();
		}
		
		return instance;
	}
	// getInstance() end
	
	// openConn() start
	// JDBC 방식이 아닌 DBCP 방식으로 DB와 연동 작업 진행
	public void openConn() {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://kangchan.cf0np4g5gjsu.ap-northeast-2.rds.amazonaws.com:3306/semiProject";
		String user = "admin";
		String password = "rhrkdcks1997*";

		try {
			// 1단계 : 오라클 드라이버를 메모리로 로딩 작업 진행.
			Class.forName(driver);

			// 2단계 : 오라클 데이터베이스와 연결 작업 진행.
			con = DriverManager.getConnection(url, user, password);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// openConn() end
			
	// DB에 연결되어 있던 자원 종료하는 메서드.
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {

		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(con != null)
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// closeConn() end
	
	
	public int insertMessage(String message, String nickname, String message_time) {
		int res = 0, count = 0;
		
		try {
			openConn();
			
			sql ="SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = 'chat_room' AND table_schema = DATABASE()";
			
			pstmt = con.prepareStatement(sql);
			
		    rs = pstmt.executeQuery();
		    
		    if(rs.next()) {
		    	count = rs.getInt("AUTO_INCREMENT");
		    }
			
			sql = "INSERT INTO chat_message (room_id, user_name, message_content, message_time) VALUES (?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, "익명");
			pstmt.setString(3, message);
			pstmt.setString(4, message_time);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}
	
}
