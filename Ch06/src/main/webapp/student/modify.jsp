<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.StudentBean"%>
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
	
	StudentBean sb =null;
	try{
		String host = "jdbc:mysql://127.0.0.1:3306/java2db";
		String user = "root";
		String pass = "1234";
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `member` WHERE `uid`='"+uid+"'");		
		if(rs.next()){
			 sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
		}
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student::modify</title>
	</head>
	<body>
		<h3>Student 수정</h3>
		<a href="../1_JDBCTest.jsp">처음으로</a>
		<a href="./list.jsp">Student 목록</a>
		
		<form action="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text"name="uid" readonly value="<%=sb.getStdNo()%>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text"name="name"value="<%=sb.getStdName()%>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text"name="hp"value="<%=sb.getStdHp() %>"/></td>
				</tr>
				<tr>
					<td>학년</td>
					<td><input type="text"name="hp"value="<%=sb.getStdYear() %>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text"name="hp"value="<%=sb.getStdAddress() %>"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type="submit" value="수정"/>
					</td>
				</tr>
			</table>
		</form>	
	</body>
</html>