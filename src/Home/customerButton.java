package Home;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Customerbtn")
public class customerButton extends HttpServlet{

	 protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 
		 RequestDispatcher rd=req.getRequestDispatcher("form.html");
		 rd.include(req, res);
	

}
}
