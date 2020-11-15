
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
    <link rel="stylesheet" href="/ProgettoFinaleJava18Gruppo1/css/style-dash.css">
      <%
        HttpSession s=request.getSession(false);    
        Utente u = (Utente)s.getAttribute("uLog");
              
                %>/ProgettoFinaleJava18Gruppo1/html/index.jsp
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
                        <a class="nav-link active1 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-messaggio-benvenuto.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-user text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active2 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-profilo.jsp">Gestione Profilo</a>
                    </li>
                    <li class="nav-item d-flex align-items-center my-3">
                        <div class="col-3"><i class="fas fa-video text-muted mr-3 nav-size"></i></div>
                        <div class="col-9 ml-3"><a class="nav-link active3" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-prenotazione.jsp">Gestisci Prenotazioni</a></div>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-film text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active4 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-film.jsp">Gestione Film</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fas fa-calendar-alt text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active5 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-proiezione.jsp">Gestione Proiezioni</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-users text-muted mr-3 nav-size col-2 ml-0"></i>
                        <a class="nav-link active6 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-utenti.jsp">Gestione Utenti</a>>
                    </li>
                </ul>

                <!-- nav icons -->
                <ul class="navbar-nav icons d-xl-flex d-none align-items-center">
                    <li class="nav-item">
                        <a class="navbar-brand" href="#">
                            <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;">
                            <%="CIAO"+" "+u.getNome() %>
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
                            <span class="col-10"><%=u.getNome() %></span> 
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link col-10 offset-col-2" data-toggle="modal" data-target="#sign-out" href="/ServletLogout">
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
                        <div class="col-6 m-0"><a class="nav-link active1" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-messaggio-benvenuto.jsp">Dashboard</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active2" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-profilo.jsp">Gestione Profilo</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-video text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active3" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-prenotazione.jsp">Gestisci Prenotazioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active4" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-film.jsp">Gestione Film</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-calendar-alt text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active5" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-proiezione.jsp">Gestione Proiezioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-users text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active6" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-utenti.jsp">Gestione Utenti</a></div>
                    </li>
                </ul>
            </nav>
            <!-- fine sidebar -->

            <!-- Inizio main destra -->

            <div class="col-xl-10 col-12 py-3 max-viewport">

                <!-- inizio funzioni main -->
                
                <!-- inizio gestione utenti -->
                <!-- sono due come sopra -->


                    <div class="row text-uppercase text-center d-none d-md-flex">
                        <div class="col-12 p-0">
                            <div class="mb-4">
                                <h1 class="d-inline mr-3">Gestione Utenti</h1>
                            </div>
                            <table class="table table-bordered table-hover table-dark">
                                <thead>
                                    <tr class="d-flex">
                                        <th class="col-2 colore-icone-scuro">Id° Utente</th>
                                        <th class="col-2 colore-icone-scuro">Nome Utente</th>
                                        <th class="col-2 colore-icone-scuro">Conferma Utente</th>
                                        <th class="col-2 colore-icone-scuro">Cancella Utente</th>
                                        <th class="col-2 colore-icone-scuro">Modifica Utente</th>
                                        <th class="col-2 colore-icone-scuro">Abilita A Staff</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                
                                List<Utente>lU=(List<Utente>)request.getAttribute("listaU");
                                
                                	for(Utente g:lU){
                                %>
                                    <tr class="d-flex colore-icone-scuro">
                                        <td class="col-2"><label><%=g.getIdUtente() %></label></td>
                                        <td class="col-2"><label><%=g.getEmail() %></label></td>
                                        <%if(g.getRuolo()!=0){ %>
                                        <td class="col-2"><a href="/ProgettoFinaleJava18Gruppo1/ServletModificaRuolo?b=<%=g.getIdUtente()%>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-check-circle"></i></a>
                                        </td>
                                        <% }else{%>
                                        <td class="col-2"><a href="/ProgettoFinaleJava18Gruppo1/ServletModificaRuolo?b=<%=g.getIdUtente()%>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-check"></i></a>
                                        <%} %>
                                        
                                        <td class="col-2"><a href="/ProgettoFinaleJava18Gruppo1/ServletCancellaUtente?canc=<%=g.getIdUtente()%>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i></a>
                                        </td>
                                        <td class="col-2"><a href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/html/modifica-utenti.jsp?d=<%=g.getIdUtente() %>"><i
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
                                        <th class="col-2">Id° Utente</th>
                                        <th class="col-2">Nome Utente</th>
                                        <th class="col-5">Gestisci Utente</th>
                                        <th class="col-3">Conferma Operazione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%for(Utente x:lU) 
                                					{%>    		
                                    <tr class="d-flex">
                                        <td class="col-2"><label><%=x.getIdUtente() %></label></td>
                                        <td class="col-2"><label><%=x.getNome() %></label></td>
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
                                    <%} %>
                                </tbody>
                            </table>
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