<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="customerheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">ITEMS DETAILS</div>
<div class="table-responsive">
<%
String email=request.getParameter("email");
//System.out.println(email);
try
{
	
	
	PreparedStatement ps=con.prepareStatement("select * from item where email='"+email+"'");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"Item Name"+"</th>"+"<th>"+"Description"+"</th>"+"<th>"+"Cost"+"</th>"+"<th>"+"Update"+"</th>"+"</tr>");
	int count=0;

	while(rs.next()) 
	{
		count++;
		out.println("<tr>");
		out.println("<td>"+rs.getString(2)+"</td>"+"<td>"+ rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+"<a class='btn btn-primary' href='bookitempage.jsp?Id="+rs.getInt(1)+"&Email="+email+"'>Book</a>"+"</td>");
		
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
