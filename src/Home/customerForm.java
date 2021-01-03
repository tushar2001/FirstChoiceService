package Home;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//import Test.DBUtil;

@WebServlet("/CustomerReg")
public class customerForm extends HttpServlet{

	 protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			 
		 PrintWriter out=res.getWriter();
		 	
		 String uname=req.getParameter("uname");
		 String radio=req.getParameter("optradio");
		 String model=req.getParameter("model");
		 String city=req.getParameter("city");
		 String phone =req.getParameter("phone");
		 String date=req.getParameter("date1");
		 int myid=0;
		 
		 out.println(uname+" "+radio+" "+model+" "+city+" "+phone+" "+date);
		 
		 
		 Connection con=DBUtil.getDBConnection();
		  
		  try {  
		  PreparedStatement ps=con.prepareStatement("insert into fcs.customer values(?, ?, ?, ?, ?, ?,fcs.cus_id_seq.nextval)");
//		  PreparedStatement ss=con.prepareStatement("select * from fcs.customer");
		  ps.setString(1, uname);
		  ps.setString(2, radio);
		  ps.setString(3, model);
		  ps.setString(4, city);
		  ps.setString(5, phone);
		  ps.setString(6, date);
		  ps.executeQuery();
		  PreparedStatement ss=con.prepareStatement("select fcs.cus_id_seq.currval from sys.DUAL");
		  ResultSet rs=ss.executeQuery();
		  if(rs.next())
			    myid = rs.getInt(1);
		  

		  }
		  catch(SQLException e)
		  {
			  System.out.println("Data not found");
			  e.printStackTrace();
		  }
		  
		  HttpSession session = req.getSession();
		  session.setAttribute("username", uname);
		  session.setAttribute("city", city);
		  session.setAttribute("radio", radio);
		  session.setAttribute("myid", myid);
		  session.setAttribute("book_date", date);
		  res.sendRedirect("list.jsp");
		  
	 }
}
