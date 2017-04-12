package crud.data;
//package is a set of classes that can be grouped together for similar functionality
import java.sql.*;

//database connection cleanup: close staements, prepared staements, and result sets
public class DBUtil
{
	public static void closeStatement(Statement s)
	{
		try
		{
			if(s != null)
			{
				s.close();
			}
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}
	
	public static void closePreparedStatement(Statement ps)
	{
		try
		{
			if(ps != null)
			{
				ps.close();
			}
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}
	
	public static void closeResultSet(ResultSet rs)
	{
		try
		{
			if(rs != null)
			{
				rs.close();
			}
		}
		catch (SQLException e)
		{
			System.out.println(e);
		}
	}

}