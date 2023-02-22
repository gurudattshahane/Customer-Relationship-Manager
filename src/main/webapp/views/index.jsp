<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="/css/style.css" />
</head>
<body>
	<header>
		<h1><a href="http://localhost:8080/">CRM - Customer Relationship Manager</a></h1>
	</header>
	<main>
		<div class="card-container">
			<a class="card" href="/customer-list">Get List of Customers</a>
			<a class="card" href="/customer-update">Update Customer Details</a>
			<a class="card" href="/customer-add">Add Customer</a>
			<a class="card" href="/customer-delete">Delete Customer</a>
		</div>
	</main>
</body>
</html>