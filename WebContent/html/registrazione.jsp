<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="bg-dark">
<head>
<meta charset="ISO-8859-1">
<title></title>

<style>
            .bottone{
                width: 11.7rem;    
            }

            .informazioni{
                width: 13rem;
            }
        </style>
               
               <!--Font awesome links-->
               <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
               
                <!--Bootstrap links-->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
</head>

       <body class="bg-dark text-center">

            <!--Form registrazione dell'utente: -->
            <form action="/ProgettoFinaleJava18Gruppo1/ServletInserisciUtente" method="post">
                <img class="mb-4 mt-5" src="../src/logocinema.png" alt="Logo" width="72" height="72">
                <p class="h3 mb-3 text-warning">Registrati:</p>

                <!--Requisiti obbligatori: -->

                <p><input  class="rounded" name="nome" type="text" placeholder="Nome" required></p>

                <p><input  class="rounded" name="cognome" type="text" placeholder="Cognome" required></p>     

                <p><input class="rounded bottone" id="dataDiNascita" name="data_di_nascita" type="date" required></p>
              
                <p><input class="rounded" name="email" type="email" placeholder="Email" required></p>

                
                <p class="text-warning text-center"><input  class="rounded" name="password" type="password" placeholder="Password" required></p>
               
                <!--Informazioni extra, non obbligatorie:-->

                <div class="container d-flex justify-content-center text-center col-4 informazioni">
                    <nav class="navbar navbar-dark bg-dark">
                        <h5 class="text-warning justify-content-end">Informazioni aggiuntive:</h5>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-film" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z"/>
                              </svg>
                              
                        </button>
                        <div class="collapse navbar-collapse" id="navbarText">
                          <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <p><input  class="rounded" name="P.I." type="text" placeholder="Partita Iva"></p>
                            </li>
                            <li class="nav-item">
                                <p><input  class="rounded" name="indirizzo" type="text" placeholder="Indirizzo"></p>
                            </li>
                            <li class="nav-item">
                                <p><input  class="rounded" name="nomeSoc" type="text" placeholder="Nome Società"></p>
                            </li>
                          </ul>
                        </div>
                      </nav>
            </div>

                <button onclick="prendiDataNascita()" class="btn text-light btn-outline-warning">Registrati</button>
                <br>
                <br>

                <!--Accedi qui se sei già registrato-->
                <p class="text-warning">Sei gia' registrato?</p>
                <a class="text-warning" href="/ProgettoFinaleJava18Gruppo1/html/login.jsp">Accedi qui!</a>

            </form>
        
        <script src="../js/script.js"></script>
          <!--Bootstrap links-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
    
</body>
</html>