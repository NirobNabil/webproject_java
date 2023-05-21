<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Success</title>
<style>
        	h1, span{
        	    display : flex;
        	    flex-direction : column ;
        	    align-items : center ;
        } 
        </style>
        <script>
            
        </script>
</head>
<body>
    <h1> Registration Successful </h1>
    <span> You will be automatically redirected to login page in 2 seconds <span>
    <script>
        setTimeout( () => {
            window.location.replace("index.jsp")
        }, 2000);
    </script>
</body>

</html>
