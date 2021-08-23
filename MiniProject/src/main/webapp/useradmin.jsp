<%@page import="com.project.product.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.project.product.helper.FactoryProvider"%>
<%@page import="modal.CategoryDao"%>
<%@page import="com.project.product.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="Components/style.jsp"%>
<link href="css/style.css" rel="stylesheet" type="text/css"></link>

</head>
<body>
	<%@include file="Components/navbar.jsp"%>
	<div class="container admin">
		<div class="container-fluid mt-3">
			<%@include file="Components/message.jsp"%>


		</div>

		<div class="row mt-4">
			<!-- first col -->
			<div class="col md-4">
				<div class="card">
					<div class="card-body text-center text-uppercase">
						<img src="images/man.png" style="max-width: 120px;"
							class="img-fluid img-rounded" alt="usericon">
						<h2>5</h2>
						<h1>Users</h1>

					</div>

				</div>


			</div>
			<!-- second col -->
			<div class="col md-4">
				<div class="card">
					<div class="card-body text-center text-uppercase">
						<img src="images/menu.png" style="max-width: 120px;"
							class="img-fluid img-rounded" alt="usemenu">

						<h2>1856</h2>
						<h1>Categories</h1>

					</div>

				</div>


			</div>
			<!-- third col -->
			<div class="col md-4">
				<div class="card">
					<div class="card-body text-center text-uppercase">
						<img src="images/delivery-box.png" style="max-width: 120px;"
							class="img-fluid img-rounded" alt="delivery">

						<h2>50</h2>
						<h1>Products</h1>

					</div>

				</div>


			</div>


		</div>

		<div class="row mt-3">
			<div class="col md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-uppercase">
						<img src="images/add.png" style="max-width: 120px;"
							class="img-fluid img-rounded" alt="usericon">
						<p class="mt-3">click here to add category</p>
						<h1>Add category</h1>

					</div>

				</div>

			</div>

			<div class="col md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
					<div class="card-body text-center text-uppercase">
						<img src="images/add-to-cart.png" style="max-width: 120px;"
							class="img-fluid img-rounded" alt="usemenu">

						<p class="mt-3">click here to add product</p>
						<h1>add product</h1>

					</div>

				</div>

			</div>


		</div>


	</div>

	<!-- Start modal -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOpServlet" method="post">
						<input type="hidden" name="operation" value="addcategory">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="enter category title" required />

						</div>

						<div class="form-group">
							<textarea name="catDescription" style="height: 250px"
								class="form-control mt-2"
								placeholder="enter category description" required></textarea>
						</div>

						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add category</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>



					</form>




				</div>

			</div>
		</div>
	</div>
	<!-- end modal -->

	<!-- Product modal -->


	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Product
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="ProductOpServlet" method="post">
					<input type="hidden" name="operation" value="addproduct">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Enter title"
								name="pName" required />
						</div>

						<div class="form-group">
							<textarea name="pDesc" style="height: 100px"
								class="form-control mt-2" placeholder="enter productdescription"
								required ></textarea>
						</div>

						<div class="form-group">
							<input type="number" class="form-control mt-2"
								placeholder="Enter price" name="pPrice" required />
						</div>

						<div class="form-group">
							<input type="number" class="form-control mt-2"
								placeholder="Enter discount" name="pDiscount" required />
						</div>

						<div class="form-group">
							<input type="number" class="form-control mt-2"
								placeholder="Enter product Quantity" name="pQuantity" required />
						</div>

                        <!-- for product category -->
                          <%
                           CategoryDao cdao= new CategoryDao(FactoryProvider.getfactory());
                          List<Category> list=cdao.getCategories();
                          
                          %>
                          
                          
                          
                       <div class="form-group">
                       
                        <select name="catId" class="form-control mt-2" id="">
                        
                         
                        <%
                          for(Category c:list)
                          {
                        %>
                        
                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                        
                        
                        <% } %>
						</select>	
					</div>
						
						<div class="container text-center mt-2">
						<button class="btn btn-outline-success">Add Product</button>
						<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
						</div>



					</form>

				</div>
				
			</div>
		</div>
	</div>

	<!-- end product -->

</body>
</html>