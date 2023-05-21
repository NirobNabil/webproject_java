<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success</title>
<style>
        	h3, span{
        	    display : flex;
        	    flex-direction : column ;
        	    align-items : center ;
                } 
        </style>
</head>
<body>
    <% String username = (String)request.getAttribute("username"); %>
    <h3>Successfully logged in as <%= username %> </h3>
    <span>You will be redirected to home page in 2 seconds </span>
    <script>
        setTimeout( () => {
            window.location.replace("home.jsp")
        }, 2000);
    </script>
    
</body>

</html>
