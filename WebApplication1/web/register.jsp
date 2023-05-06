<!DOCTYPE html>
<html>
<head>
		
	<title> Registration Form </title>
	<style type="text/css">
	body {
			font-family: Arial, sans-serif;
			background-color: #e6f5ff;
		} 
			
	/*	body {
         background-image: url('/home/shimlakanu/Downloads/backgroundImage/mandala2.png');
         background-repeat: no-repeat;
         background-size: cover;
      } */	
		
		h1 {
			text-align: center;
		}
		form {
			background-color: #A9A9A9;
			padding: 20px; 
			margin: 20px auto; 
 			width: 50%; 
 			height: 350px; 
			border-radius: 20px;
 			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); 
	
		}
		input[type=text], input[type=email], input[type=password] {
			width: 100%;
			padding: 12px 20px;
			margin: 8px 0;
			display: inline-block;
			border: 1px solid #ccc;
			border-radius: 4px;
			box-sizing: border-box;
		}
		input[type=submit] {
			background-color: #008B8B;
			color: white;
			padding: 14px 20px;
			margin: 8px 0;
			border: none;
			border-radius: 4px;
			cursor: pointer;
		}
		input[type=submit]:hover {
			background-color: #008B8B;
		}
		.container {
			padding: 5px;
		}
		
		@keyframes fade-in {
  		from {
    		opacity: 0;
  		}
  		to {
    		opacity: 1;
 		}
	}

		.welcome {
		  font-size: 30px;
		  text-align: center;
		  animation: fade-in 3s ease-in-out;
		}	
	
	
	body {
         background-image: url('Home/Downloads/background/mandalaArt.jpg');
         background-repeat: no-repeat;
         background-size: cover;
      }	
	</style>

</head>
<body>
	<div class="welcome">
  		  <h2>Welcome to our registration page!</h2>
  	</div>
	<form action="register" method="post">
		<div class="container">
			<label for="firstname"><b>First Name </b></label> 
			<input type="text" placeholder="Enter your first name" name="firstname" required><br>
			<label for="lastname"><b>Last Name </b> </label> 
			<input type="text" placeholder="Enter your last name" name="lastname" required><br>
			<label for="email"><b>Email-address </b> </label> 
			<input type="email" placeholder="Enter email-address" name="email" required><br>
			<label for="password"><b>Password </b> </label> 
			<input type="password" placeholder="Enter password" name="password" required><br> 
			<input type="submit" value="Register"><br>
		</div>
	</form>
</body>
</html>