<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JAIRAM and GouthamNanda AI Tech-Home Page</title>
<link href="images/mithunlogo.jpg" rel="icon">
</head>
</head>
<body>
<h1 align="center"> Welcome to JAI RAM  and Goutham Nanda Technologies Private Ltd. Best Place to upskill - New DevOps with AWS and AI Assitance Batch will start on Jan 31st 2026  at 7.00 PM IST - WebHook Demo by JAI RAM sir</h1>
<h1 align="center">Welcome to JAI RAM and Goutham Nanda Technologies Private Ltd. Ph No: +91-525599234, +91-556299319,Dubai,UAE</h1>
<h1 align="center"> JAI RAM and Goutham Nanda Technologies- Very Good Training center for DevOps with AWS,Python & AWS Solution Architect & Terraform in Bangalore India.Teaching Real Time scnerios</h1>
<h1> Trainer Name is: JAI</h1>
<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address :: "+ip);%>
</h1>
<br>
<h1><h3> Client Side IP Address </h3><br>
<%out.print( "Client IP Address :: " + request.getRemoteAddr() ); %><br>
<%out.print( "Client Name Host :: "+ request.getRemoteHost() );%><br></h1>
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/mithunlogo.jpg" alt="" width="100">
	</span>
	<span style="font-weight: bold;">
		JAi RAM Technologies, 
		Sharjha, Opposite Mahata Museum,
		UAE,
		+525599234,+556299319
		devopstrainingblr@gmail.com
		<br>
		<a href="mailto:tibcokoteswara@gmail.com">Mail to JAI RAM Technologies</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>JAI RAM and Goutham Technologies - Consultant, Training, Development Center.</p>
<p align=center><small>Copyrights 2025 by <a href="http://mithuntechnologies.com/">JAI RAM Technologies,Dubai</a> </small></p>

</body>
</html>
