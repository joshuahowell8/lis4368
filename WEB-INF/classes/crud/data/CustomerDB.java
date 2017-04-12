package crud.data;

import java.sql.*;
import java.util.ArrayList;

import crud.business.Customer;

public class CustomerDB
{
	//insert method (pass customer object to parameter customer)
	public static int insert(Customer customer)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		
		String query = "INSERT INTO customer (cus_fname, cus_lname, cus_street, cus_city, cus_state, cus_zip, cus_phone, cus_email, cus_balance, cus_total_sales, cus_notes) "
						+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, customer.getFname());
			ps.setString(2, customer.getLname());
			ps.setString(3, customer.getStreet());
			ps.setString(4, customer.getCity());
			ps.setString(5, customer.getState());
			ps.setString(6, customer.getZip());
			ps.setString(7, customer.getPhone());
			ps.setString(8, customer.getEmail());
			ps.setString(9, customer.getBalance());
			ps.setString(10, customer.getTotalSales());
			ps.setString(11, customer.getNotes());
			
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
		
	}
	
	//update method
	public static int update(Customer customer)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		
		String query = "UPDATE customer SET "
				+ "cus_fname = ? "
				+ "cus_lname = ? "
				+ "WHERE cus_email = ?";
		try {
			ps = connection.prepareStatement(query);
			ps.setString(1, customer.getFname());
			ps.setString(2, customer.getLname());
			ps.setString(3, customer.getEmail());
			
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
	
	//delete method
	public static int delete(Customer customer)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		
		String query = "DELETE FROM customer WHERE cus_email = ?";
		try
		{
			ps = connection.prepareStatement(query);
			ps.setString(1, customer.getEmail());
			
			return ps.executeUpdate();
		}
		catch (SQLException e) 
		{
			System.out.println(e);
			return 0;
		}
		finally
		{
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
	
	//check if email exists method
	public static boolean emailExists(String email)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "SELECT cus_email FROM customer WHERE cus_email = ?";
		try
		{
			ps = connection.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			return rs.next();
		}
		catch(SQLException e)
		{
			System.out.println(e);
			return false;
		}
		finally
		{
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
	
	//retrieve one customer method
	public static Customer selectCustomer(String email)
	{
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM customer WHERE cus_email = ?";
		try
		{
			ps = connection.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			Customer customer = null;
			if(rs.next())
			{
				customer = new Customer();
				customer.setFname(rs.getString("fname"));
				customer.setLname(rs.getString("lname"));
				customer.setEmail(rs.getString("email"));
			}
			return customer;
		}
		catch (SQLException e)
		{
			System.out.println(e);
			return null;
		}
		finally
		{
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
	
	//retrieve all customers method (using ArrayList)
	public static ArrayList<Customer> selectCustomers()
	{
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection connection = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String query = "SELECT * FROM customer";
		try
		{
			ps = connection.prepareStatement(query);
			rs = ps.executeQuery();
			ArrayList<Customer> customers = new ArrayList<Customer>();
			while(rs.next())
			{
				Customer customer = new Customer();
				customer.setFname(rs.getString("fname"));
				customer.setLname(rs.getString("lname"));
				customer.setEmail(rs.getString("email"));
				customers.add(customer);
			}
			return customers;
		}
		catch(SQLException e)
		{
			System.out.println(e);
			return null;
		}
		finally
		{
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(connection);
		}
	}
}














