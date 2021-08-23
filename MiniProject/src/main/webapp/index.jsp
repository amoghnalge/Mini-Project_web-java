<%@page import="com.project.product.entities.Category"%>
<%@page import="modal.CategoryDao"%>
<%@page import="com.project.product.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="modal.ProductDao"%>

<%@page import="com.project.product.helper.FactoryProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="Components/style.jsp"%>

</head>
<body>

	<%@include file="Components/navbar.jsp"%>
	<div class="row mt-3 mx-2">
		<%
		ProductDao dao = new ProductDao(FactoryProvider.getfactory());
		List<Product> list = dao.getallProducts();
		CategoryDao cdao = new CategoryDao(FactoryProvider.getfactory());
		List<Category> clist = cdao.getCategories();
		%>
		<div class="col-md-2">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action active"
					aria-current="true"> All Products </a>
					
			
				<%
				
				for (Category category : clist) {
					
				%>
					  <a href="#" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>

				<%	
				}
				%>
 
            </div>
	  </div>


			<div class="col-md-8">
				<div class="row mt-2">
				    <div class="col md-12">
				         <div class="card-columns">
				         
				         <%
				         for(Product p:list){
				         
				         %>
				         <div class="card">
				            <div class="card-body">
				         
				                 <h5 class="card-title"><%= p.getpName() %></h5>
				                 <p class="card-text">
				                 
				                 <%= p.getpDescription() %>
				                 </p>
				                 <button type="button" class="btn btn-light btn-sm"><h5>Rs <%= p.getpPrice()%></h5></button>&nbsp;&nbsp;
				                <a href="delete?id=<%= p.getpId() %>" class="btn btn-danger btn-sm" tabindex="-1" role="button" aria-disabled="true">Delete</a>
				                <a href="update?upid=<%= p.getpId() %>" class="btn btn-primary btn-sm" tabindex="-1" role="button" aria-disabled="true">Update</a>
				                 
				                
				                 
				                 
				         
				             </div>
				         
				         </div>
				         
				         
				         <%
				         }
				         %>
				         
				         </div>
				
				    </div>
				
				
				
				</div>


			</div>


		</div>
</body>
</html>