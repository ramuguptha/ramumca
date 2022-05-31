<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
session.setAttribute("email", email);
try
{
	PreparedStatement ps=con.prepareStatement("select *  from admin where email='"+email+"' and password='"+password+"'");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<script>alert("successfully Logged-In")</script>
		<jsp:include page="adminhomepage.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Login Failed")</script>
		<jsp:include page="adminloginpage.jsp" />
		<%
	}
	con.close();
	rs.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
