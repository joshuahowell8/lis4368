// save as "<TOMCAT_HOME>\webapps\lis4368\WEB-INF\classes\crud\info\CustomerListServlet.java"
/*
1. Compile:
Windows:
  cd to C:\tomcat\webapps\lis4368\WEB-INF\classes
  javac -cp .;c:\tomcat\lib\servlet-api.jar crud/info/CustomerListServlet.java

Mac: 	
  cd to /Applications/tomcat/webapps/lis4368/WEB-INF/classes
  javac -cp .:/Applications/tomcat/lib/servlet-api.jar crud/info/CustomerListServlet.java

2. Run: http://localhost:9999/lis4368/customerList
*/
package crud.info;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
 
import crud.business.Customer;

//servlet CustomerList is mapped to the URL pattern /customerList. When accessing this servlet, it will return a message.
@WebServlet("/customerList")
public class CustomerListServlet extends HttpServlet
{
	//perform different request data processing depending on transfer method (here, Post or Get)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
	{
		String url = "/index.jsp"; //initialize url value (used for logic below)
        
		// get current action
		String action = request.getParameter("action");
		if (action == null)
			{
				action = "join";  // default action
			}

        // perform action and set URL to appropriate page
		if (action.equals("join"))
			{
				url = "/customerform.jsp";    // the "join" page
			} 
		else if (action.equals("add"))
			{
				// get parameters from the request (data conversions not required here)
				//Reality-check: zip should be int, phone long, balance and totalSales BigDecimal data types
				String firstName = request.getParameter("fname");
				String lastName = request.getParameter("lname");
				String street = request.getParameter("street");
				String city = request.getParameter("city");
				String state = request.getParameter("state");
				String zip = request.getParameter("zip");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String balance = request.getParameter("balance");
				String totalSales = request.getParameter("total_sales");
				String notes = request.getParameter("notes");

				String message; //display entry issues encountered to user
				
				// store data in Customer object: user
				Customer user = new Customer(firstName, lastName, street, city, state, zip, phone, email, balance, totalSales, notes);

				//here: check *only* for data entry
				//empty string: string with zero length.
				//null value: is unknown value--not having a string.
				
				//Reality-check: in production environment need rigorous data validation:
				//http://java-source.net/open-source/validation
				if (
					firstName == null || lastName == null || street == null || 
					city == null || state == null || zip == null || phone == null || 
					email == null || balance == null || totalSales == null || 
					firstName.isEmpty() || lastName.isEmpty() || street.isEmpty() || 
					city.isEmpty() || state.isEmpty() || zip.isEmpty() || phone.isEmpty() || 
					email.isEmpty() || balance.isEmpty() || totalSales.isEmpty()
					)
					{
						message = "All text boxes required except Notes.";
						url = "/customerform.jsp";
					} 
				else
					{
						message = "";
						url = "/thanks.jsp";
					}
				request.setAttribute("user", user);
				request.setAttribute("message", message);
			}
		getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request, response);
	}    
}
