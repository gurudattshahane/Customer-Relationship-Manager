<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer List</title>
<link rel="stylesheet" href="/css/customerList.css">
</head>
<body>
	<header>
		<h1>CRM - Customer Relationship Manager</h1>
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
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}">
					<tr>
						<td>${customer.getId()}</td>
						<td>${customer.getFirstName()}</td>
						<td>${customer.getLastName()}</td>
						<td>${customer.getEmail()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>