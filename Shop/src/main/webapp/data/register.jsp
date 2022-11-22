<%@page import="DB.Sql"%>
<%@page import="DB.DBCP"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String orderProduct = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");
	String orderId = request.getParameter("orderId");
	
	int result = 0;
	
try{
	Connection conn = DBCP.getConnection();
	PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ORDER);
	
	psmt.setString(1,orderId);
	psmt.setString(2,orderProduct);
	psmt.setString(3,orderCount);
	
	
	
	result = psmt.executeUpdate();
	
	psmt.close();
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}
JsonObject json = new JsonObject();
json.addProperty("result", result);
String jsonData=json.toString();
out.print(jsonData);
%>