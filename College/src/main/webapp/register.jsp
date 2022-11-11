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
List<CollegeBean> registers = new ArrayList<>(); 
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_REGISTER);
		
		while(rs.next()){
			CollegeBean rb = new CollegeBean();
			
			rb.setRegStdNo(rs.getInt(1));
			rb.setStdName(rs.getString(2));
			rb.setLecName(rs.getString(3));
			rb.setRegLecNo(rs.getInt(4));
			rb.setRegMidScore(rs.getInt(5));
			rb.setRegFinalScore(rs.getInt(6));
			
			registers.add(rb);
			
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
		<title>수강</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/registerjs.js"></script>
		<script>
			$(document).ready(function () {
				$(document).on('click',".regreg",function(){
					registerjs();
				});
				$(document).on('click', '#btnStd', function(){
					
					let RegStdNo	    = $('input[name=RegStdNo]').val();
					let RegLecNo	 	= $('input[name=RegLecNo]').val();
					let RegMidScore   	= $('input[name=RegMidScore]').val();
					let RegFinalScore  	= $('input[name=RegFinalScore]').val();
					let RegTotalScore	= $('input[name=RegTotalScore]').val();
					let RegGrade		= $('input[name=RegGrade]').val();
					
					
					let jsonData = {
					
						"RegStdNo":RegStdNo,
						"RegLecNo":RegLecNo,
						"RegMidScore":RegMidScore,
						"RegFinalScore":RegFinalScore,
						"RegTotalScore":RegTotalScore,
						"RegGrade":RegGrade
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
		<h3>수강관리</h3>
		<a href="./lecture.jsp">강좌관리</a>
		<a href="./register.jsp">수강관리</a>
		<a href="./student.jsp">학생관리</a>
		
		<h4>수강현황</h4>
		
		
		<div>
		<input type ="text"/>
		<button class="regreg">수강신청</button>
		<button></button>
		</div>
		<table border="1" class="reg">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>강좌명</th>
				<th>강좌코드</th>
				<th>중간시험</th>
				<th>기말시험</th>
				<th>총점</th>
				<th>등급</th>
	<% for(CollegeBean rb : registers){ %>
				<tr>
					<td><%= rb.getRegStdNo() %></td>
					<td><%= rb.getStdName() %></td>
					<td><%= rb.getLecName() %></td>
					<td><%= rb.getRegLecNo() %></td>
					<td><%= rb.getRegMidScore() %></td>
					<td><%= rb.getRegFinalScore() %></td>
					<td></td>
					<td></td>
					
					
				</tr>
			<% } %>
		</table>
		<nav></nav>
		<section></section>
	</body>
</html>