<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.UserBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	// 데이터베이스 작업
	String host = "jdbc:mysql://127.0.0.1:3306/java2db";
	String user = "root";
	String pass = "1234";
	UserBean ub =null;
	try{
		Connection conn =DriverManager.getConnection(host, user, pass);
		
		String sql = "SELECT * FROM `user3` WHERE `uid`=?";
		PreparedStatement psmt =conn.prepareStatement(sql);
		psmt.setString(1,uid);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			 ub = new UserBean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
		}
		rs.close();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user::delete</title>
	</head>
	<body>
		<h3>user 삭제</h3>
		<a href="../1_JDBCTest.jsp">처음으로</a>
		<a href="./register.jsp">user 등록</a>
		
		response.redirect
	</body>
</html>