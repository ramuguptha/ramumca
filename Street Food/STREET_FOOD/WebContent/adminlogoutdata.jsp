<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//String email=session.getAttribute("email").toString();
session.invalidate();
request.getSession(false);
%>
<script>alert("Successfully Logged out")</script>
<jsp:include page="adminloginpage.jsp" />
<%
%>