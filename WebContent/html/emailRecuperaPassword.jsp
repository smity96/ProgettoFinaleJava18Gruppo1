<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

     <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
    
     <style>
        .stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
        
     </style>
     
      <!-- Google fonts link -->
     <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
   
    <!--Bootstrap links-->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />

</head>
<body class="bg-dark">

  <!-- Navbar -->
  
<jsp:include page= "navbarNotte.jsp"></jsp:include>

    <!-- Inserisci email per il recupero password -->
<br>
    <br>
    <br> 
    <form action="<%=request.getContextPath() %>/ServletRecuperoPassword" method="post">
    
    <p class="text-warning text-center mt-4 stile">Inserisci qui il tuo indirizzo di posta elettronica. 
    <br>
    Ti invieremo un'email con la tua vecchia password. 
    <br>
    <br>
    <input type="email" name="email" class="btn rounded text-center bg-light" placeholder="Email">
    <br>
    <br>
    <button class="btn btn-outline-warning text-center text-light stile" type="submit"><a href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/html/emailPasswordInviata.jsp"></a>
    Invia
    </button>
    </p>
    </form>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    
     <!-- Footer: -->
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