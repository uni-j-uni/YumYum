<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.URLEncoder" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Cookie reserveId=new Cookie("Reserve_restId", URLEncoder.encode(request.getParameter("restId"), "utf-8"));
	Cookie name=new Cookie("Reserve_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie reserveDate=new Cookie("Reserve_reserveDate", URLEncoder.encode(request.getParameter("reserveDate"), "utf-8"));
	Cookie numberOfPerson=new Cookie("Reserve_numberOfPerson", URLEncoder.encode(request.getParameter("numberOfPerson"), "utf-8"));
	Cookie phoneNumber=new Cookie("Reserve_phoneNumber", URLEncoder.encode(request.getParameter("phoneNumber"), "utf-8"));
	
	reserveId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	phoneNumber.setMaxAge(24 * 60 * 60);
	numberOfPerson.setMaxAge(24 * 60 * 60);
	
	response.addCookie(reserveId);
	response.addCookie(name);
	response.addCookie(reserveDate);
	response.addCookie(numberOfPerson);
	response.addCookie(phoneNumber);
	
	response.sendRedirect("./reserveConfirmation.jsp");
%>