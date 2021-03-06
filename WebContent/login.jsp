<%@page import="model.Utente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
      <title></title>
        
        <!--Bootstrap links-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>

<body class="bg-dark text-center"> 
    
    <!--Form del login: -->
    <form class="form-signin" action="/ProgettoFinaleJava18Gruppo1/ServletAccessoUtente" method="post">
        <img class="mb-4 mt-5" src="../src/logocinema.png" alt="Logo" width="72" height="72">
        <p class="h3 mb-3 text-warning">Accedi:</p>
          <p class="text-warning"><input class="rounded" name="email" type="email" placeholder="Email"></p>
        <p class="text-warning mr-0"><input  class="rounded" name="password" type="password" placeholder="Password"></p>
        <button class="btn text-light btn-outline-warning">Accedi</button>
        <br>
        <br>
        
        <!--Registrati da questo link: -->
        <p class="text-warning">Non sei registrato?</p>
        <a class="text-warning" href="registrazione.jsp">Registrati qui!</a>
    </form>

        <!--Bootstrap links-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
</body>
</html>