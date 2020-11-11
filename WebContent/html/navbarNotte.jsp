<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!--Bootstrap links-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  </head>
  <body class="bg-dark">
    <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="../src/logocinema.png" type = "image/x-icon"> 

    <!--Navbar Utente NON loggato: -->
    
    <nav class="navbar navbar-expand-lg bg-secondary navbar-dark">
           <div class="container">

        <!--Se clicchi sul logo vai alla home: -->
        <a class="navbar-brand" href="#">
        <img src="../src/logocinema.png" alt="Logo" style="width:40px;">
      </a>     

      <!--Vai alla Home: -->
      <div class= "col-3">
        <ul class="navbar-left navbar-nav m-auto d-flex flex-row">
          <li class="nav-item m-auto width: 90%">
            <a class="nav-link text-warning font-weight-bold" href="#">Home</a>
          </li>
        </div>

        <!--Vai al palinsesto-->
          <div class="col-3">
          <ul class="navbar-left navbar-nav d-flex flex-row">
          <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning font-weight-bold" href="palinsestoBody.jsp">Palinsesto</a>
          </li>
          </ul>
        </div>

        <!--Vai alla pagina di Login: -->
          <div class="col-3">
          <ul class="navbar-nav d-flex flex-row justify-content-end unstyled">
            <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning d-flex justify-content-end font-weight-bold" href="login.jsp">Login</a>
            </li>
          </div>

          <!--Vai alla pagina di registrazione: -->
            <div class="col-3">
            <ul class="navbar-nav d-flex flex-row justify-content-end">
            <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning d-flex justify-content-end font-weight-bold" href="registrazione.jsp">Registrazione</a>
          </li>    
        </ul>
      </div>
    </nav>
</div>

    <!--Bootstrap links-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
  </body>
</html>