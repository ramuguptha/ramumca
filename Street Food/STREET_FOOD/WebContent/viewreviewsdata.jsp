<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="adminheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">REVIEWS</div>
<div class="table-responsive">
<%
String email=request.getParameter("email");

try
{
	PreparedStatement ps=con.prepareStatement("select * from review where restemail='"+email+"'");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"Rating"+"</th>"+"<th>"+"Comment"+"</th>"+"<th>"+"Customer Email"+"</th>"+"<th>"+"Time"+"</th>"+"</tr>");
	int count=0;

	while(rs.next()) 
	{
		count++;
		out.println("<tr>");
		out.println("<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(6)+"</td>");
		
		out.println("</tr>");
	}
	out.println("</table>");
	
	 
	if(count==0) {
		out.println("no records found");
	}
	con.close();
	rs.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</div></div>
<br><br>
<%@ include file="footer.jsp" %>
