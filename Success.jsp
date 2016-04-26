<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>'
<h1>Below are the companies selected by <%=request.getAttribute("user") %>  at <%= request.getAttribute("time")%></h1>

<%
String[] company= (String[])request.getAttribute("company");
for(int i=0;i<company.length;i++){
%>
<h2><%=i+1%>  <%= company[i] %></h2>
<%} %>
</body>
</html>