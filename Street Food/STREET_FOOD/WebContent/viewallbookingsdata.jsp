<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="adminheader.jsp" %>
<%@ include file="connect.jsp" %>
<br><br>
<div class="container">
<div class="h3 text-center">ALL BOOKINGS</div>
<div class="table-responsive">
<%

try
{
	PreparedStatement ps=con.prepareStatement("select vender.name, vender.mobile, vender.address, customer.name, customer.mobile, item.name, bookings.itemcost, bookings.quantity, bookings.totalcost , bookings.status, bookings.delstatus from customer, item, bookings, vender where bookings.itemid=item.id and bookings.custemail=customer.email and bookings.restemail=vender.email");
	ResultSet rs=ps.executeQuery();
	out.println("<table class='table table-bordered'>");
	out.println("<tr>"+"<th>"+"Vender Name"+"</th>"+"<th>"+"Vender Mobile"+"</th>"+"<th>"+"Vender Address"+"</th>"+"<th>"+"Customer Name"+"</th>"+"<th>"+"Customer Mobile"+"</th>"+"<th>"+"Item Name"+"</th>"+"<th>"+"Item Cost"+"</th>"+"<th>"+"Item Quantity"+"</th>"+"<th>"+"Item Total Cost"+"</th>"+"<th>"+"Status"+"</th>"+"<th>"+"Delivery Status"+"</th>"+"</tr>");
	int count=0;

	while(rs.next()) 
	{
		count++;
		int status=rs.getInt(10);
		int delstatus=rs.getInt(11);
		if(status==-1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+"This Order In Pending"+"</td>"+"<td>"+"------"+"</td>");
		out.println("</tr>");
		}
		else if(status==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+"Ordered is Rejected"+"</td>"+"<td>"+"------"+"</td>");
		out.println("</tr>");
		}
		else if(status==-2)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+"Customer Cancelled the Order"+"</td>"+"<td>"+"------"+"</td>");
		
		out.println("</tr>");
		}
		else if(status==1 && delstatus==-1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+"This Order is Accepted"+"</td>"+"<td>"+"Shipping is in Pending"+"</td>");
		
		
		out.println("</tr>");
		}
		else if(status==1 && delstatus==0)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+"This Order is Accepted"+"</td>"+"<td>"+"This Order is shipped"+"</td>");
		
		
		out.println("</tr>");
		}
		else if(status==1 && delstatus==1)
		{
		out.println("<tr>");
		out.println("<td>"+rs.getString(1)+"</td>"+"<td>"+ rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+ rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(7)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+"This Order is Accepted"+"</td>"+"<td>"+"This order was Delivered"+"</td>");
		
		
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
