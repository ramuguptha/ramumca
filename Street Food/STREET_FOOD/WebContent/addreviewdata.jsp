<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%@ include file="connect.jsp" %>
<%
String restemail=request.getParameter("restemail");
String custemail=session.getAttribute("email").toString();
int rate=Integer.parseInt(request.getParameter("rate"));
String comment=request.getParameter("comment");

try
{
	PreparedStatement ps=con.prepareStatement("insert into review(restemail, custemail, rate, comment) values(?,?,?,?)");
	ps.setString(1, restemail);
	ps.setString(2, custemail);
	ps.setInt(3, rate);
	ps.setString(4, comment);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert("Successfully Review Added")</script>
		<jsp:include page="viewresturentdata.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Review Failed")</script>
		<jsp:include page="addreviewpage.jsp" />
		<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
