
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
    <title>Document</title>
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
<body>
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
                        <a class="nav-link col-10" href="#">Torna Al Sito</a>
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
                            <img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                            <%="BENVENUTO:"+u.getNome() %>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#sign-out" href="#">
                            <i class="fas fa-sign-out-alt mr-2"></i>Sign Out 
                        </a>
                    </li>
                </ul>

                <ul class="navbar-nav icons d-flex d-xl-none justify-content-end">
                    <li class="nav-item">
                        <a class="navbar-brand col-2" href="#">
                            <img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                            <span class="col-10"><%=u.getNome() %></span> 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link col-10 offset-col-2" data-toggle="modal" data-target="#sign-out" href="#">
                            <i class="fas fa-sign-out-alt mr-2"></i> <span>Sign Out </span>
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
                        <div class="col-6 m-0"><a class="nav-link" href="#">Torna Al Sito</a></div>
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


									<form action="" method="">
                                        <tr class="d-flex align-items-center">
                                        <td class="col-4 bordo-trasparente">
                                                <input type="file" name=""
                                                    value=""> 
                                        </td>
                                        <td class="col-4 bordo-trasparente">
                                                <input type="text" name=""
                                                    value=""> 
                                        </td>       
                                        <td class="col-2 bordo-trasparente">
                                            <button type="submit" class="btn btn-secondary">Modifica</button>
                                        </td>
                                    </tr>
                                    </form>


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

                                	<form action="" method="">
                                        <tr class="d-flex align-items-center">
                                        <td class="col-6 bordo-trasparente">
                                                <input type="file" name=""
                                                    value=""> 
                                                    <input type="text" name=""
                                                    value="">
                                        </td>     
                                        <td class="col-3 bordo-trasparente">
                                            <button type="submit" class="btn btn-secondary">Modifica</button>
                                        </td>
                                    </tr>
                                    </form>
                                
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



            </div>
            <!-- fine main destra -->

        </div>

    </div>
    <!-- Fine Main Content -->

    <!-- Modals -->

    <!-- Modal uscita -->
    <div class="modal fade" id="sign-out">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Vuoi fare il logout?</h4>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Premi logout per uscire.
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">
                        Rimani
                    </button>
                    <button onclick="location.href='http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLogout';" type="button" class="btn btn-danger" data-dismiss="modal">
                        Esci
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- Fine Modal Uscita -->

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