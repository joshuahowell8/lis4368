// save as "<TOMCAT_HOME>\webapps\lis4368\WEB-INF\classes\crud\info\CustomerListServlet.java"
/*
1. Compile:
Windows:
  cd to C:\tomcat\webapps\lis4368\WEB-INF\classes
  javac -cp .;c:\tomcat\lib\servlet-api.jar crud/info/CustomerServlet.java

Mac: 	
  cd to /Applications/tomcat/webapps/lis4368/WEB-INF/classes
  javac -cp .:/Applications/tomcat/lib/servlet-api.jar crud/info/CustomerListServlet.java

2. Run: http://localhost:9999/lis4368/customerList
*/
package crud.info;

import java.io.*;

//Note: ArrayList provides *dynamic* resizable-array (i.e., items can be added and removed from list) unlike simple array
import java.util.*; //example: ArrayList<SomeCollection>
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
 
import crud.business.Customer;
import crud.data.CustomerDB;

//servlet mapping for Servlet 3.0

//servlet CustomerList is mapped to the URL pattern /customerList. When accessing this servlet, it will return a message.
@WebServlet("/customerAdmin")
public class CustomerServlet extends HttpServlet
{
	//perform different request data processing depending on transfer method (here, Post or Get)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
	{
		//if no current session, returns new session (*NOT* needed here: only for demo purposes)
		HttpSession session = request.getSession();
		
		String url = "/index.jsp"; //initialize url value (used for logic below)
        
		//initialize current action and customer id
		String action = null;
		String cid = null;
		
		//set actions and customer ids accordingly
		if(request.getParameter("display_customer") != null)
		{
			action = "display_customer";
			//get id from display_customer name property (from Edit button modify.jsp)
			cid = request.getParameter(action);
		}
		//from customerform.jsp
		else if(request.getParameter("add_customer") != null)
		{
			action = "add_customer";
			cid = null; //auto-increment value
		}
		//get id from update_customer name property (from customer.jsp)
		else if(request.getParameter("update_customer") != null)
		{
			action = "update_customer";
			cid = request.getParameter(action);
		}
		//get id from delete_customer name property (from Delete button modify.jsp)
		else if(request.getParameter("delete_customer") != null)
		{
			action = "delete_customer";
			cid = request.getParameter(action);
		}
		//from thanks.jsp
		else if(request.getParameter("thanks") != null)
		{
			action = "join";
		}
		else
		{
			url = "/index.jsp"; //main page
		}
		
		if (action.equals("join"))
		{
				url = "/customerform.jsp";    // the "join" page
		}
		else if(action.equals("display_customer"))
		{
			//String cid = request.getParameter("id");
			Customer user = CustomerDB.selectCustomer(cid);
			session.setAttribute("user", user);
			url = "/customer.jsp";
		}
		else if (action.equals("add_customer"))
			{
				// get parameters from the request (data conversions not required here)
				//Reality-check: zip should be int, phone long, balance and totalSales BigDecimal data types
				String id = request.getParameter(null); //need for auto increment pk field
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
				
				// store data in Customer object: user
				Customer user = new Customer(id, firstName, lastName, street, city, state, zip, phone, email, balance, totalSales, notes);

				//declare message variable
				String message;
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
						CustomerDB.insert(user);
					}
				request.setAttribute("user", user);
				request.setAttribute("message", message);
			}
		else if(action.equals("update_customer"))
		{
			//get parameters from the request
				
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
			
			//get and update customer
			Customer user = (Customer) session.getAttribute("user");
			user.setId(cid); //returned from request.getParameter(action);
			user.setFname(firstName);
			user.setLname(lastName);
			user.setStreet(street);
			user.setCity(city);
			user.setState(state);
			user.setZip(zip);
			user.setPhone(phone);
			user.setEmail(email);
			user.setBalance(balance);
			user.setTotalSales(totalSales);
			user.setNotes(notes);
			
			url = "/modify.jsp";
			//update customer
			CustomerDB.update(user);
			
			//get and set updated customers;
			ArrayList<Customer> users = CustomerDB.selectCustomers();
			request.setAttribute("users", users);
			
		}
		else if(action.equals("delete_customer"))
		{
			//get customer
			Customer user = CustomerDB.selectCustomer(cid);
			
			url = "/modify.jsp";
			//delete customer
			CustomerDB.delete(user);
			
			//get and set updated customers;
			ArrayList<Customer> users = CustomerDB.selectCustomers();
			request.setAttribute("users", users);
		}
		
		
		getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		String url = "/modify.jsp";
		
		//get list of customers
		ArrayList<Customer> users = CustomerDB.selectCustomers();
		request.setAttribute("users", users);
		
		//forward (not redirect)
		getServletContext()
			.getRequestDispatcher(url)
			.forward(request, response);
			
		doPost(request, response);
		
	}    
}
