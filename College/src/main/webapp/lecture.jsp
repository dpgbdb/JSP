<%@page import="Bean.CollegeBean"%>
<%@page import="config.Sql"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<CollegeBean> lectures = new ArrayList<>(); 
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_LECTURE);
		
		while(rs.next()){
			CollegeBean lb = new CollegeBean();
			
			lb.setLecNo(rs.getInt(1));
			lb.setLecName(rs.getString(2));
			lb.setLecCredit(rs.getInt(3));
			lb.setLecTime(rs.getInt(4));
			lb.setLecClass(rs.getString(5));
			
			lectures.add(lb);
			
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
		<title>강좌</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/lecturejs.js"></script>
		<script>
			$(document).ready(function () {
				$(document).on('click',".reglec",function(){
					lecturejs();
				});
				$(document).on('click', '#btnLec', function(){
					
					let LecNo	    = $('input[name=LecNo]').val();
					let LecName	 	= $('input[name=LecName]').val();
					let LecCredit   = $('input[name=LecCredit]').val();
					let LecTime  	= $('input[name=LecTime]').val();
					let LecClass 	= $('input[name=LecClass]').val();
					
					
					let jsonData = {
					
						"LecNo":LecNo,
						"LecName":LecName,
						"LecCredit":LecCredit,
						"LecTime":LecTime,
						"LecClass":LecClass
					};
					$.ajax({
						url : './data/reglec.jsp',
						method: 'get',
						data:jsonData,
						dataType: 'json',
						success: function(data) {
							if(data.result > 0){
								location.reload();
							}
						}
				});
			});
				
		});
		
		</script>
	</head>
	<body>
		<h3>강좌관리</h3>
		<a href="#">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h4>강좌현황</h4>
		
		<button class="reglec">등록</button>
		
		<table border="1" class="lec">
			<tr>
				<th>번호</th>
				<th>강좌명</th>
				<th>학점</th>
				<th>시간</th>
				<th>강의장</th>
			</tr>
	<% for(CollegeBean lb : lectures){ %>
				<tr>
					<td><%= lb.getLecNo() %></td>
					<td><%= lb.getLecName() %></td>
					<td><%= lb.getLecCredit() %></td>
					<td><%= lb.getLecTime() %></td>
					<td><%= lb.getLecClass() %></td>
				</tr>
			<% } %>
		</table>
		<nav></nav>
		<section></section>
	</body>
</html>