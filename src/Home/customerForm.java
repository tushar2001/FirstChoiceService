package Home;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class customerForm extends HttpServlet{

	 protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		 PrintWriter out=res.getWriter();
		 
		 String uname=req.getParameter("uname");
		 String radio=req.getParameter("optradio");
		 String model=req.getParameter("model");
		 String city=req.getParameter("city");
		 String phone =req.getParameter("phone");
		 String date=req.getParameter("date1");
		 
		 out.println(uname+" "+radio+" "+model+" "+city+" "+phone+" "+date);
		 
		 
	 }
}
