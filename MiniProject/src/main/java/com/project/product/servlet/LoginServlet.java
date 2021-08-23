package com.project.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.product.entities.User;
import com.project.product.helper.FactoryProvider;

import modal.UserDao;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try (PrintWriter out=response.getWriter()) {
			
			//coding
			String email=request.getParameter("email");
			String password=request.getParameter("password");

			
			//user authentication
		    UserDao userDao = new UserDao(FactoryProvider.getfactory());
			User user= userDao.getUserByEmailAndPassword(email, password);
			//System.out.println(user);
			HttpSession httpsession=request.getSession();
			if(user == null) {
				httpsession.setAttribute("message", "Invalid Details!!");
				response.sendRedirect("login.jsp");
				return;
			}
			else
			{
				out.println("<h1> welcome " +user.getUserName() +"</h1>");
				httpsession.setAttribute("current-user",user);
				if(user.getUserType().equals("admin"))
				{
					response.sendRedirect("useradmin.jsp");
				}else if(user.getUserType().equals("normal"))
				{
					response.sendRedirect("normaluser.jsp");
				}else {
					out.println("user not identified");
				}
					
				
			}
		}
	}

}
