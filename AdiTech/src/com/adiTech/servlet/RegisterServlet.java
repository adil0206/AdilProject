package com.adiTech.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adiTech.dao.UserDao;
import com.adiTech.entities.User;
import com.adiTech.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/registerurl")
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=null;
		try {
			out=response.getWriter();
			String check=request.getParameter("check");
			//Fetch all form data
			if(check==null) {
				out.println("check box is not checked");
			}
			else {
				String name=request.getParameter("user_name");
				String email=request.getParameter("user_email");
				String password=request.getParameter("user_password");
				String gender=request.getParameter("gender");
				String about=request.getParameter("about");
				//create User class object
				User user=new User(name,email,password,gender,about);
				//create UserDao class object
				UserDao dao=new UserDao(ConnectionProvider.getConnection());
				if(dao.insertUser(user)) {
					out.println("done");
				}
				else {
					out.println("error");
				}
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
