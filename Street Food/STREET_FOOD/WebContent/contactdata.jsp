<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="connect.jsp" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String subject=request.getParameter("subject");
String message=request.getParameter("message");

try
{
	PreparedStatement ps=con.prepareStatement("insert into contact(name, email, subject, message) values(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, subject);
	ps.setString(4, message);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert("Successfully Sent")</script>
		<jsp:include page="contact.jsp"/>
		<%
	}
	else
	{
		%>
		<script>alert("Message Sending Failed")</script>
		<jsp:include page="contact.jsp"/>
		<%
	}
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>