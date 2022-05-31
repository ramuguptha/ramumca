<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="customerheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">MY BOOKINGS</div>
<div class="table-responsive">
<%
String email=session.getAttribute("email").toString();

try
{
	PreparedStatement ps=con.prepareStatement("select vender.name, vender.mobile, vender.address, item.name, bookings.itemcost, bookings.quantity, bookings.totalcost , bookings.custemail, bookings.id, bookings.status, bookings.delstatus from vender, item, bookings where bookings.restemail=vender.email and bookings.itemid=item.id and custemail='"+email+"'");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"Resturent Name"+"</th>"+"<th>"+"Resturent Mobile"+"</th>"+"<th>"+"Resturent Address"+"</th>"+"<th>"+"Item Name"+"</th>"+"<th>"+"Item Cost"+"</th>"+"<th>"+"Item Quantity"+"</th>"+"<th>"+"Item Total Cost"+"</th>"+"<th>"+"My Email"+"</th>"+"<th>"+"Status"+"</th>"+"<th>"+"Cancel Booking"+"</th>"+"<th>"+"Message"+"</th>"+"<th>"+"Delivery Status"+"</th>"+"</tr>");
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
		out.println("<td>"+"<a class='btn btn-danger' href='cancelbookingdata.jsp?Id="+rs.getInt(9)+"'>Cancel</a>"+"</td>");
		out.println("<td>"+"Your Booking is in Pending"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("</tr>");
		}
		else if(status==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Rejected"+"</td>"+"<td>"+"------"+"</td>"+"<td>"+"Your Booking has Rejected"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("</tr>");
		}
		else if(status==-2)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Cancelled"+"</td>"+"<td>"+"------"+"</td>"+"<td>"+"You Have Cancelled Booking"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("</tr>");
		}
		else if(status==1 && delstatus==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Accepted"+"</td>");
		out.println("<td>"+"<a class='btn btn-danger' href='cancelbookingdata.jsp?Id="+rs.getInt(9)+"'>Cancel</a>"+"</td>");
		out.println("<td>"+"Your Booking Accepted"+"</td>");
		out.println("<td>"+"Your Ordere was Shipped"+"</td>");
		out.println("</tr>");
		}
		else if(status==1 && delstatus==1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+"Accepted"+"</td>");
		out.println("<td>"+"-----"+"</td>");
		out.println("<td>"+"Your Booking Accepted"+"</td>");
		out.println("<td>"+"Your Order was Delivered"+"</td>");
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
