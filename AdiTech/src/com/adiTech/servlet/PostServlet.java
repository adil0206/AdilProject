package com.adiTech.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.adiTech.dao.PostDao;
import com.adiTech.entities.Post;
import com.adiTech.entities.User;
import com.adiTech.helper.ConnectionProvider;
import com.adiTech.helper.Helper;

@MultipartConfig
@WebServlet("/postServlet")
public class PostServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=null;
		try {
			out=response.getWriter();
			int cid=Integer.parseInt(request.getParameter("cid"));
			String pTitle=request.getParameter("post-title");
			String pContent=request.getParameter("post-content");
			String pCode=request.getParameter("post-code");
			Part part=request.getPart("post-pic");
			//getting current user id
			HttpSession ses=request.getSession();
			User user=(User)ses.getAttribute("currentUser");
			//public Post(String pName, String pTitle, String pContent, String code, String pic, Timestamp pDate, String cid,String userId)
			Post post=new Post(user.getName(),pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
			PostDao postdao=new PostDao(ConnectionProvider.getConnection());
			if(postdao.savePost(post)) {
				
				@SuppressWarnings("deprecation")
				String path=request.getRealPath("/")+"post_pic"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
				Helper.saveProfile(part.getInputStream(), path);
				out.println("Successful");
			}
			else {
				out.println("error !");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
