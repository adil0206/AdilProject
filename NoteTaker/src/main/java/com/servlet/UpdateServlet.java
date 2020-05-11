package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.adil.Note;
import com.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateServlet() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String e_title=request.getParameter("editTitle");
			String e_content=request.getParameter("editContent");
			int n_id=Integer.parseInt(request.getParameter("noteId").trim());
			Session ses=FactoryProvider.getFactory().openSession();
			Transaction tx=ses.beginTransaction();
			Note note=(Note)ses.get(Note.class, n_id);
			note.setTitle(e_title);
			note.setContent(e_content);
			note.setAddedDate(new Date());
			tx.commit();
			ses.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
