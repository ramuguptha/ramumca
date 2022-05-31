<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("Id"));
int status=-2;
try
{
	PreparedStatement ps=con.prepareStatement("update bookings set status=? where id=?");
	ps.setInt(1, status);
	ps.setInt(2, id);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert(" Your Booking is Successfully Cancelled")</script>
		<jsp:include page="viewmybookingsdata.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Cancelation Failed")</script>
		<jsp:include page="viewmybookingsdata.jsp" />
		<%
	}
	
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
