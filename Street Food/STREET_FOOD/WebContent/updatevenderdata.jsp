<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String address=request.getParameter("address");
long mobile=Long.parseLong(request.getParameter("mobile"));

try
{
	PreparedStatement ps=con.prepareStatement("update customer set name=?, address=?, mobile=? where id=?");
	ps.setString(1, name);
	ps.setString(2, address);
	ps.setLong(3, mobile);
	ps.setInt(4, id);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert("successfully Updated")</script>
		<jsp:include page="viewvenderdetails.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Updation Failed")</script>
		<jsp:include page="updatevenderpage.jsp" />
		<%
	}
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
