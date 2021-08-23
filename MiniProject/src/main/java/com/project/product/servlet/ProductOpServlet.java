package com.project.product.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.product.entities.Category;
import com.project.product.entities.Product;
import com.project.product.helper.FactoryProvider;

import modal.CategoryDao;
import modal.ProductDao;

public class ProductOpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try (PrintWriter out = response.getWriter()) {
			
			//two operations 1)add category 2)add product
			String op = request.getParameter("operation");
//			
			
			if(op.trim().equals("addcategory"))
			{
				//add category
				String title=request.getParameter("catTitle");
				String description=request.getParameter("catDescription");
				
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDiscription(description);
				
				//to store category in database
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getfactory());
			int catId=categoryDao.saveCategory(category);
				//out.println("category saved");
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("message", "category added successfully : "+catId);
			response.sendRedirect("useradmin.jsp");
			return;

				
				
			}else if (op.trim().equals("addproduct")) {
				//add product
				String pname=request.getParameter("pName");
				String pdesc=request.getParameter("pDesc");
				
				int pprice=Integer.parseInt(request.getParameter("pPrice"));
				int pdiscount=Integer.parseInt(request.getParameter("pDiscount"));
				int pquqntity=Integer.parseInt(request.getParameter("pQuantity"));
				int pcatid=Integer.parseInt(request.getParameter("catId"));
				
				
				Product p=new Product();
				p.setpName(pname);
				p.setpDescription(pdesc);
				p.setpPrice(pprice);
				p.setpDiscount(pdiscount);
				p.setpQuantity(pquqntity);
				
				CategoryDao dao=new CategoryDao(FactoryProvider.getfactory());
				Category category=dao.getCategoryByid(pcatid);
				p.setCategory(category);
				ProductDao pdao=new ProductDao(FactoryProvider.getfactory());
				pdao.saveProduct(p);
				//out.println("save");
				
				HttpSession httpsession=request.getSession();
				httpsession.setAttribute("message", "product added successfully" );
				response.sendRedirect("useradmin.jsp");
				return;

			
			}
			
		
	}

 }
	
}
