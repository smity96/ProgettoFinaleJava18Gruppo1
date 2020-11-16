<%@page import="model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <style>
       
        .stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
          
       </style>
    
 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
   
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash.css">     
    <!--Bootstrap links-->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  </head>
  <%HttpSession s=request.getSession();
  Utente u = (Utente)s.getAttribute("uLog");
  %>
  <body class="bg-dark" style="font-family: 'Montserrat', sans-serif">    
  
  <!--Navbar Utente NON loggato: -->
    <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 

    <nav class="navbar navbar-expand-lg">
           <div class="container">

        <!--Se clicchi sul logo vai alla home: -->
        <a class="navbar-brand" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">
        <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" alt="Logo" style="width:40px;">
      </a>     

      <!--Vai alla Home: -->
      <div class= "col-sm">
        <ul class="navbar-left navbar-nav m-auto d-flex flex-row">
          <li class="nav-item m-auto width: 90%">
            <a class="nav-link text-warning font-weight-bold stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Home</a>
          </li>
          </ul>
        </div>

        <!--Vai al palinsesto-->
          <div class="col-sm">
          <ul class="navbar-left navbar-nav d-flex flex-row">
          <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning font-weight-bold stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiProiezioniPalinsesto">Palinsesto</a>
          </li>
          </ul>
        </div>
        
        <!-- Vai alle prenotazioni -->
        <div class="col-sm">
          <ul class="navbar-nav d-flex flex-row">
          <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning font-weight-bold stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazione">Prenotazione</a>
           
          </li>
          </ul>
        </div>
        
     <%--    <!--Vai alla pagina di registrazione: -->
            <div class="col-sm">
            <ul class="navbar-nav d-flex flex-row">
            <li class="nav-item m-auto width:90%">
            <%
            if(s.getAttribute("uLog")!=null){%> 
            <a class="nav-link text-warning d-flex justify-content-end font-weight-bold stile" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-admin.jsp">DashBoard</a>
            <%} else{%>
            <a class="nav-link text-warning d-flex justify-content-end font-weight-bold stile" href="/ProgettoFinaleJava18Gruppo1/html/registrazione.jsp">Registrazione</a>
            <%} %>
          </li>    
        </ul>
      </div> --%>
      
       <div class="col-sm">
          <ul class=" navbar-nav d-flex flex-row unstyled">
            <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning d-flex justify-content-end font-weight-bold stile" href="<%=request.getContextPath() %>/html/dashboard-gestione-profilo.jsp">Ciao, <%=u.getNome() %> </a>
            </li>
            </ul>
          </div>

        <!--Vai alla pagina di Login: -->
          <div class="col-sm">
          <ul class=" navbar-nav d-flex flex-row unstyled">
            <li class="nav-item m-auto width:90%">
            <a class="nav-link text-warning d-flex justify-content-end font-weight-bold stile" data-toggle="modal" data-target="#sign-out" href="/ServletLogout">Logout</a>
            </li>
            </ul>
          </div>
          
          
      </div>
    </nav>  



<!-- Modal uscita -->

<!-- Modal -->
        <div class="modal fade text-warning" id="sign-out">
            <div class="modal-dialog bg-dark text-warning">
                <div class="modal-content bg-dark text-warning">
                    <!-- Modal Header -->
                    <div class="modal-header bg-dark text-warning">
                        <h4 class="modal-title stile text-warning">Vuoi fare il logout?</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body stile bg-dark text-warning">
                        Premi logout per uscire.
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer stile">
                        <button type="button" class="btn btn-outline-warning text-light" data-dismiss="modal">
                            Rimani
                        </button>
                        <button onclick="location.href='http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLogout';" type="button" class="btn btn-outline-danger text-light" data-dismiss="modal">
                        Logout
                    </button>
                    </div>
                </div>
            </div>
        </div>

    <!--Bootstrap links-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
  </body>
</html>