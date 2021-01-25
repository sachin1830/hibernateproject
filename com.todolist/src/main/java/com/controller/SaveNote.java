package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Note;
import com.helper.HibernateHelper;


public class SaveNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
		//here we are getting result from user
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		//here we are creating object setting data to note object
		Note note=new Note();
		note.setTitle(title);
		note.setAddDate(new Date());
		note.setDescription(content);
		
		//here we are saving object to database using Hibernate
		//here we do not need any DAO object because hibernate will do that
		SessionFactory factory=HibernateHelper.getFactory();
		Session session=factory.openSession();
		Transaction tx=session.beginTransaction();
		
		session.save(note);
		
		tx.commit();
		
		
//		Query q=session.createQuery("from Note");
//		
//		List<Note> list=q.list();
//		
//		for(Note no:list)
//		{
//			System.out.println(no.getTitle());
//		}
//		
		session.close();
		factory.close();
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h1 class='text-center'>Successfully added note</>");
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
