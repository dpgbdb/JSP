<%@page import="DB.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Bean.OrderBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DB.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
List<OrderBean> orders = new ArrayList<>(); 
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_ORDER);
		while(rs.next()){
			OrderBean ob = new OrderBean();
			
			ob.setOrderNo(rs.getInt(1));
			ob.setOrderId(rs.getString(2));
			ob.setProductName(rs.getString(3));
			ob.setOrderCount(rs.getInt(4));
			ob.setOrderDate(rs.getString(5));
			
			orders.add(ob);
			
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
		<title>주문목록</title>
	</head>
	<body>
		<h3>주문목록</h3>
		<a href="/Shop/customer.jsp">고객목록</a>
		<a href="/Shop/order.jsp">주문목록</a>
 		<a href="/Shop/product.jsp">상품목록</a>
 		<table border=1>
 		<tr>
 			<th>주문번호</th>
			<th>주문자</th>
			<th>주문상품</th>
			<th>주문수량</th>
			<th>주문일</th>
		</tr>
		<% for(OrderBean ob : orders){ %>
				<tr>
					<td><%= ob.getOrderNo() %></td>
					<td><%= ob.getOrderId() %></td>
					<td><%= ob.getProductName() %></td>
					<td><%= ob.getOrderCount() %></td>
					<td><%= ob.getOrderDate() %></td>
				</tr>
			<% } %>
 		</table>
	</body>
</html>