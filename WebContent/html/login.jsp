<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    
    <style>
        
        .stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
        
     </style>
    
     <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
    

<link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash.css"> 
    <!--Bootstrap links-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
  </head>

  <body class="bg-dark text-center" style="font-family: 'Monserrat', sans-serif">
  
  <!-- Navbar -->
  
<jsp:include page= "navbarNotte.jsp"></jsp:include>
  <!--Form del login: -->
    <form
      class="form-signin"
      action="<%=request.getContextPath() %>/ServletAccessoUtente"
      method="post"
    >
      <img
        class="mb-4 mt-5"
        src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png"
        alt="Logo"
        width="72"
        height="72"
      />
      <p class="h3 mb-3 text-warning stile">Accedi:</p>
      <p class="text-warning stile">
        <input class="rounded" name="email" type="email" placeholder="Email" />
      </p>
      <p class="text-warning mr-0 stile">
        <input
          class="rounded"
          name="password"
          type="password"
          placeholder="Password"
        />
      </p>
      
      
      
      <input type="checkbox" class="form-check-input" id="exampleCheck1" name="ricordami">
    <label class="form-check-label text-warning stile" for="exampleCheck1">Ricordami!</label>
   
      <br>
      <br>
      <button class="btn text-light btn-outline-warning stile">Accedi</button>
      <br />
      <br />
      
      <!-- Password dimenticata -->
      <p class="text-warning stile">Password dimenticata?

      <a
        class="text-warning stile"
        href="/ProgettoFinaleJava18Gruppo1/html/emailRecuperaPassword.jsp"
        >Recupera password.</a
      >
      </p>
<br>
      <!--Registrati da questo link: -->
      <p class="text-warning stile">Non sei registrato?</p>

      <a
        class="text-warning stile"
        href="/ProgettoFinaleJava18Gruppo1/html/registrazione.jsp"
        >Registrati qui!</a
      >
      
      <br>
      <br>
      
    </form>
    
    <jsp:include page= "footer.jsp"></jsp:include>

    <!--Bootstrap links-->
    <script
      src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
      integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
