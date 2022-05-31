<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="adminheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">RESTURENT DETAILS</div>
<div class="table-responsive">
<%

try
{
	PreparedStatement ps=con.prepareStatement("select * from vender ");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"Resturent Name"+"</th>"+"<th>"+"Resturent Email"+"</th>"+"<th>"+"Resturent Mobile"+"</th>"+"<th>"+"Resturent Address"+"</th>"+"<th>"+"view Reviews"+"</th>"+"</tr>");
	int count=0;

	while(rs.next()) 
	{
		count++;
		out.println("<tr>");
		out.println("<td>"+rs.getString(2)+"</td>"+"<td>"+ rs.getString(3)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>");
		out.println("<td>"+"<a class='btn btn-primary' href='viewreviewsdata.jsp?email="+rs.getString(3)+"'>View Reviews</a>"+"</td>");
		
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
