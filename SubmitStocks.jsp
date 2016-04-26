<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function validateUser(){
    var TCode = document.getElementById('user').value;

    if( /[^a-zA-Z0-9]/.test( TCode ) ) {
        alert('Input is not alphanumeric');
        return false;
    }

    return true;     
}
</script>
</head>
<body>
<center>
<form method="post" action="StockController" onsubmit="return validateUser()">
<table><%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:INATP02","shobana","shobana");
	Statement ps=con.createStatement();
	ResultSet rs= ps.executeQuery("select DISTINCT COMP_NAME from T_XBBL5SF_COMP");
	//ResultSet rs= ps.executeQuery("select count(distinct COMP_NAME) + count(distinct case when COMP_NAME is null then 1 end) from T_COMITID_COMP");
	while(rs.next()){
		System.out.println(rs.getString("COMP_NAME"));
	%>
	
	<tr><td><input type="checkbox" name="company"  value="<%=rs.getString("COMP_NAME") %>"></td><td><%=rs.getString("COMP_NAME") %></td></tr>
<%
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
<tr ><td>USER NAME</td>
	<td><input type="text" name="user"></td></tr>
	<tr ><td></td><td><input type="Submit" name="user"></td></tr>
</table>
</form>
</center>
</body>
</html>  