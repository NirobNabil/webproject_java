<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
<style>
        	h3{
        	    display : flex;
        	    flex-direction : column ;
        	    align-items : center ;
        } 
        </style>
</head>
<body>
    <h1>User Info</h1>
    
  <p>First Name: ${user.getFirstName()}</p>
  <p>Last Name: ${user.getLastName()}</p>
  <p>Email: ${user.getEmail()}</p>
  <p>Id: ${user.getId()}</p>
</body>

</html>
