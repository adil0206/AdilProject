package com.adiTech.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adiTech.dao.UserDao;
import com.adiTech.entities.Message;
import com.adiTech.entities.User;
import com.adiTech.helper.ConnectionProvider;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//login 
			//Fetch user email and password from request(login page)
			String userEmail=request.getParameter("email");
			String userPassword=request.getParameter("password");
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			User user=dao.getUserByEmailAndPassword(userEmail, userPassword);
			
			if(user==null) {
				//error
				Message msg=new Message("Invalid details ! try with another ", "error", "alert-danger");
				HttpSession ses=request.getSession();
				ses.setAttribute("msg", msg); 
				
				response.sendRedirect("login.jsp");
			}
			else {
				HttpSession ses=request.getSession();
				ses.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
