<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="connect.jsp" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
session.setAttribute("email", email);
try
{
	PreparedStatement ps=con.prepareStatement("select * from vender where email='"+email+"' and password ='"+password+"' and status=1");
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<script>alert("successfully Logged-In")</script>
		<jsp:include page="venderhomepage.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Login Failed")</script>
		<jsp:include page="venderloginpage.jsp" />
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
