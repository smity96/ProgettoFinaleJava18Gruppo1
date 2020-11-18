<%@page import="model.Utente"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
     <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
   
   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/stylemain.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash-final.css">
      <%
              						  HttpSession s=request.getSession(false);    
										//session.getAttribute("utentelog")
                               			//String mail = (String) s.getAttribute("mailLog");
                						//String pssw = (String) session.getAttribute("psswLog");
                						//TODO Sistemare la sessione
                						Utente u=(Utente)s.getAttribute("uLog");
                						/*if(request.getAttribute("uLogSt")!=null){
                							Utente appoggio=(Utente)request.getAttribute("uLogSt");
                							if(appoggio.getIdUtente()==u.getIdUtente()){
                    							u=(Utente)request.getAttribute("uLogSt");
                    						}else{
                    							u = (Utente)s.getAttribute("uLog");
                    						}
                						}*/
                						
                						
                						
                						//Utente u=UtilitiesDbUtente.leggiUtenteById(2);
                						
                	
                %>
    </head>
<body style="font-family: 'Monserrat', sans-serif">
    <!-- navbar in alto-->
    <nav class="navbar navbar-expand-xl bg-nero">
        <div class="container-fluid">

            <!-- Navbar Brand -->
                <h1 class="navbar-brand scritta-dorata scritta-click-scuro text-uppercase">Admin Dashboard</h1>
            <!-- Fine Navbar Brand -->

            <!-- Toggler/collapse Button -->
            <button class="navbar-toggler bg-oro" type="button" data-toggle="collapse" data-target="#myNavbar">
                <span class="navbar-toggler-icon"></span>
              </button>

            <!-- Navbar links collapse -->

            <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                
                <ul class="navbar-nav links d-xl-none">
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link active scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex"><i class="fa fa-home text-muted scritta-click-scuro scritta-dorata mr-3"></i>Torna Al Sito</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/IndieDashboardAdmin"><i class="fas fa-folder-open mr-3 text-muted"></i>Dashboard</a>
                    </li>
          
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/IndieGestioneProfiloAdmin"><i class="fas fa-user mr-3 text-muted"></i>Gestione Profilo</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazioneAdmin"><i class="fas fa-video mr-3 text-muted"></i>Gestione Prenotazioni</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/ServletOrdinaFilm"><i class="fas fa-film mr-3 text-muted"></i>Gestione Film</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiProiezioniAdmin"><i class="fas fas fa-calendar-alt mr-3 text-muted"></i>Gestione Proiezioni</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiUtenteAdmin"><i class="fas fa-users mr-3 text-muted"></i>Gestione Utenti</a>
                    </li>
                  </ul>

                <!-- nav icons -->

                <ul class="navbar-nav icons">
                    <li class="nav-item mr-5">
                      <a class="nav-link" href="IndieGestioneProfiloAdmin">
                        <img src="<%=u.getImmagine() %>" class="img-fluid rounded-circle img-thumbnail" alt="Logo"
                          style="width:30px;">
                        <span class="scritta-dorata ml-2"><%="CIAO:"+u.getNome().toUpperCase()%></span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link scritta-dorata scritta-click-scuro" data-toggle="modal" data-target="#sign-out" href="#">
                        <i class="fa fa-sign-out scritta-dorata align-items-center"></i> Logout
                      </a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <!-- fine nav -->

    <!-- main content -->

    <div class="container-fluid bg-oro">
        <div class="row">

            <!-- Inizio Sidebar sinistra -->


            <nav class="col-xl-2 d-none d-xl-flex sidebar justify-content-center max-viewport">
                <ul class="navbar-nav flex-column list-side-height">
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fa fa-home text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro" 
                            href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Torna Al
                                Sito</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/IndieDashboardAdmin">Dashboard</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/IndieGestioneProfiloAdmin">Gestione Profilo</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-video text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazioneAdmin">Gestisci Prenotazioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro "
                                href="/ProgettoFinaleJava18Gruppo1/ServletOrdinaFilm">Gestione Film</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-calendar-alt text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/ServletLeggiProiezioniAdmin">Gestione Proiezioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-users text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/ServletLeggiUtenteAdmin">Gestione Utenti</a></div>
                    </li>
                </ul>
            </nav>

            <!-- fine sidebar -->
