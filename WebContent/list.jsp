
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="Home.DBUtil"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.ResultSet"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> 
<title>Service centers available</title>
</head>
<body>
<div class="container">
<h3 class="well">Welcome, ${username} <span class="glyphicon glyphicon-user"></span> </h3>
<h4>Here's the service centers list based on your preferences:</h4>
<table class="table table-hover">
    <thead>
      <tr>
        <th>Service Center</th>
        <th>Address</th>
        <th>City</th>
        <th>Base Price</th>
        <th>Contact</th>
        <th>Select time</th>
      </tr>
    </thead>
    <tbody>
<%
	response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setHeader("Expires","0"); // Proxy

	if(session.getAttribute("username")==null){
		response.sendRedirect("form.html");
	}
	
	try{
	Connection con = DBUtil.getDBConnection();
	Statement statement = con.createStatement();
	String sql = "select * from fcs.vendor";
	String city=(String)session.getAttribute("city");
	String radio=(String)session.getAttribute("radio");
	ResultSet resultSet = statement.executeQuery(sql);
	
	while(resultSet.next()){
		if(city.equalsIgnoreCase(resultSet.getString("city")))
		{
			if(radio.equals("fourwheel") && resultSet.getString("fourwheel").equals("1"))
			{
	
%>
		      <tr>
		        <td><%=resultSet.getString("vname") %></td>
		        <td><%=resultSet.getString("address") %></td>
		        <td><%=resultSet.getString("city") %></td>
		        <td>&#8377; <%=resultSet.getString("fcost") %></td>
		        <td><%=resultSet.getString("vphone") %></td>
		        <td>
			        <select class="form-control" id="sel1" name="model">
			        <%
			        //Select Time
			        int limit = Integer.parseInt(resultSet.getString("vslots"));
			        int baseTime = Integer.parseInt(resultSet.getString("start_time"));
			        for(int i=0;i<5;i++)
			        {
			        	String option;
			        	if(baseTime+i>12)
			        		option="0" + Integer.toString(baseTime+i-12)+":00 P.M.";
			        	else
			        	{
			        		if(baseTime+i>9)
			        			option=Integer.toString(baseTime+i)+":00 A.M.";
			        		else
			        			option="0"+Integer.toString(baseTime+i)+":00 A.M.";
			        	}
			        		
			        %>
			        <option><%=option%></option>
					<%
					}
					%>
			      	</select>
			      </td>  
		        
		      </tr>
<%
			}
			if(radio.equals("twowheel") && resultSet.getString("twowheel").equals("1"))
			{
%>
			      <tr>
			        <td><%=resultSet.getString("vname") %></td>
			        <td><%=resultSet.getString("address") %></td>
			        <td><%=resultSet.getString("city") %></td>
			        <td>&#8377; <%=resultSet.getString("tcost") %></td>
			        <td><%=resultSet.getString("vphone") %></td>
			        <td>
			        <select class="form-control" id="sel1" name="model">
			        <%
			        //Select Time
			        int limit = Integer.parseInt(resultSet.getString("vslots"));
			        int baseTime = Integer.parseInt(resultSet.getString("start_time"));
			        for(int i=0;i<limit;i++)
			        {
			        	String option;
			        	if(baseTime+i>12)
			        		option="0" + Integer.toString(baseTime+i-12)+":00 P.M.";
			        	else
			        	{
			        		if(baseTime+i>9)
			        			option=Integer.toString(baseTime+i)+":00 A.M.";
			        		else
			        			option="0"+Integer.toString(baseTime+i)+":00 A.M.";
			        	}
			        		
			        %>
			        <option><%=option%></option>
					<%
					}
					%>
			      </select>
			      </td>   
			      </tr>
<%
			}
		}
	}
   }
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</tbody>
</table>
</div>

</body>
</html>