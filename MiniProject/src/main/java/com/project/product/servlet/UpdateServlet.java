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

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id2=Integer.parseInt(request.getParameter("upid"));
		Session session=FactoryProvider.getfactory().openSession(); 
		 Transaction tx=session.beginTransaction();
		 Product pr = session.get(Product.class, id2);
		 pr.setpName("samsung");
		 pr.setpPrice(220600);
		 session.update(pr);
		 tx.commit();
		 session.close();
		 response.sendRedirect("index.jsp");
	}

}
