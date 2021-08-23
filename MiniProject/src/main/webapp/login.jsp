<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Components/style.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg ">
						<h3>login</h3>
					</div>
					<div class="card-body">
					<%@include file="Components/message.jsp" %>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email
									address</label> <input type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text"></div>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label>
								<input type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							
							
							<div class="container text-center mt-3">
							<button type="submit" class="btn btn-primary">Submit</button>
							</div>
							<div class="container text-center mt-3">
							<a href="register.jsp">Click here to register</a>
							</div>
							
						</form>
					</div>
					

			</div>
		</div>



	</div>

</body>
</html>