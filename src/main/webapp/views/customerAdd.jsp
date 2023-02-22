<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Customer</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="/css/customerAdd.css">
</head>
<body>
	<header>
		<h1><a href="http://localhost:8080/">CRM - Customer Relationship Manager</a></h1>
	</header>
	<main>
		<h2>Enter Customer Details</h2>
		<form id="customer-add-form">
			<div class="row">
				<label for="firstname">First Name: </label>
				<input id="firstname" type="text" name="firstName" required>
			</div>
			<p id="firstname-error-msg">Please enter valid name</p>
			<div class="row">
				<label for="lastname">Last Name: </label>
				<input id="lastname" type="text" name="lastName" required>
			</div>
			<p id="lastname-error-msg">Please enter valid name</p>
			<div class="row">
				<label for="email">Email: </label>
				<input id="email" type="email" name="email" required>	
			</div>
			<p id="email-error-msg">Please enter valid email</p>			
			<div class="submit-btn-wrapper">
				<input id="submitbtn" type="submit">
			</div>
			<p id="error-msg">Please enter valid details</p>
		</form>
		
	</main>
	<script type="text/javascript">
		window.onload = function(){
			let submitbtn = document.querySelector('#submitbtn');
			let fnameErrMsg = document.querySelector("#firstname-error-msg");
			let lnameErrMsg = document.querySelector("#lastname-error-msg");
			let emailErrMsg = document.querySelector("#email-error-msg");
			let fname = document.querySelector("#firstname");
		    let lname = document.querySelector("#lastname");
		    let email = document.querySelector("#email");
			const isDataValid = {fname:false, lname:false, email:false};
		    
		    fname.addEventListener('input',(e)=>{
		    	if(!(/^[a-z]+$/ig.test(fname.value))){
					fnameErrMsg.style.display = "block";
					isDataValid.fname = false;
				}else{
					fnameErrMsg.style.display = "none";
					isDataValid.fname = true;
				}
		    });
		    fname.addEventListener('blur',(e)=>{
		    	if(!(/^[a-z]+$/ig.test(fname.value))){
					fnameErrMsg.style.display = "block";
					isDataValid.fname = false;
				}else{
					fnameErrMsg.style.display = "none";
					isDataValid.fname = true;
				}
		    });
		    lname.addEventListener('input',(e)=>{
		    	if(!(/^[a-z]+$/ig.test(lname.value))){
					lnameErrMsg.style.display = "block";
					isDataValid.lname = false;
				}else{
					lnameErrMsg.style.display = "none";
					isDataValid.lname = true;
				}
		    });
		    lname.addEventListener('blur',(e)=>{
		    	if(!(/^[a-z]+$/ig.test(lname.value))){
					lnameErrMsg.style.display = "block";
					isDataValid.lname = false;
				}else{
					lnameErrMsg.style.display = "none";
					isDataValid.lname = true;
				}
		    });
		    email.addEventListener('input',(e)=>{
		    	if(!(/^[a-z0-9\.-]*@{1}[a-z]+(\.)[a-z]+$/ig.test(email.value))){
					emailErrMsg.style.display = "block";	
					isDataValid.email = false;
				}else{
					emailErrMsg.style.display = "none";
					isDataValid.email = true;
				}
		    });
		    email.addEventListener('blur',(e)=>{
		    	if(!(/^[a-z0-9\.-]*@{1}[a-z]+(\.)[a-z]+$/ig.test(email.value))){
					emailErrMsg.style.display = "block";	
					isDataValid.email = false;
				}else{
					emailErrMsg.style.display = "none";
					isDataValid.email = true;
				}
		    });
		    
			submitbtn.addEventListener('click', (e)=>{
			    e.preventDefault();
			    
			    if(!(isDataValid.fname && isDataValid.lname && isDataValid.email)){ 
			    	document.querySelector("#error-msg").style.display= "block";
			    	return;
			    }else{
			    	document.querySelector("#error-msg").style.display= "none";
			    }
			    let data = {"firstname":fname.value, "lastname":lname.value, "email":email.value};
			    let url = "http://localhost:8080/customer-add";
			    fetch(url, {
			    	method: "POST",
			    	body: JSON.stringify(data),
			    	headers: {
			    		Accept: "*/*",
		                "Content-Type": "application/json"
			    	},
			    	
			    }).then(response=>response.json())
			    .then(()=>{
			    	document.querySelector("#customer-add-form").reset();
			    	alert(JSON.stringify(data)+" added successfully");
			    	})
			    .catch(err => alert("Something went wrong "+ err));
			});
		}
		
				
	</script>
</body>
</html>