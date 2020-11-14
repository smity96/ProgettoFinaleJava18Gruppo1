
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
    <link rel = "icon" href ="/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
    
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/ProgettoFinaleJava18Gruppo1/css/style-dash.css">
      <%
                                      HttpSession s=request.getSession(false);    
                                        //session.getAttribute("utentelog")
                                        //String mail = (String) s.getAttribute("mailLog");
                                        //String pssw = (String) session.getAttribute("psswLog");
                                        Utente u = (Utente)s.getAttribute("uLog");
                                        //Utente u=UtilitiesDbUtente.leggiUtenteById(2);
                                        
                    
                %>/ProgettoFinaleJava18Gruppo1/html/index.jsp
    </head>
<body>
    <!-- navbar in alto-->
    <nav class="navbar navbar-expand-xl">
        <div class="container-fluid">

            <!-- Navbar Brand -->
            <a class="navbar-brand text-uppercase" href="#">
                <h1>Dashboard Staff</h1>
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
                        <a class="nav-link col-10" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">Torna Al Sito</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fa fa-home text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active1 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-messaggio-benvenuto.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item d-flex my-3">
                        <i class="fas fa-user text-muted mr-3 nav-size col-2"></i>
                        <a class="nav-link active2 col-10" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-profilo.jsp">Gestione Profilo</a>
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
                        <a class="nav-link active6 col-10" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-utenti.jsp">Gestione Utenti</a>>
                    </li>
                </ul>

                <!-- nav icons -->
                <ul class="navbar-nav icons d-xl-flex d-none align-items-center">
                    <li class="nav-item">
                        <a class="navbar-brand" href="#">
                            <img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                alt="Logo" style="width:40px;" />
                            <%="CIAO"+" "+u.getNome().toUpperCase() %>
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
                        <a class="nav-link col-10 offset-col-2" data-toggle="modal" data-target="#sign-out" href="">
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
                        <div class="col-6 m-0"><a class="nav-link" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">Torna Al Sito</a></div>
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
                        <div class="col-2 m-0"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active4" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-film.jsp">Gestione Film</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-calendar-alt text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active5" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-proiezione.jsp">Gestione Proiezioni</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-users text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link active6" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-utentijsp">Gestione Utenti</a></div>
                    </li>
                </ul>
            </nav>
            <!-- fine sidebar -->

            <!-- Inizio main destra -->

            <div class="col-xl-10 col-12 py-3 max-viewport">

                <!-- inizio funzioni main -->

                <!-- inizio gestione profilo -->
          
                <div class="row justify-content-center text-uppercase d-none funzione-menu gestione-profilo">
                    <div class="col-12 p-0 text-center">
                        <div class="mb-4">
                            <h1 class="d-inline mr-3">Gestione Profilo</h1>
                        </div>

                      <form action="/ProgettoFinaleJava18Gruppo1/ServletModificaUtente" method="post" enctype="multipart/form-data">
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