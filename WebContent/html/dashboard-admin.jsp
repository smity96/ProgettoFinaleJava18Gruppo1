
<%@page import="utilities.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
</head>
      <%
              						  HttpSession s=request.getSession(false);    
										//session.getAttribute("utentelog")
                               			//String mail = (String) s.getAttribute("mailLog");
                						//String pssw = (String) session.getAttribute("psswLog");
                						Utente u = (Utente)s.getAttribute("uLog");
                						//Utente u=UtilitiesDbUtente.leggiUtenteById(2);
                						
                	
                %>
    <style type="text/css">
    	<%@include file="../css/style-dash.css"%>
    </style>
    </head>
<body style="font-family: 'Monserrat', sans-serif">
    <!-- navbar in alto-->
    <nav class="navbar navbar-expand-xl">
        <div class="container-fluid">

            <!-- Navbar Brand -->
            <a class="navbar-brand text-uppercase" href="#">
                <h1>Admin Dashboard</h1>
            </a>
            <!-- Fine Navbar Brand -->

            <!-- Toggler/collapse Button -->
            <button class="navbar-toggler btn-danger" type="button" data-toggle="collapse" data-target="#myNavbar"
                aria-controls="myNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar links collapse -->

            <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                <ul class="navbar-nav links d-flex d-xl-none">
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-folder-open text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link col-10" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Torna Al Sito</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fa fa-home text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active1 col-10" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-user text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active2 col-10" href="#">Gestione Profilo</a>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-video text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active3" href="#">Gestisci Prenotazioni</a></div>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-film text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active4 col-10" href="#">Gestione Film</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fas fa-calendar-alt text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active5 col-10" href="#">Gestione Proiezioni</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-users text-muted mr-3 nav-size col-2 ml-0"></i>
                        <a class="nav-link active6 col-10" href="#">Gestione Utenti</a>>
                    </li>
                </ul>

                <!-- nav icons -->
                <ul class="navbar-nav icons d-xl-flex d-none align-items-center">
                    <li class="nav-item">
                        <a class="navbar-brand" href="#">
                            <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                           	"BENVENUTO:"<%=u.getNome() %>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#sign-out" href="#">
                            <i class="fas fa-sign-out-alt mr-2"></i>Logout 
                        </a>
                    </li>
                </ul>

                <ul class="navbar-nav icons d-flex d-xl-none justify-content-end">
                    <li class="nav-item">
                        <a class="navbar-brand col-2" href="#">
                            <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                            <span class="col-10"><%=u.getNome() %></span> 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link col-10 offset-col-2" data-toggle="modal" data-target="#sign-out" href="#">
                            <i class="fas fa-sign-out-alt mr-2"></i> <span>Logout </span>
                        </a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <!-- fine nav -->

    <!-- main content -->

    <div class="container-fluid main-bg-dorato">
        <div class="row">

            <!-- Inizio Sidebar sinistra -->

            <nav class="col-xl-2 d-none d-xl-flex sidebar justify-content-center max-viewport">
                <ul class="navbar-nav flex-column list-side-height">
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Torna Al Sito</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fa fa-home text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active1" href="#">Dashboard</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active2" href="#">Gestione Profilo</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-video text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active3" href="#">Gestisci Prenotazioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active4" href="#">Gestione Film</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-calendar-alt text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active5" href="#">Gestione Proiezioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-users text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active6" href="#">Gestione Utenti</a></div>
                    </li>
                </ul>
            </nav>
            <!-- fine sidebar -->

            <!-- Inizio main destra -->

            <div class="col-xl-10 col-12 py-3 max-viewport">

                <!-- inizio funzioni main -->

                <!-- messaggio benvenuto -->
                
                <div class="row funzione-menu messaggio-benvenuto text-center align-items-center d-flex mt-5">
                    <div class="col-12 p-0 mb-3"><img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail foto-profilo-benvenuto mr-3"
                        alt="foto profilo utente"></div>
                    
                    <div class="col-12 p-0 mb-3">
                        <h1 class="text-capitalize">
                            <i class="fas fa-handshake mr-3"></i>
                            Benvenuto al Pannello di Controllo di Sorrento Cinema</h1>
                    </div>
                    <div class="col-12 p-0 mb-3">
                        <h2 class="text-capitalize">Qui potrai interagire con le funzioni di controllo dedicate
                            all'Admin</h2>
                    </div>
                    <div class="col-12 p-0 mb-3">
                        <h3 class="text-capitalize">Usa il menu a sinistra per spostarti tra le varie sezioni.</h3>
                    </div>
                    <div class="col-12 p-0 mb-3">
                        <h4 class="text-capitalize">Se usi dispostivi con schermi piccoli, il menu verrà visualizzato in
                            alto.</h4>
                    </div>
                    <div class="col-12 p-0 mb-3">
                        <h4 class="text-capitalize">In caso di dubbi, visualizzare le guide riportate qui sotto.</h4>
                    </div>

                </div>
                <!-- fine messaggio benvenuto -->

                <!-- inizio gestione profilo -->
          
                <div class="row justify-content-center text-uppercase d-none funzione-menu gestione-profilo">
                    <div class="col-12 p-0 text-center">
                        <div class="mb-4">
                            <h1 class="d-inline mr-3">Gestione Profilo</h1>
                        </div>

                      <form action="/ProgettoFinaleJava18Gruppo1/ServletModificaUtente" method="get">
                        <table class="table table-bordered table-hover table-dark">
                            <thead>
                                <tr>
                                    <th class="colore-icone-scuro">Dati Personali</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Nome</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="nome"
                                            value="<%=u.getNome() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Cognome</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="cognome"
                                            value="<%=u.getCognome() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Data di Nascita'</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="date" name="data_di_nascita"
                                            value="<%=u.getDataDiNascita()%>">
                                    </td>
                                </tr>
                            </tbody>
                            <thead>
                                <th class="colore-icone-scuro">Dati Account</th>
                            </thead>
                            <tbody></tbody>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3 colore-icone-scuro"><label>Email</label></th>
                                <td class="col-md-10 col-9 colore-icone-scuro"><input class="col-8" type="email"
                                        name="email" value="<%=u.getEmail()%>"></td>
                            </tr>
                            <!-- 
                             <tr class="d-flex">
                                <th class="col-md-2 col-3 colore-icone-scuro"><label>Username</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="username"
                                        value="ale15">
                                </td>
                            </tr>
                             -->
                            <tr class="d-flex">
                                <th class="col-md-2 col-3 colore-icone-scuro"><label>Password</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="password" name="password"
                                        value="<%u.getPassword(); %> "></td>
                            </tr>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3 colore-icone-scuro"><label>Immagine Profilo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 col-lg-5 mb-3 mb-lg-1" type="url"
                                    name="datanascita" value="" placeholder="Inserisci URL"><input class="col-8 col-lg-3 m-0"
                                    type="file" name="img" value="<%u.getImmagine(); %>"></td>
                            </tr>
                            </tbody>
                            <thead>
                                <tr>
                                    <th class="colore-icone-scuro">Dati Fatturazione</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Partita Iva</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="pIva"
                                            value="<%=u.getPIva() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Indirizzo</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="indirizzo"
                                            value="<%=u.getIndirizzo() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Nome Societa'</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="nomeSoc"
                                            value="<%u.getNomeSocieta(); %>"></td>
                                </tr>
									<tr>
									<td><input type="hidden" name="id" value="<%= u.getIdUtente() %>"></td>
									</tr> 
                                <tr class="d-flex">
                                    <td class="col-12 justify-content-center"><input class="bg-colore-icone-scuro"
                                            type="submit" value="modifica"></td>
                                </tr>
                            </tbody>
                        </table>
                            </form>
                    </div>
                </div>
                <!-- fine gestione profilo -->

                <!-- inizio gestione film in programmazione -->
                <!-- sono due, il primo primo parte da schermo medio mentre il secondo da quello piccolo fino al medio-->


                <div class="container-fluid m-0 p-0 d-none funzione-menu gestione-film">
                    <div class="row text-uppercase text-center d-none d-md-flex">
                        <div class="col-12 p-0">
                            <div class="mb-2 align-items-center justify-content-center">
                                <h1 class="mb-2">Lista Film In Programmazione</h1>
                                <a data-toggle="modal" data-target=".aggiungi-film" href="">
                                    <p class="fas fa-plus aggiungi-custom">Aggiungi Film</p>
                                </a>
                            </div>
                            <form action="ServletCancellaFilm" method="post">
                            <%List<Film> tuttiFilm=UtilitiesDbFilm.leggiFilmAll(); %>
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-4 colore-icone-scuro">Locandina</th>
                                        <th class="col-4 colore-icone-scuro">Titolo</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Info Film</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Film</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <%for(Film f: tuttiFilm){ 
                                request.setAttribute("id_filmMod", f);%>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-4 bordo-trasparente"><img class="img-fluid film-custom-height"
                                                src="<%=f.getLocandina() %>" alt=""></td>
                                        
                                        <td class="col-4 text-capitalize bordo-trasparente">
                                            <p class="colore-icone-scuro colore-icone-scuro"><%=f.getTitolo() %></p>
                                        <td class="col-2 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film" href="#">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletCancellaFilm?id_film=<%=f.getIdFilm() %>"><i
                                                    class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                            </form>
                        </div>
                    </div>

                <!-- inizio gestione film in programmazione parte 2 -->

                    <div class="row text-uppercase text-center d-flex d-md-none">
                        <div class="col-12 p-0">
                            <div class="mb-3 align-items-center justify-content-center">
                                <h1 class="mb-2">Lista Film In Programmazione</h1>
                                <p><a data-toggle="modal" data-target=".aggiungi-film" href="">
                                        <i class="fas fa-plus aggiungi-custom">Aggiungi Film</i>
                                    </a></p>
                            </div>
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-6 colore-icone-scuro">Titolo</th>
                                        <th class="col-3 colore-icone-scuro">Modifica Info Film</th>
                                        <th class="col-3 colore-icone-scuro">Cancella Film</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <%for(Film f: tuttiFilm){ %>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-6 text-capitalize bordo-trasparente">
                                            <img class="img-fluid film-custom-height mb-3"
                                                src="<%=f.getLocandina() %>" alt="">
                                            <p class="colore-icone-scuro"><%=f.getTitolo() %></p>
                                        <td class="col-3 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film" href="">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        <td class="col-3 bordo-trasparente">
                                            <a href="#"><i
                                                    class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- fine gestione film in programmazione -->

                <!-- inizio gestione proiezione -->
                <!-- come sopra, sono sempre due, uno parte dallo schermo medio, l'altro dal piccolo -->


                <div class="container-fluid m-0 p-0 d-none funzione-menu gestione-proiezione">
                
    			
                    <div class="row text-uppercase text-center d-none d-md-flex">
                        <div class="col-12 p-0">
                            <div class="mb-3 align-items-center justify-content-center">
                                <h1 class="mb-2">Gestione Programmazione</h1>
                                <p><a data-toggle="modal" data-target=".aggiungi-film-proiezione" href="">
                                        <i class="fas fa-plus aggiungi-custom">Aggiungi Film Alla Proiezione</i>
                                    </a></p>
                            </div>
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-2 colore-icone-scuro">Data e Ora</th>
                                        <th class="col-2 colore-icone-scuro">Film Proiettato</th>
                                        <th class="col-2 colore-icone-scuro">Intervallo</th>
                                        <th class="col-2 colore-icone-scuro">N. Posti</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Proiezione</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Proiezione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <%
                                List<Proiezione> proiezioni = (List<Proiezione>)request.getAttribute("proiezioni");
                                for(Proiezione p : proiezioni){ 
                                %>
                                    <tr class="d-flex align-items-center justify-content-center">
                                        <td class="col-2 bordo-trasparente colore-icone-scuro">
                                            <p><%= p.getDataOra() %></p>
                                        </td> 
                                        <td class="col-2 bordo-trasparente text-capitalize colore-icone-scuro">
                                            <img class="img-fluid film-custom-height mb-3"
                                                src="<%= p.getFilm().getLocandina() %>" alt="">
                                            <p><%= p.getFilm().getTitolo() %></p>
                                        </td>
                                        <td class="col-2 bordo-trasparente colore-icone-scuro">
                                            <p><%= p.getIntervallo() %></p>
                                        </td>
                                        <td class="col-2 bordo-trasparente colore-icone-scuro">
                                            <p><%= p.getPostiMax() %></p>
                                        </td>
                                        <td class="col-2 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film-proiezione" href="">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        </td>
                                        
                                        <td class="col-2 bordo-trasparente">
                                            <form action="ServletCancellaProiezione" method="POST">
                                            <input type="hidden" name="idDaEliminare" value="<%= p.getIdProiezione() %>">
                                          <button type="submit" class="btn"><i class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i></button>
                                           </form>
                                        </td>
                                        
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- inizio gestione proiezione parte 2 -->

					
                    <div class="row text-uppercase text-center d-md-none d-flex">
                        <div class="col-12 p-0">
                            <div class="mb-4">
                                <h1 class="d-inline mr-3">Gestione Proiezione</h1>
                                <p><a data-toggle="modal" data-target=".aggiungi-film-proiezione" href="">
                                        <i class="fas fa-plus aggiungi-custom">Aggiungi Film Alla Proiezione</i>
                                    </a></p>
                            </div>
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-4 colore-icone-scuro">Film Proiettato</th>
                                        <th class="col-4 colore-icone-scuro">Info Film</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Proiezione</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Proiezione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                 <%for(Proiezione p : proiezioni){  %>
                                    <tr class="d-flex align-items-center justify-content-center">
                                        <td class="col-4 bordo-trasparente text-capitalize colore-icone-scuro">
                                            <img class="img-fluid film-custom-height mb-3"
                                                src="<%= p.getFilm().getLocandina() %>" alt="">
                                            <p><%= p.getFilm().getTitolo() %></p>
                                        </td>
                                        <td class="col-4 bordo-trasparente colore-icone-scuro">
                                            <p>Data E Ora:</p> <p class="p-0 m-0"><%= p.getDataOra() %></p>
                                            <p>Intervallo:</p> <p><%= p.getIntervallo() %></p>
                                            <p>N� Posti:</p> <p><%= p.getPostiMax() %></p>
                                        </td>

                                        <td class="col-2 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film-proiezione" href="">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        </td>
                                        <td class="col-2 bordo-trasparente">
                                            <form action="ServletCancellaProiezione" method="POST">
                                            <input type="hidden" name="idDaEliminare" value="<%= p.getIdProiezione() %>">
                                           <button type="submit" class="btn"><i class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i></button>
                                           </form>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- fine gestione proiezione -->

                <!-- inizio gestione prenotazione -->

                <div class="row text-uppercase text-center d-none funzione-menu gestione-prenotazione">
                    <div class="col-12 p-0">
                        <div class="mb-4">
                            <h1 class="d-inline mr-3">Gestione Prenotazione</h1>
                        </div>
                        <table class="table table-bordered table-hover table-dark">
                            <thead>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro">Utente</th>
                                    <th class="col-md-8 col-6 colore-icone-scuro">Film Prenotato</th>
                                    <th class="col-md-2 col-3 colore-icone-scuro">Cancella Prenotazione</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="d-flex">
                                    <td class="col-md-2 col-3 colore-icone-scuro"><label>Utente</label></td>
                                    <td class="col-md-8 col-6 colore-icone-scuro"><select
                                            class="col-12 text-center h-100" name="film-prenotati">
                                            <option value="film prenotato">film prenotato</option>
                                            <option value="film prenotato">lorenzo e il concerto di servlet</option>
                                            <option value="film prenotato">chen il malvagio, re di java</option>
                                            <option value="film prenotato">leeroy luca vs java web</option>
                                            <option value="film prenotato">nicola il venditore di jsp</option>
                                            <option value="film prenotato">federico e le avventure con github
                                            </option>
                                            <option value="film prenotato">tiziana creatrice di form</option>


                                        </select>
                                        </label>
                                    </td>
                                    <td class="col-md-2 col-3"><a href=""><i
                                                class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- fine gestione prenotazione -->

                <!-- inizio gestione utenti -->
                <!-- sono due come sopra -->


                <div class="container-fluid m-0 p-0 d-none funzione-menu gestione-utenti">
                    <div class="row text-uppercase text-center d-none d-md-flex">
                        <div class="col-12 p-0">
                            <div class="mb-4">
                                <h1 class="d-inline mr-3">Gestione Utenti</h1>
                            </div>
                            <table class="table table-bordered table-hover table-dark">
                                <thead>
                                    <tr class="d-flex">
                                        <th class="col-2 colore-icone-scuro">Id� Utente</th>
                                        <th class="col-2 colore-icone-scuro">Nome Utente</th>
                                        <th class="col-2 colore-icone-scuro">Conferma Utente</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Utente</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Utente</th>
                                        <th class="col-2 colore-icone-scuro">Abilita A Staff</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%List<Utente>listaU=UtilitiesDbUtente.listaUtenti();
                                	for(Utente g:listaU){
                                %>
                                    <tr class="d-flex colore-icone-scuro">
                                        <td class="col-2"><label><%=g.getIdUtente() %></label></td>
                                        <td class="col-2"><label><%=g.getEmail() %></label></td>
                                        <%if(g.getRuolo()==0){ %>
                                        <td class="col-2"><a href="/ProgettoFinaleJava18Gruppo1/ServletModificaRuolo?b=<%=g.getIdUtente()%>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-check-circle"></i></a>
                                        </td>
                                        <% }%>
                                        <td class="col-2"><a href="canc"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i></a>
                                        </td>
                                        <td class="col-2"><a href="mod"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-edit"></i></a>
                                        </td>
                                        <%if(g.getRuolo()!=3) {%>
                                        <td class="col-2"><a href="abil"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-users"></i></a>
										<%} %>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                  <!-- inizio gestione utenti parte 2-->


                    <div class="row text-uppercase text-center d-flex d-md-none">
                        <div class="col-12 p-0">
                            <div class="mb-4">
                                <h1 class="d-inline mr-3">Gestione Utenti</h1>
                            </div>
                            <table class="table table-bordered table-hover table-dark">
                                <thead>
                                    <tr class="d-flex">
                                        <th class="col-2">Id� Utente</th>
                                        <th class="col-2">Nome Utente</th>
                                        <th class="col-5">Gestisci Utente</th>
                                        <th class="col-3">Conferma Operazione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="d-flex">
                                        <td class="col-2"><label>0</label></td>
                                        <td class="col-2"><label>Nome</label></td>
                                        <td class="col-5"><label><select class="col-12 text-center h-100"
                                                    name="gestici-utente">
                                                    <option value="conferma-utente"><a href="ProgettoFinaleJava18Gruppo1/ServletModificaUtente">conferma utente</a>
                                                    </option>
                                                    <option value="cancella-utente">cancella utente</option>
                                                    <option value="modifica-utente">modifica utente</option>
                                                    <option value="abilita-staff">abilita a staff</option>
                                                </select></label></td>
                                        <td class="col-3"><a href=""><i
                                                    class="fas fa-check-circle icona-menu-piccolo colore-icone-scuro"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- fine gestione utenti -->



            </div>
            <!-- fine main destra -->

        </div>

    </div>
    <!-- Fine Main Content -->

    <!-- Modals -->

    <!-- Modal uscita -->
    <!-- Modal -->
        <div class="modal fade bg-dark text-warning" id="sign-out">
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
        
        <!-- Fine Modal Uscita -->

    <!-- Modal Modifica Film -->
    <div class="modal fade modifica-film text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body p-0 m-0">
                <form action="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletModificaFilm" method="post" enctype="multipart/form-data">
                <%// TODO Sistemare il placeholder 
                Film f1=new Film();
                //Film f=UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("id_filmMod")));%>
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- inizio nuovo pezzo di form by Chen -->
                        <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Id</label></th>
                                <td class="col-md-10 col-9">
                                <select class="form-control col-8" type="text" name="titolo"
                                        class="text-capitalize">
                                        <%for(Film f:tuttiFilm){ %>
                                        <option><%=f.getIdFilm() %></option>
                                        <%f1=UtilitiesDbFilm.leggiFilm(f.getIdFilm()); %>
                                        <%} %>
                                </select>
                                        </td>
                            </tr>
                            <!-- fine nuovo pezzo di form -->
                        	<tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="titolo"
                                        value="<%=f1.getTitolo() %>" class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Genere</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="genere" value="<%=f1.getGenere() %>"
                                        class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Anno di Uscita</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="annoDiUscita"
                                        value="<%=f1.getAnnoDiUscita()%>">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Durata</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="durata"
                                        value="<%=f1.getDurata()%>">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trailer</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="url" name="urlTrailer" value="<%=f1.getUrlTrailer()%>">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="datetime-local"
                                        name="datanascita" value=""></td>
                            </tr>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trama</label></th>
                                <td class="col-md-10 col-9"><textarea class="col-8 form-control mx-auto"
                                        name="trama">Bella Chen il Malvagio</textarea></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Locandina</label></th>
                                <td class="col-md-10 col-9"><input class="col-md-5 col-8 mr-2" type="url"
                                        name="fileUrl" placeholder="Url dell'immagine"><input class="col-md-3 col-sm-8 col-9 mt-3 mt-md-0"
                                        type="file" name="file" placeholder="Immagine"></td>
                            </tr>
                            <tr class="d-flex">
                                <td class="col-12"><button type="submit" class="btn btn-success mr-2">Salva
                                        Modifica</button>
                                    <button type="button" class="btn btn-danger ml-2" data-dismiss="modal">
                                        Annulla Modifica
                                    </button></td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Fine Modal Modifica Film -->

    <!-- Modal Aggiungi Film -->

    <div class="modal fade aggiungi-film text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body p-0 m-0">
                <form action="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletInserisciFilm" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="titolo"
                                        placeholder="Titolo" class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Genere</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="genere" placeholder="Genere"
                                        class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Anno di Uscita</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="annoDiUscita"
                                        placeholder="Anno">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Durata</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="durata"
                                        placeholder="Inserire i minuti complessivi senza simboli">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trailer</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="url" name="urlTrailer" placeholder="Url del trailer">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="datetime-local"
                                        name="datanascita" value=""></td>
                            </tr>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trama</label></th>
                                <td class="col-md-10 col-9"><textarea class="col-8 form-control mx-auto"
                                        name="trama">Bella Chen il Malvagio</textarea></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Locandina</label></th>
                                <td class="col-md-10 col-9"><input class="col-md-5 col-8 mr-2" type="url"
                                        name="fileUrl" placeholder="Url dell'immagine"><input class="col-md-3 col-sm-8 col-9 mt-3 mt-md-0"
                                        type="file" name="file" placeholder="Immagine"></td>
                            </tr>
                            <tr class="d-flex">
                                <td class="col-12"><button type="submit" class="btn btn-success mr-2">Aggiungi
                                        Film</button>
                                    <button type="button" class="btn btn-danger ml-2" data-dismiss="modal">
                                        Annulla Inserimento
                                    </button></td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Fine Modal Aggiungi Film -->

    <!-- Modal Aggiungi Film Alla Proiezione -->

    <div class="modal fade aggiungi-film-proiezione text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body p-0 m-0">
                <form action="ServletInserisciProiezione" method="post">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Proiezione</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora Di Inizio</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="datetime-local"
                                        name="dataOra" ></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><select class="col-8 mx-auto text-center h-100"
                                        name="id">
                                        <% List<Film> films=(List<Film>)request.getAttribute("films");
                                        for(Film f : films){ %>
			  							  <option value="<%= f.getIdFilm() %>"><%= f.getTitolo() %></option>
			  							 <%} %>
                                    </select>
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Intervallo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number" name="intervallo"
                                       ></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>N� Posti</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number"
                                        name="posti" ></td>
                            </tr>

                            <tr class="d-flex">
                                <td class="col-12"><button type="submit" class="btn btn-success mr-2">Aggiungi
                                        Proiezione</button>
                                    <button type="submit" class="btn btn-danger ml-2" data-dismiss="modal">
                                        Annulla Inserimento
                                    </button></td>
                            </tr>

                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Fine Modal Aggiungi Film alla Proiezione -->

    <!-- Modal Modifica Proiezione -->

    <div class="modal fade modifica-film-proiezione text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body  -->
                <div class="modal-body p-0 m-0">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Proiezione</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora Di Inizio</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="datetime-local"
                                        name="dataOra" value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9">
                                    <select class="col-8 mx-auto text-center h-100"
                                        name="film-prenotati">
                                       <!-- 
                                         <option value="a"></option>
                                        -->
                                    </select>
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Intervallo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number" name=""
                                        value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>N. Posti</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number"
                                        name="" value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <td class="col-12"><button type="button" class="btn btn-success mr-2">Aggiungi
                                        Proiezione</button>
                                    <button type="button" class="btn btn-danger ml-2" data-dismiss="modal">
                                        Annulla Inserimento
                                    </button></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- Fine Modal Modifica Proiezione -->

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        <script type="text/javascript"><%@include file="../js/script.js"%></script>
</body>

</html>