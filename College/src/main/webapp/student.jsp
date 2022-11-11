<%@page import="Bean.StudentBean"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<StudentBean> students = new ArrayList<>(); 
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_STUDENT);
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			
			sb.setStdNo(rs.getInt(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
			students.add(sb);
			
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/studentjs.js"></script>
		<script>
			$(document).ready(function () {
				$(document).on('click',".regstd",function(){
					studentjs();
				});
				$(document).on('click', '#btnStd', function(){
					
					let StdNo	    = $('input[name=StdNo]').val();
					let StdName	 	= $('input[name=StdName]').val();
					let StdHp   	= $('input[name=StdHp]').val();
					let StdYear  	= $('input[name=StdYear]').val();
					let StdAddress 	= $('input[name=StdAddress]').val();
					
					
					let jsonData = {
					
						"StdNo":StdNo,
						"StdName":StdName,
						"StdHp":StdHp,
						"StdYear":StdYear,
						"StdAddress":StdAddress
					};
					$.ajax({
						url : './data/regstd.jsp',
						method: 'post',
						data:jsonData,
						dataType: 'json',
						success: function(data) {
							if(data.result > 0){
								//동적처리실패
							}
						}
				});
			});
				
		});
		
		</script>
	</head>
	<body>
		<h3>학생관리</h3>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h4>학생목록</h4>
		
		<button class="regstd">등록</button>
		
		<table border="1" class="std">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>주소</th>
	<% for(StudentBean sb : students){ %>
				<tr>
					<td><%= sb.getStdNo() %></td>
					<td><%= sb.getStdName() %></td>
					<td><%= sb.getStdHp() %></td>
					<td><%= sb.getStdYear() %></td>
					<td><%= sb.getStdAddress() %></td>
				</tr>
			<% } %>
		</table>
		<nav></nav>
		<section></section>
	</body>
</html>