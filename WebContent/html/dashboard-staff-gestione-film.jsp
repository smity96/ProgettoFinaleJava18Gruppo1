
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
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/stylemain.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash-final.css">
      <%
                                      HttpSession s=request.getSession(false);    
                                        //session.getAttribute("utentelog")
                                        //String mail = (String) s.getAttribute("mailLog");
                                        //String pssw = (String) session.getAttribute("psswLog");
                                        //TODO Sistemare la sessione
                                        Utente u = (Utente)s.getAttribute("uLog");
                                        //Utente u=UtilitiesDbUtente.leggiUtenteById(2);
                                        
                    
                %>
    </head>
    <body style="font-family: 'Monserrat', sans-serif">
    <!-- navbar in alto-->
    <nav class="navbar navbar-expand-xl">
        <div class="container-fluid">

            <!-- Navbar Brand -->
            <h1 class="navbar-brand scritta-dorata scritta-click-scuro text-uppercase">Dashboard Staff</h1>
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
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-messaggio-benvenuto.jsp"><i class="fas fa-folder-open mr-3 text-muted"></i>Dashboard</a>
                    </li>
          
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-gestione-profilo.jsp"><i class="fas fa-user mr-3 text-muted"></i>Gestione Profilo</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-gestione-proiezione.jsp"><i class="fas fas fa-calendar-alt mr-3 text-muted"></i>Gestione Proiezioni</a>
                    </li>
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-utenti.jsp"><i class="fas fa-users mr-3 text-muted"></i>Gestione Utenti</a>
                    </li>
                  </ul>

                <!-- nav icons -->
                
                <ul class="navbar-nav icons">
                    <li class="nav-item mr-5">
                      <a class="nav-link" href="#">
                        <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail" alt="Logo"
                          style="width:30px;">
                        <span class="scritta-dorata ml-2"><%="BENVENUTO:"+u.getNome()%></span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link scritta-dorata scritta-click-scuro" data-toggle="modal" data-target="#sign-out" href="#">
                        <i class="fa fa-sign-out scritta-dorata align-items-center"></i> Logut
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
                                href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-messaggio-benvenuto.jsp">Dashboard</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-gestione-profilo.jsp">Gestione Profilo</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-calendar-alt text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-gestione-proiezione.jsp">Gestione Proiezioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-users text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/html/dashboard-staff-gestione-utenti.jsp">Gestione Utenti</a></div>
                    </li>
                </ul>
            </nav>

            <!-- fine sidebar -->

            <!-- Inizio main destra -->

            <div class="col-xl-10 col-12 py-3 max-viewport">

                <!-- inizio funzioni main -->

                <!-- inizio gestione film in programmazione -->
                <!-- sono due, il primo primo parte da schermo medio mentre il secondo da quello piccolo fino al medio-->


                    <div class="row text-uppercase text-center d-none d-md-flex">
                        <div class="col-12 p-0">
                            <div class="mb-2 align-items-center justify-content-center">
                                <h1 class="mb-2">Lista Film In Programmazione</h1>
                                <a data-toggle="modal" data-target=".aggiungi-film" href="">
                                    <p class="fas fa-plus aggiungi-custom">Aggiungi Film</p>
                                </a>
                            </div>
                            
                            <%List<Film> tuttiFilm=UtilitiesDbFilm.leggiFilmAll(); %>
                            <table class="table table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-4 scritta-dorata">Locandina</th>
                                        <th class="col-4 scritta-dorata">Titolo</th>
                                        <th class="col-2 scritta-dorata">Modifica Info Film</th>
                                        <th class="col-2 scritta-dorata">Cancella Film</th>
                                    </tr>
                                </thead>
                                <tbody>                              
                                <%for(Film f: tuttiFilm){ %>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-4 bordo-trasparente"><img class="img-fluid film-custom-height"
                                                src="<%=f.getLocandina() %>" alt=""></td>
                                        <td class="col-4 text-capitalize bordo-trasparente">
                                            <p class="scritta-dorata"><%=f.getTitolo() %></p>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletLeggiFilmToModifica?id_FilmMod=<%=f.getIdFilm() %>">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletCancellaFilm?id_film=<%=f.getIdFilm() %>"><i
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
                                <h1 class="mb-2 titolo-custom">Lista Film In Programmazione</h1>
                                <p><a data-toggle="modal" data-target=".aggiungi-film" href="">
                                        <i class="fas fa-plus aggiungi-custom">Aggiungi Film</i>
                                    </a></p>
                            </div>
                            <table class="table table-hover table-dark">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-6 scritta-dorata">Titolo</th>
                                        <th class="col-3 scritta-dorata">Modifica Info Film</th>
                                        <th class="col-3 scritta-dorata">Cancella Film</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <%for(Film f: tuttiFilm){ %>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-6 text-capitalize bordo-trasparente">
                                            <img class="img-fluid film-custom-height mb-3"
                                                src="<%=f.getLocandina() %>" alt="">
                                            <p class="scritta-dorata"><%=f.getTitolo() %></p>
                                        <td class="col-3 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletLeggiFilmToModifica?id_FilmMod=<%=f.getIdFilm() %>">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        <td class="col-3 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletCancellaFilm?id_film=<%=f.getIdFilm() %>"><i
                                                    class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
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
        <script type="text/javascript"><%@include file="../js/script.js"%></script>
</body>

</html>