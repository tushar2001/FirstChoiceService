<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="Home.DBUtil"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<title>Booking confirmed</title>
</head>
<body>
<%
	
String vename=request.getParameter("vname");
String time=request.getParameter("time");
int cusid=Integer.parseInt(request.getParameter("cusid"));
String bookdate	=request.getParameter("bookdate");
int bookingId=0;

int vid=0;

Connection con=DBUtil.getDBConnection();

 try {  
PreparedStatement ps=con.prepareStatement("insert into fcs.BOOKINGS values(fcs.book_id_seq.nextval, ?, ?, ?, ?)");
PreparedStatement ss=con.prepareStatement("select id from fcs.vendor where vname=?");
ss.setString(1,vename);
		  ResultSet rs=ss.executeQuery();
		  if(rs.next())
			    vid = rs.getInt(1);
		  
ps.setInt(1, cusid);
ps.setInt(2,vid);
ps.setString(3, bookdate);
ps.setString(4, time);
ps.executeQuery();
PreparedStatement s1 = con.prepareStatement("select booking_id from fcs.bookings where cus_id=?");
s1.setInt(1,cusid);
ResultSet rs1 = s1.executeQuery();
if(rs1.next())
{
	bookingId = rs1.getInt(1);
}
}
catch(SQLException e)
{
	  System.out.println("Data not found");
	  e.printStackTrace();
} 

 
%>
<div class="container">
<h3 class="well">${username} <span class="glyphicon glyphicon-user"></span> </h3>
<div class="alert alert-info">
    <strong>Congratulations !</strong> Your booking has been confirmed. Your booking id is #<%=bookingId%>
 </div>
 <img src="images/service.png" style="display:block;margin-left:auto;margin-right:auto;width:50%" class="center">
</div>

</body>	
</html>