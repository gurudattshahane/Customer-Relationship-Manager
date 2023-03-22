<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Update</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="/css/customerList.css">
</head>
<body>
	<header>
		<h1>
			<a href="http://localhost:8080/">CRM - Customer Relationship
				Manager</a>
		</h1>
	</header>
	<main>
		<h2>Customer List</h2>
		<table>
			<thead>
				<tr>
					<th>#</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}">
					<tr>
						<td>${customer.getId()}</td>
						<td>${customer.getFirstname()}</td>
						<td>${customer.getLastname()}</td>
						<td>${customer.getEmail()}</td>
						<td><a href="#">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	<script type="text/javascript">
		window.onload = function(){
			let links = document.querySelectorAll("td a");
			let email, lastname, firstname;
			links.forEach((link, index)=>{
					link.addEventListener('click', (e)=>{
						e.preventDefault();
						email = link.parentElement.previousElementSibling;
						lastname = email.previousElementSibling;
						firstname = lastname.previousElementSibling;
						
						data = {"id":index+1, "firstname":firstname.textContent, "lastname":lastname.textContent, "email":email.textContent};
						let confirmation = confirm("Are you sure, you want to delete this customer ?\n"+JSON.stringify(data));
						if(confirmation == true){
							fetch("http://localhost:8080/customer-delete", {
							    method: "DELETE",
							    body: JSON.stringify(data),
							    headers: {
							    	Accept: "*/*",
						            "Content-Type": "application/json"
							    },
							    	
							 }).then(response=>response.json())
							 .then(()=>{
							    alert(JSON.stringify(data)+" deteled successfully");
							  }).catch(err => alert("Something went wrong "+ err));
							location.reload();
						}
						
					});
			});
			
		}
	</script>

</body>
</html>