<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("Id"));
int status=0;
try
{
	PreparedStatement ps=con.prepareStatement("update bookings set status=? where id=?");
	ps.setInt(1, status);
	ps.setInt(2, id);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert("Successfully Rejected")</script>
		<jsp:include page="viewbookingsdata.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Rejection Failed")</script>
		<jsp:include page="viewbookingsdata.jsp" />
		<%
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
