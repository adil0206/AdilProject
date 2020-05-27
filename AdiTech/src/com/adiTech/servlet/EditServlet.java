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

import com.adiTech.dao.UserDao;
import com.adiTech.entities.Message;
import com.adiTech.entities.User;
import com.adiTech.helper.ConnectionProvider;
import com.adiTech.helper.Helper;

@MultipartConfig
@WebServlet("/editServlet")
public class EditServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=null;
		try {
			out=response.getWriter();
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String about=request.getParameter("user_about");
			Part part=request.getPart("user_profile");
			String profileName=part.getSubmittedFileName();
			//get the user from the session
			HttpSession ses=request.getSession();
			User user=(User)ses.getAttribute("currentUser");
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setAbout(about);
			String oldFile=user.getProfile();
			user.setProfile(profileName);
			
			//update details
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			boolean bool = dao.updateDatails(user);
			if(bool) {
				
				String path=request.getRealPath("/")+"img"+File.separator+user.getProfile();
				String pathOldFile=request.getRealPath("/")+"img"+File.separator+oldFile;
				Helper.deleteProfile(pathOldFile);
				if(Helper.saveProfile(part.getInputStream(), path)){
					Message msg=new Message("Update your Details", "success", "alert-success");
					ses.setAttribute("msg", msg); 
				}
				else {
					Message msg=new Message("Something ! went wrong please try again", "error", "alert-danger");
					ses.setAttribute("msg", msg);
				}
			}
			response.sendRedirect("profile.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
