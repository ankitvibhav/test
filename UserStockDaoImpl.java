package controller;

import java.sql.*;

public class UserStockDaoImpl implements UserStockDao{

	Connection con;
	private void getConnection(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@10.232.71.29:1521:INATP02","shobana","shobana");
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	public String insertion(String user,String[] company){
		getConnection();
		PreparedStatement ps;
		String status="";
		String query="insert into T_XBBL5SF_COMP values(?,?,?)";
		try {
			 String time = ""+(new Timestamp((new java.util.Date()).getTime()));
				
			for(String c:company){
			 ps= con.prepareStatement(query);
			 System.out.println(time);
			ps.setString(1,c);
			ps.setString(2,time);
			ps.setString(3,user);
			ps.executeUpdate();
			status= time;
			}
		}catch (SQLException e) {
			e.printStackTrace();
			status= "500";
		}
		System.out.println("Here:"+status);
		
		return status;
	}
	
}
