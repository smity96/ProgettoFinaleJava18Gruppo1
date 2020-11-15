<%@page import="utilities.UtilitiesDbFilm"%>
<%@page import="model.Film"%>
<%@page import="utilities.UtilitiesDbUtente"%>
<%@page import="model.Utente"%>
<%@page import="java.util.List"%>

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
    <style type="text/css">
    	<%@include file="../css/style-dash.css"%>
    </style>
</head>

<body style="font-family: 'Monserrat', sans-serif">
<%
	List<Utente>listaU=UtilitiesDbUtente.listaUtenti();
%>
    <!-- navbar in alto-->
    <nav class="navbar navbar-expand-xl">
        <div class="container-fluid">

            <!-- Navbar Brand -->
            <a class="navbar-brand text-uppercase" href="#">
                <h1>Staff Dashboard</h1>
            </a>
            <!-- Fine Navbar Brand -->

            <!-- Toggler/collapse Button -->
            <button class="navbar-toggler btn-danger" type="button" data-toggle="collapse" data-target="#myNavbar"
                aria-controls="myNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navbar links collapse -->

            <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                <ul class="navbar-nav links d-md-none">
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Torna Al Sito</a></div>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fa fa-home text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active1" href="#">Dashboard</a></div>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active2" href="#">Gestione Profilo</a></div>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-video text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active3" href="#">Gestisci Prenotazioni</a></div>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active4" href="#">Gestione Film</a></div>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-check-circle text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active5" href="#">Gestione Proiezioni</a></div>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-users text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active6" href="#">Gestione Utenti</a></div>
                    </li>
                </ul>

                               <!-- nav icons -->
                <ul class="navbar-nav icons d-xl-flex d-none align-items-center">
                    <li class="nav-item">
                        <a class="navbar-brand" href="#">
                            <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                            Benvenuto
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
                            <img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                            <span class="col-10">Benvenuto</span> 
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

    <div class="container-fluid">
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
                        <div class="col-2 m-0"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
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

            <div class="col-xl-10 col-12 py-3 main-bg-dorato max-viewport">

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
                                            value="alessandro" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Cognome</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="cognome"
                                            value="inga" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Data di Nascita'</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="date" name="datanascita"
                                            value="">
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
                                        name="mail" value="alessandro3515@hotmail.it"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3 colore-icone-scuro"><label>Username</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="username"
                                        value="ale15">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3 colore-icone-scuro"><label>Password</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="password" name="password"
                                        value="12345"></td>
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
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="nome"
                                            value="00000" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Indirizzo</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="cognome"
                                            value="via dei traghetti 96" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 colore-icone-scuro"><label>Nome Societa'</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="datanascita"
                                            value="alecompany"></td>
                                </tr>

                                <tr class="d-flex">
                                    <td class="col-12 justify-content-center"> <input class="bg-colore-icone-scuro"
                                            type="submit" value="Modifica Dati"></td>
                                </tr>
                            </tbody>
                        </table>
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
                                <%List<Film>allFilm=UtilitiesDbFilm.leggiFilmAll();
                                    for(Film f:allFilm){%>
                                    <tr class="d-flex align-items-center">
                                    
                                        <td class="col-4 bordo-trasparente"><img class="img-fluid film-custom-height"
                                                src="<%=f.getLocandina() %>" alt=""></td>
                                        <td class="col-4 text-capitalize bordo-trasparente">
                                            <p class="colore-icone-scuro colore-icone-scuro"><%=f.getTitolo() %></p>
                                        <td class="col-2 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film" href="">
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
                        </div>
                    </div>

                <!-- inizio gestione film in programmazione parte 2 -->

                    <div class="row text-uppercase text-center d-flex d-md-none">
                        <div class="col-12 p-0">
                            <div class="mb-3 align-items-center justify-content-center">
                                <h1 class="mb-2">Lista Film In Programmazione</h1>
                                <p><a data-toggle="modal" data-target=".aggiungi-film" href="">
                                        <i class="fas fa-plus">Aggiungi Film</i>
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
                                    <%for(Film f:allFilm){%>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-6 text-capitalize bordo-trasparente">
                                            <p class="colore-icone-scuro"><%=f.getTitolo() %></p>
                                        <td class="col-3 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film" href="">
                                                <i class="colore-icone-scuro icona-menu-piccolo fas fa-edit"></i>
                                            </a>
                                        <td class="col-3 bordo-trasparente">
                                            <a href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletCancellaFilm?id_film=<%=f.getIdFilm() %>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i>
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
                                        <th class="col-4 colore-icone-scuro">Data e Ora</th>
                                        <th class="col-4 colore-icone-scuro">Film Proiettato</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Proiezione</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Proiezione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="d-flex align-items-center justify-content-center">
                                        <td class="col-4 bordo-trasparente colore-icone-scuro">
                                            <p>08/11/2020</p>
                                            <p>12:00 - 14:00</p>
                                        </td>
                                        <td class="col-4 bordo-trasparente text-capitalize colore-icone-scuro">
                                            <p>Chen il malvagio, re di java web</p>
                                        </td>
                                        <td class="col-2 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film-proiezione" href="">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        </td>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="#"><i
                                                    class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
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
                                        <i class="fas fa-plus">Aggiungi Film Alla Proiezione</i>
                                    </a></p>
                            </div>
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-4 colore-icone-scuro">Data e Ora</th>
                                        <th class="col-4 colore-icone-scuro">Film Proiettato</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Proiezione</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Proiezione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="d-flex align-items-center justify-content-center">
                                        <td class="col-4 bordo-trasparente colore-icone-scuro">
                                            <p>08/11/2020</p>
                                            <p>12:00 - 14:00</p>
                                        </td>
                                        <td class="col-4 bordo-trasparente text-capitalize colore-icone-scuro">
                                            <p>Chen il malvagio, re di java web</p>
                                        </td>
                                        <td class="col-2 bordo-trasparente">
                                            <a data-toggle="modal" data-target=".modifica-film-proiezione" href="">
                                                <i class="colore-icone-scuro icona-menu-piccolo fas fa-edit"></i>
                                            </a>
                                        </td>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="#"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
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
                                    <td class="col-md-2 col-3 colore-icone-scuro" rowspan="5"><label>Utente</label></td>
                                    <td class="col-md-8 col-6 colore-icone-scuro"><select
                                            class="col-12 text-center h-100 scelta" name="film-prenotati">
                                            <option class="prova" value="2" selected value> -- seleziona un film --
                                            </option>
                                            <option value=""></option>
 
                                        </select>
                                        </label>
                                    </td>
                                    <td class="col-md-2 col-3" rowspan="2"><a href=""><i
                                                class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                                <tr class="d-none justify-content-center" id="info-prenotazione">
                                    <td id="nomeFilmScelta" class="col-md-2 col-2">
                                        <img class="img-fluid film-custom-height mb-3"
                                            src="https://static.posters.cz/image/750webp/34925.webp" alt="">
                                    </td>
                                    <td class="col-md-2 col-2">
                                        <p>Data E Ora:</p>
                                        <p class="p-0 m-0">08/11/2020</p>
                                        <p>12:00 - 14:00</p>
                                    </td>
                                    <td class="col-md-2 col-1">
                                        <p>Intervallo:</p>
                                        <p>15 min</p>
                                    </td>
                                    <td class="col-md-2 col-1">
                                        <p>N° Posti Prenotati:</p>
                                        <p>1 Posti</p>
                                    </td>
                                </tr>
                                <tr class="d-flex justify-content-center">

                                </tr>
                                <tr class="d-flex justify-content-center">

                                </tr>
                                <tr class="d-flex justify-content-center">

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
                                        <th class="col-3 colore-icone-scuro">Id° Utente</th>
                                        <th class="col-3 colore-icone-scuro">Nome Utente</th>
                                        <th class="col-3 colore-icone-scuro">Cancella Utente</th>
                                        <th class="col-3 colore-icone-scuro">Modifica Utente</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                for(Utente u:listaU){
                                %>
                         
                                    <tr class="d-flex colore-icone-scuro">
                                        <td class="col-3"><label><%=u.getIdUtente() %></label></td>
                                        <td class="col-3"><label><%=u.getNome()+","+u.getCognome() %></label></td>
                                        <td class="col-3">
                                        	<a href="/ProgettoFinaleJava18Gruppo1/ServletCancellaUtente?canc=<%=u.getIdUtente()%>">
                                        		<i class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt" ></i>
                                          	</a>
                                         </td>
                                         
                                        <td class="col-3">
                                        	<a href="/ProgettoFinaleJava18Gruppo1/ServletModificaUtente?modifica=<%=u.getIdUtente()%>">
                                        		<i class="colore-icone-scuro icona-menu-piccolo fas fa-edit"></i>
                                        	</a>
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
                                        <th class="col-2">Id° Utente</th>
                                        <th class="col-2">Nome Utente</th>
                                        <th class="col-5">Gestisci Utente</th>
                                        <th class="col-3">Conferma Operazione</th>
                                    </tr>
                                    
                                </thead>
                                <tbody>
                                    <tr class="d-flex">
                                      <%for(Utente x:listaU){
                                		%>
                                        <td class="col-2"><label><%=x.getIdUtente() %></label></td>
                                        <td class="col-2"><label><%=x.getNome() %></label></td>
                                        <td class="col-5"><label><select class="col-12 text-center h-100"
                                                    name="gestici-utente">
                                                    <option value="cancella-utente">cancella utente</option>
                                                    <option value="modifica-utente">modifica utente</option>
                                                </select></label></td>
                                        <td class="col-3"><a href=""><i
                                                    class="fas fa-check-circle icona-menu-piccolo colore-icone-scuro"></i>
                                            </a></td>


                                        </td>
                                        <%} %>
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
        <!-- Fine Modal Uscita -->

    <!-- Modal Modifica Film -->
    <div class="modal fade modifica-film text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body p-0 m-0">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="nome"
                                        value="alessandro" class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Genere</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="cognome" value="inga"
                                        class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Anno di Uscita</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="date" name="datanascita"
                                        value="">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Durata</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="time" name="datanascita"
                                        value="">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trailer</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="url" name="datanascita" value="">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="datetime-local"
                                        name="datanascita" value=""></td>
                            </tr>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trama</label></th>
                                <td class="col-md-10 col-9"><textarea class="col-8 form-control mx-auto" type="text"
                                        name="">Bella Chen il Malvagio</textarea></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Locandina</label></th>
                                <td class="col-md-10 col-9"><input class="col-md-5 col-8 mr-2" type="url"
                                        name="datanascita" value=""><input class="col-md-3 col-sm-8 col-9 mt-3 mt-md-0"
                                        type="file" name="datanascita" value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <td class="col-12"><button type="button" class="btn btn-success mr-2">Salva
                                        Modifica</button>
                                    <button type="button" class="btn btn-danger ml-2" data-dismiss="modal">
                                        Annulla Modifica
                                    </button></td>
                            </tr>
                        </tbody>
                    </table>
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
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="nome" value=""
                                        class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Genere</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="cognome" value=""
                                        class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Anno di Uscita</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="date" name="datanascita"
                                        value="">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Durata</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="time" name="datanascita"
                                        value="">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trailer</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="url" name="datanascita" value="">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="datetime-local"
                                        name="datanascita" value=""></td>
                            </tr>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trama</label></th>
                                <td class="col-md-10 col-9"><textarea class="col-8 form-control mx-auto" type="text"
                                        name=""></textarea></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Locandina</label></th>
                                <td class="col-md-10 col-9"><input class="col-md-5 col-8 mr-2" type="url"
                                        name="datanascita" value=""><input class="col-md-3 col-sm-8 col-9 mt-3 mt-md-0"
                                        type="file" name="datanascita" value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <td class="col-12"><button type="button" class="btn btn-success mr-2">Aggiungi
                                        Film</button>
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
    <!-- Fine Modal Aggiungi Film -->

    <!-- Modal Aggiungi Film Alla Proiezione -->

    <div class="modal fade aggiungi-film-proiezione text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body p-0 m-0">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora Di Inizio</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="datetime-local"
                                        name="datanascita" value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><select class="col-8 mx-auto text-center h-100"
                                        name="film-prenotati">
                                        <option value=""></option>
                                    </select>
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Intervallo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number" name=""
                                        value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>N° Posti</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number"
                                        name="datanascita" value=""></td>
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
    <!-- Fine Modal Aggiungi Film alla Proiezione -->

    <!-- Modal Modifica Proiezione -->

    <div class="modal fade modifica-film-proiezione text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body bellaciao -->
                <div class="modal-body p-0 m-0">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Data E Ora Di Inizio</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="datetime-local"
                                        name="datanascita" value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9">
                                    <select class="col-8 mx-auto text-center h-100"
                                        name="film-prenotati">
                                        <option value=""></option>
                                    </select>
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Intervallo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number" name=""
                                        value=""></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>N° Posti</label></th>
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
    
     <!-- Footer: -->
    <jsp:include page= "footer.jsp"></jsp:include>
    


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>

    <script src="../js/script.js"></script>
</body>

</html>