<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
function validateUser(){
    var TCode = document.getElementById('user').value;

    if( /[^a-zA-Z0-9 ]/.test( TCode ) ) {
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
       File f= new File("C:/Mudit/company.txt");
       BufferedReader br=new BufferedReader(new FileReader(f));
       String c=br.readLine();
       while(!c.equals(null)){
              //System.out.println(rs.getString("COMP_NAME"));
       %>
       <tr><td><input type="checkbox" name="company"  value="<%=c%>"></td><td><%=c%></td></tr>
<%
c=br.readLine();
       }
       br.close();
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
