<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="connect.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("id"));
String name=request.getParameter("name");
String desc=request.getParameter("desc");
double cost=Double.parseDouble(request.getParameter("cost"));

try
{
	PreparedStatement ps=con.prepareStatement("update item set name=?, description=?, cost=? where id=?");
	ps.setString(1, name);
	ps.setString(2, desc);
	ps.setDouble(3, cost);
	ps.setInt(4, id);
	
	int n=ps.executeUpdate();
	if(n>0)
	{
		%>
		<script>alert("successfully Updated")</script>
		<jsp:include page="viewitemsdata.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Updation Failed")</script>
		<jsp:include page="updateitemspage.jsp" />
		<%
	}
	con.close();
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
