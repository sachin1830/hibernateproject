package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.boot.model.source.internal.hbm.Helper;

import com.entities.Note;
import com.helper.HibernateHelper;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			
			Session session=HibernateHelper.getFactory().openSession();
			Transaction tx=session.beginTransaction();
			
			int note_id=Integer.parseInt(request.getParameter("noteId"));
			String note_title=request.getParameter("title");
			String note_desc=request.getParameter("content");
			
			Note note=session.get(Note.class, note_id);
			
			note.setTitle(note_title);
			note.setDescription(note_desc);
			note.setAddDate(new Date());
			
			
			
			tx.commit();
			
			session.close();
			
			response.sendRedirect("all_note.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
