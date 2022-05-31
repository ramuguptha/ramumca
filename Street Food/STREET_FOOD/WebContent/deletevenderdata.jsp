<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("Id"));

try
{
	PreparedStatement ps=con.prepareStatement("delete from vender where id="+id);
	int n=ps.executeUpdate();
	
	if(n>0)
	{
		%>
		<script>alert("Deleted Successfully")</script>
		<jsp:include page="viewvenderdata.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Deletion Failed")</script>
		<jsp:include page="viewvenderdata.jsp" />
		<%
	}
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
