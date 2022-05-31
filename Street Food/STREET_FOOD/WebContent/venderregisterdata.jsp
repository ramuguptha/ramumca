<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");
String address=request.getParameter("address");
long mobile=Long.parseLong(request.getParameter("mobile"));
int status=0;
try
{
	PreparedStatement ps1=con.prepareStatement("select * from vender where email='"+email+"'");
	ResultSet rs=ps1.executeQuery();
	
	if(rs.next())
	{
		%>
		<script>alert("You Have Already Registered! Please Login ")</script>
		<jsp:include page="venderloginpage.jsp" />
		<%
	}
	else
	{
	PreparedStatement ps=con.prepareStatement("insert into vender(name, email, password, address, mobile, status) values(?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, password);
	ps.setString(4, address);
	ps.setLong(5, mobile);
	ps.setInt(6, status);
	int n=ps.executeUpdate();
	
	if(n>0)
	{
		%>
		<script>alert("successfully Registered! Please Login")</script>
		<jsp:include page="venderloginpage.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Register Failed")</script>
		<jsp:include page="venderregisterpage.jsp" />
		<%
	}
	
	}
	con.close();
	rs.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
