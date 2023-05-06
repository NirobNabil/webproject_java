<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
</head>
<body>
        <style>
        	form{
        	    display : flex;
        	    flex-direction : column ;
        	    align-items : center ;
        } 
        </style>
        <form method = "post" action = "login">
		Email ID:<input type="email" name="email" required> <br/>
    	password:<input type="password" name="password" /><br/>
  	    <input type="submit" value="login" /> 
        </form>
</body>
</html>
