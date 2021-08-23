<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="Components/style.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>
     
     
     <div class="container-fluid">
     
     <div class="row md-5">
		<div class="col-md-4 offset-md-4">
         <div class="card">
         <%@include file="Components/message.jsp" %>
         <div class="card-body">
         
            <h3 class="text-center my-4">Registration</h3>
			<form action="RegisterServlet" method="post">
				<div class="mb-3">
					<label for="name" class="form-label">User
						Name</label> <input type="text" name="username" placeholder="Enter here" class="form-control" id="name"
						aria-describedby="emailHelp" required/>

				</div>
				
				<div class="mb-3">
					<label for="email" class="form-label">User
						Email</label> <input type="email" name="useremail" placeholder="Enter here" class="form-control" id="email"
						aria-describedby="emailHelp" required/>

				</div>
				
				<div class="mb-3">
					<label for="password" class="form-label">User
						Password</label> <input type="password" name="userpassword" placeholder="Enter here" class="form-control" id="password"
						aria-describedby="emailHelp" required/>

				</div>
				
				<div class="mb-3">
					<label for="phone" class="form-label">User
						Phone</label> <input type="number" name="userphone" placeholder="Enter here" class="form-control" id="phone"
						aria-describedby="emailHelp" required/>

				</div>
				
				<div class="mb-3">
					<label for="address"  class="form-label">User
						address</label> 
						<textarea class="form-control" name="useraddress" placeholder="Enter your address" required/></textarea>

				</div>
				
				
				<div class="mb-3">
					<label for="type" class="form-label">User
						Type</label> <input type="text" name="usertype" placeholder="Enter here" class="form-control" id="type"
						aria-describedby="emailHelp" required/>

				</div>
				
				<div class="container text-center">
				<button class="btn btn-outline-success">Register</button>
				<button class="btn btn-outline-warning">Reset</button>
				
				
				</div>



			</form>
         
         
         </div>
         
         
         </div>

		</div>
	</div>
     
     </div>
     
     
	
</body>
</html>