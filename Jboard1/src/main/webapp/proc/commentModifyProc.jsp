<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String content = request.getParameter("content");
	
	int result = ArticleDAO.getInstance().updateComment(no, content);
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json.toString());
%>