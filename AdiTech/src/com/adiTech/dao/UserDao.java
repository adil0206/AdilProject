package com.adiTech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.adiTech.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	//insert user 
	public boolean insertUser(User user) {
		boolean f=false;
		try {
			//user -->database
			String query = "INSERT INTO USER(NAME,EMAIL,PASSWORD,GENDER,ABOUT) VALUES(?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1,user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	//get user by user email and user password
	public User getUserByEmailAndPassword(String email,String password) {
		User user=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			String query="SELECT * FROM USER WHERE EMAIL=? AND PASSWORD=?";
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()) {
				user =new User();
				//data from database
				String name=rs.getString("name");
				user.setName(name);
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDatetime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	//update user details
	public boolean updateDatails(User user) {
		boolean f=false;
		
		try {
			String updateQuery="update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
			PreparedStatement ps=con.prepareStatement(updateQuery);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.setString(6, user.getProfile());
			ps.setInt(7, user.getId());
			//update query
			ps.executeUpdate();
			f=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
}















