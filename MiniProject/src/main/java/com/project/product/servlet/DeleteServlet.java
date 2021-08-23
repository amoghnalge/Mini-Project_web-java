package com.project.product.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.project.product.entities.Product;
import com.project.product.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int id=Integer.parseInt(request.getParameter("id"));
		Session session=FactoryProvider.getfactory().openSession(); 
		 Transaction tx=session.beginTransaction();
		 Product pr = session.get(Product.class, id);
		 session.delete(pr);
		 tx.commit();
		 session.close();
		 response.sendRedirect("index.jsp");
		
	}

	

}
