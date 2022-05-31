<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
String name=request.getParameter("name");
String desc=request.getParameter("desc");
double cost=Double.parseDouble(request.getParameter("cost"));
String email=session.getAttribute("email").toString();

try
{
	PreparedStatement ps=con.prepareStatement("insert into item(name, description, cost, email) values(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, desc);
	ps.setDouble(3, cost);
	ps.setString(4, email);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert("Successfully Added")</script>
		<jsp:include page="additempage.jsp"/>
		<%
	}
	else
	{
		%>
		<script>alert("Item Adding Failed")</script>
		<jsp:include page="additempage.jsp"/>
		<%
	}
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
