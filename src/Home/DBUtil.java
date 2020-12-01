package Home;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	
	 static Connection con=null;
	static
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","2201");
			if(!con.isClosed()) {
				System.out.println("Connection established");
			}
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("class not found");
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			System.out.println("sql exception");
			e.printStackTrace();
		}
		
	}
	public static Connection getDBConnection()
	{
		return con;
	}

}
