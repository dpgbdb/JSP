
<%@page import="kr.co.farmstory2.vo.UserVO"%>
<%@page import="kr.co.farmstory2.dao.UserDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
 	String uid = request.getParameter("uid");
 	String pass = request.getParameter("pass");
 	
	UserVO ub = UserDAO.getInstance().selectUser(uid, pass);
	
	if(ub != null){
		// 회원이 맞을 경우
		session.setAttribute("sessUser", ub);
		response.sendRedirect("/Farmstory2");
	}else{
		// 회원이 아닐 경우
		response.sendRedirect("/Farmstory2/user/login.jsp?success=100");
	}
%>