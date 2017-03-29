// save as "<TOMCAT_HOME>\webapps\lis4368\WEB-INF\classes\crud\info\TestServlet.java"
/*
1. Compile:
Windows:
  cd to C:\tomcat\webapps\lis4368\WEB-INF\classes
  javac -cp .;c:\tomcat\lib\servlet-api.jar crud/info/TestServlet.java

Mac: 	
  cd to /Applications/tomcat/webapps/lis4368/WEB-INF/classes
  javac -cp .:/Applications/tomcat/lib/servlet-api.jar crud/info/TestServlet.java

2. Run: http://localhost:9999/lis4368/test
*/
package crud.info;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name="HelloTestServlet",urlPatterns={"/test"})
public class TestServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html");        
		PrintWriter out = response.getWriter();        
		try
			{
				out.println("<h1>HTML from servlet</h1>");
			} 
		finally
			{
				out.close();
			}
	}
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request, response);
	}    
}
