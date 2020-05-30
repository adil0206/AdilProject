package com.adiTech.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.adiTech.entities.Category;
import com.adiTech.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	public ArrayList<Category> getCategories(){
		ArrayList<Category> list=new ArrayList<>();
		try {
			String query="select * from categories";
			Statement st =this.con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()) {
				int cid=rs.getInt("cid");
				String name=rs.getString("name");
				String description =rs.getString("description");
				Category cat=new Category(cid,name,description);
				list.add(cat);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	//Save Post
	public boolean savePost(Post post) {
		boolean f=false;
		try {
			String query="insert into post(pName,pTitle,pContent,Code,pic,cid,userId)values(?,?,?,?,?,?,?)";
			PreparedStatement ps=this.con.prepareStatement(query);
			ps.setString(1, post.getpName() );
			ps.setString(2, post.getpTitle() );
			ps.setString(3, post.getpContent());
			ps.setString(4, post.getCode());
			ps.setString(5, post.getPic());
			ps.setInt(6, post.getCid());
			ps.setInt(7, post.getUserId());
			ps.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	//get all post
	public List<Post> getAllPost(){
		List<Post> list=new ArrayList<>();
		try {
			String query="select * from post";
			PreparedStatement ps= con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				int pId=rs.getInt("pId");
				String pName=rs.getString("pName");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String code=rs.getString("Code");
				String pic=rs.getString("pic");
				Timestamp pDate=rs.getTimestamp("pDate");
				int cid=rs.getInt("cid");
				int userId=rs.getInt("userId");
				/*
				  int pid, String pName, String pTitle, String pContent, String code, String
				  pic, Timestamp pDate, int cid,int userId
				 */
				Post post=new Post(pId,pName,pTitle, pContent, code, pic, pDate, cid, userId);
				list.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	//get post by category id
	public List<Post> getPostByCatId(int cid){
		List<Post> list=new ArrayList<>();
		try {
			String query="select * from post where cid=?";
			PreparedStatement ps= con.prepareStatement(query);
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				int pId=rs.getInt("pId");
				String pName=rs.getString("pName");
				String pTitle=rs.getString("pTitle");
				String pContent=rs.getString("pContent");
				String code=rs.getString("Code");
				String pic=rs.getString("pic");
				Timestamp pDate=rs.getTimestamp("pDate");	
				int userId=rs.getInt("userId");
				/*
				  String pName, String pTitle, String pContent, String code, String
				  pic, Timestamp pDate, int cid,int userId
				 */
				Post post=new Post(pName,pTitle, pContent, code, pic, pDate, cid, userId);
				list.add(post);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}















