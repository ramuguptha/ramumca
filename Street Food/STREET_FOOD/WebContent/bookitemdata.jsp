<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="connect.jsp" %>
<%
String restemail=request.getParameter("restemail");
int itemid=Integer.parseInt(request.getParameter("itemid"));
String custemail=session.getAttribute("email").toString();
double itemcost=Double.parseDouble(request.getParameter("itemcost"));
int quan=Integer.parseInt(request.getParameter("quan"));
double totalcost=Double.parseDouble(request.getParameter("totalcost"));
int status=-1;
int delstatus=-1;

try
{
	PreparedStatement ps=con.prepareStatement("insert into bookings(restemail, itemid, custemail, itemcost, quantity, totalcost, status, delstatus) values(?,?,?,?,?,?,?,?)");
	ps.setString(1, restemail);
	ps.setInt(2, itemid);
	ps.setString(3, custemail);
	ps.setDouble(4, itemcost);
	ps.setInt(5, quan);
	ps.setDouble(6, totalcost);
	ps.setInt(7, status);
	ps.setInt(8, delstatus);
	
	int n=ps.executeUpdate();
	
	if(n>0)
	{
		%>
		<script>alert("seccessfully Booked")</script>
		<jsp:include page="viewresturentdata.jsp" />
		<%
	}
	else
	{
		%>
		<script>alert("Booking Failed")</script>
		<jsp:include page="bookitempage.jsp" />
		<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}

%>
