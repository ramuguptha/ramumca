<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="venderheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">MY BOOKINGS</div>
<div class="table-responsive">
<%
String email=session.getAttribute("email").toString();

try
{
	PreparedStatement ps=con.prepareStatement("select customer.name, customer.mobile, customer.address, item.name, bookings.itemcost, bookings.quantity, bookings.totalcost , bookings.restemail, bookings.id, bookings.status, bookings.delstatus from customer, item, bookings where bookings.itemid=item.id and bookings.custemail=customer.email and bookings.restemail='"+email+"'");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"customer Name"+"</th>"+"<th>"+"Customer Mobile"+"</th>"+"<th>"+"Customer Address"+"</th>"+"<th>"+"Item Name"+"</th>"+"<th>"+"Item Cost"+"</th>"+"<th>"+"Item Quantity"+"</th>"+"<th>"+"Item Total Cost"+"</th>"+"<th>"+"My Email"+"</th>"+"<th>"+"Status"+"</th>"+"<th>"+"Accept/Reject"+"</th>"+"<th>"+"Delivery Status"+"</th>"+"<th>"+"Final Status"+"</th>"+"</tr>");
	int count=0;

	while(rs.next()) 
	{
		count++;
		int status=rs.getInt(10);
		int delstatus=rs.getInt(11);
		if(status==-1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Pending...."+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='acceptbookingdata.jsp?Id="+rs.getInt(9)+"'>Accept</a>"+"/ <a class='btn btn-danger' href='rejectbookingdata.jsp?Id="+rs.getInt(9)+"'>Reject</a>"+"</td>");
		//out.println("<td>"+"<a class='btn btn-danger' href='rejectbookingdata.jsp?Id="+rs.getInt(9)+"'>Reject</a>"+"</td>");
		out.println("<td>"+"Plese Accept or Reject This Booking"+"</td>");
		out.println("<td>"+"------"+"</td>");
		
		out.println("</tr>");
		}
		else if(status==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Rejected"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='acceptbookingdata.jsp?Id="+rs.getInt(9)+"'>Accept</a>"+"</td>");
		out.println("<td>"+"------"+"</td>");
		out.println("<td>"+"You Have Rejected This Booking"+"</td>");
		
		
		out.println("</tr>");
		}
		else if(status==-2)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Cancelled"+"</td>");
		out.println("<td>"+"------"+"</td>");
		out.println("<td>"+"------"+"</td>");
		out.println("<td>"+"Customer Has Cancelled Booking"+"</td>");
		
		out.println("</tr>");
		}
		else if(status==1)
		{
		if(delstatus==-1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Accepted"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='rejectbookingdata.jsp?Id="+rs.getInt(9)+"'>Reject</a>"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='shippeddata.jsp?Id="+rs.getInt(9)+"'>Ship</a>"+"</td>");
		out.println("<td>"+"You have Accepted this Order"+"</td>");
		out.println("</tr>");
		}
		else if(delstatus==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Accepted"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='delivereddata.jsp?Id="+rs.getInt(9)+"'>Deliver</a>"+"</td>");
		out.println("<td>"+"This Order was Shipped"+"</td>");
		
		out.println("</tr>");
		}
		else if(delstatus==1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Accepted"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("<td>"+"This Order was Delivered"+"</td>");
		out.println("</tr>");
		}
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
