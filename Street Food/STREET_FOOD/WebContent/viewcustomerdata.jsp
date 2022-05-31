<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="adminheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">CUSTOMER DETAILS</div>
<div class="table-responsive">
<%

try
{
	PreparedStatement ps=con.prepareStatement("select * from customer");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"Full Name"+"</th>"+"<th>"+"Email"+"</th>"+"<th>"+"Mobile"+"</th>"+"<th>"+"Address"+"</th>"+"<th>"+"Status"+"</th>"+"<th>"+"Delete"+"</th>"+"<th>"+"Accept/Reject"+"</th>"+"</tr>");
	int count=0;

	while(rs.next()) 
	{
		count++;
		int status=rs.getInt(7);
		if(status==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(2)+"</td>"+"<td>"+ rs.getString(3)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+"Rejected"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='deletecustomerdata.jsp?Id="+rs.getInt(1)+"'>Delete</a>"+"</td>");
		out.println("<td>"+"<a class='btn btn-primary' href='acceptcustomerdata.jsp?Id="+rs.getInt(1)+"'>Accept</a>"+"</td>");
		out.println("</tr>");
		}
		else
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(2)+"</td>"+"<td>"+ rs.getString(3)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+"Accepted"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='deletecustomerdata.jsp?Id="+rs.getInt(1)+"'>Delete</a>"+"</td>");
		out.println("<td>"+"<a class='btn btn-primary' href='rejectcustomerdata.jsp?Id="+rs.getInt(1)+"'>Reject</a>"+"</td>");
		out.println("</tr>");
		}
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
