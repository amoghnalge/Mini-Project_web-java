package com.project.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.project.product.entities.User;
import com.project.product.helper.FactoryProvider;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		response.setContentType("text/html");
		try (PrintWriter out=response.getWriter()) {
			
			try {
				
				String userName=request.getParameter("username");
				String userEmail=request.getParameter("useremail");
				String userPassword=request.getParameter("userpassword");
				String userPhone=request.getParameter("userphone");
				String userAddress=request.getParameter("useraddress");
				String userType=request.getParameter("usertype");
				
			
				//validations
				
				
				
				//user object to store data
				User user=new User(userName, userEmail, userPassword, userPhone, userAddress,userType);
				Session hibernateSession=FactoryProvider.getfactory().openSession();
				Transaction tx=hibernateSession.beginTransaction();
				int userId=(int)hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
				
				HttpSession httpsession=request.getSession();
				httpsession.setAttribute("message", "Registration Successful : "+userId);
				
				response.sendRedirect("register.jsp");
				return;
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			
		}
		
	}
	

}
