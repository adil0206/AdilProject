package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.adil.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SaveNoteServlet() {
        super();
      
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//title , content fetch
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Note note=new Note(title,content,new Date());
			//System.out.println(note.getId()+":"+note.getTitle());
			//hibernate save
			Session ses=FactoryProvider.getFactory().openSession();
			Transaction tx=ses.beginTransaction();
			ses.save(note);
			tx.commit();
			ses.close();
			PrintWriter pw=response.getWriter();
			response.setContentType("text/html");
			pw.println("<h1 style='text-align:center;color:green'>added successfully</h1>");
			pw.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>view all notes</a></h1>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
