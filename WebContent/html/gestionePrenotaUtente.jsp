<%@page import="model.Prenotazione"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

    <style>
        .bottone{
            width:12rem;
        }

        .immagine{
            width:7rem;
            height: 11rem;
        }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="..\css\fontawesome-free-5.15.0-web\css\all.min.css">
    <link rel="stylesheet" href="..\css\style-dash.css">
</head>

<body>

    <body>
        <!-- navbar -->

        <nav class="navbar navbar-expand-md">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="navbar-brand text-uppercase" href="#">
                    <h1>Dashboard Utente</h1>
                </a>

                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler btn-primary" type="button" data-toggle="collapse" data-target="#myNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar links -->

                <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                    <ul class="navbar-nav links d-md-none">
                        <li class="nav-item d-flex align-items-center my-3">
                        
                        <!-- MANCA HOME -->
                            <div class="col-3"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">Torna Al Sito</a></div>
                        </li>
                        
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">Gestione Profilo</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/prenotaUtente.jsp">Prenota film</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="#">Gestione Prenotazioni</a></div>
                        </li>
                      </ul>

                    <!-- nav icons -->
                    <ul class="navbar-nav icons align-items-center">
                        <li class="nav-item mr-5">
                            <a class="navbar-brand py-3" href="#">
                                <img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                    alt="Logo" style="width:40px;" />
                                Nome Utente
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#sign-out" href="#">
                                <i class="fa fa-sign-out"></i> Sign Out
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end of nav -->

        <!-- main content -->

        <div class="container-fluid p-0 bg-dark">
            <div class="row">
                <nav
                    class="col-md-4 col-lg-3 col-xl-2 d-none d-md-flex sidebar align-items-center justify-content-center right-padding max-viewport">
                    <ul class="navbar-nav flex-column">
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">Torna alla Home</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">Gestione Profilo</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/prenotaUtente.jsp">Prenota film</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/gestionePrenotaUtente.jsp">Gestione Prenotazioni</a></div>
                        </li>

                </nav>
                <!-- fine side bar -->
                <div class="col-md-9 col-lg-10 py-5 bg-dark">
                    <!-- titolo dashboard -->
                    <div class="row">
                        <div class="col">
                            <h3>
                                <span class="text-uppercase text-danger">Dashboard /</span><span
                                    class="text-muted small"> Gestione Prenotazioni Film</span>
                            </h3>
                        </div>
                    </div>
                    <!-- fine titolo dashboard -->
                    <!-- inizio funzioni pannello -->
                    <div class="row text-center text-uppercase bg-warning">
                        <div class="col-12 m-0 p-0 text-center">
                            <h1 class="text-dark">Film prenotati</h1>
                        </div>

                        <div class="container col-12 bg-dark text-left">
                            <!--Mettere nome attuale dell'utente: -->
                            <table class="table table-hover table-dark">
                                <thead>
                                  <tr>
                                    <th scope="col">Titolo film</th>
                                    <th scope="col">Locandina</th>
                                    <th scope="col">Orario e data</th>
                                    <th scope="col">Posti prenotati</th>
                                    <th scope="col">Prezzo totale</th>
                                    <th scope="col">Modifica Prenotazione</th>
                                    <th scope="col">Cancella Prenotazione</th>
                                  </tr>
                                </thead>
                               
								
									
                                <tbody>
                                 <% 
                                	List<Prenotazione> listaPreno = (List<Prenotazione>)request.getAttribute("listaPreno");
                                	for(Prenotazione p : listaPreno){
                                	if(!request.getAttribute("pDaModificare").equals(p)){
                                	
                                %>
                                	<form action="ServletLeggiPrenotazioneById" method="POST">
										<input type="hidden" name="id_prenotazione">
                                  <tr>
                                    <th scope="row"><%=p.getProiezione().getFilm().getTitolo() %></th>
                                    <td><img class="immagine" src="<%=p.getProiezione().getFilm().getLocandina() %>"></td>
                                    <td><%= p.getProiezione().getDataOra() %></td>
                                    <td><%=p.getPostiPrenotati() %></td>
                                    <td><%=p.getCosto_totale() %></td>
                                    <td><button type="submit" class="btn btn-outline-warning">Modifica</button>
                                    </form>
                                    
                                    
                                    
                                    <form action="ServletCancellaPrenotazione" method="POST">
                                    <td><button type="button" onclick="history.back()" class="btn btn-outline-danger">Cancella</button></td>
                                 	</form>
                                 	<%}else{ %>
                                 	<form action="ServletModificaPrenotazione" method="POST">
                                 	<% 
                                 		int postiDisponibili = p.getProiezione().getPostiMax();
											for(Prenotazione y : listaPreno){
	                                    	  	if(y.getProiezione().equals(p.getProiezione()))
	                                    			postiDisponibili -= y.getPostiPrenotati(); 
	                                    	}
                                     %>   	
                                    <!-- Se clicca su modifica si apre questa riga: -->
                                    <th scope="row"><%=p.getProiezione().getFilm().getTitolo() %></th>
                                    <td><img class="immagine" src="<%=p.getProiezione().getFilm().getLocandina() %>"></td>
                                   <td><%= p.getProiezione().getDataOra() %></td>
                                    <td><select class="mdb-select md-form colorful-select dropdown-warning">
                                       <% for(int i=0; i <= postiDisponibili; i++){ %>
											<option value="<%= i %>">
												<%= i %>
											</option>
											<%} %>
                                        
                                      </select>
                                    </td>
                                    <td><%=p.getCosto_totale() %></td>
                                    <td><button type="button" class="btn btn-outline-warning">Conferma</button>
                                    
                                    
                                    
                                    </td>
                                 
                                    
                                    <td><button type="button" onclick="history.back()" class="btn btn-outline-danger">Torna indietro</button></td>
                                  </tr>
                                  </form>
                                <%} 
                                }%>
                                
                                </tbody>
                                
                              </table>

                    </div>
                    


                    </div>
                </div>

            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade bg-dark" id="sign-out">
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
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Esci
                        </button>
                    </div>
                </div>
            </div>
        </div>
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
        <script src="../js/profiloUtente.js"></script>
    </body>
</html>