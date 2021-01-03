<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="Home.DBUtil"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
String vename=request.getParameter("vname");
String time=request.getParameter("time");
int cusid=Integer.parseInt(request.getParameter("cusid"));
String bookdate	=request.getParameter("bookdate");

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
}
catch(SQLException e)
{
	  System.out.println("Data not found");
	  e.printStackTrace();
} 

%>
<%=vename %><%=time %><%=cusid %><%= bookdate %>
</body>	
</html>