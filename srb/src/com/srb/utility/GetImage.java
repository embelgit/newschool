package com.srb.utility;
import java.sql.*;
import java.util.*;
public class GetImage {
	public Vector ImageList() throws SQLException
	{
	Vector vList=new Vector();

	try
	{
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","root");
	Statement stmt=con.createStatement();
	String strSql="SELECT image from teacher_daily_task where pk_teacher_daily_task = 23;";
	//System.out.println("ImageList query–“+strSql);
	ResultSet rs=stmt.executeQuery(strSql);

	while(rs.next()){
	String temp[]=new String[2];
	//temp[0]=rs.getString("Image_id");
	temp[0]=rs.getString("image");
	vList.add(temp);
	}

	}
	catch(Exception e) {
	System.err.print("ImageList Exception : "+e);
	System.err.println("ImageList Exception : "+e.getMessage());
	}

	return vList;
	}
}
