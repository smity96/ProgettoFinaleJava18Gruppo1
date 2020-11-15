<%@page import="model.Utente"%>
<%@page import="model.Prenotazione"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   
    <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
   <%
     HttpSession s=request.getSession(false);        
     //TODO Sistemare anche qui
     //Utente u = (Utente)s.getAttribute("uLog");
                            
   %>

    <style>
        .bottone{
            width:12rem;
        }

        .immagine{
            width:7rem;
            height: 11rem;
        }
        
         .stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
        
    </style>
    
     <!-- Google fonts link -->
     <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="/ProgettoFinaleJava18Gruppo1/css/style-dash.css">
</head>
<body>

    <body>
        <!-- navbar -->

        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="navbar-brand text-uppercase stile" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">
                    <h1 class="stile">Dashboard Utente</h1>
                </a>

                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler btn-warning" type="button" data-toggle="collapse" data-target="#myNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar links -->

                <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                    <ul class="navbar-nav links d-lg-none">
                        <li class="nav-item">
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex"><i class="fas fa-home text-muted mr-3 nav-size"></i>Torna Al Sito</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp"><i class="fas fa-user text-muted mr-3 nav-size"></i>Gestione Profilo</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazione"><i class="fas fa-film text-muted mr-3 nav-size"></i>Prenota film</a>
                        </li>
                        <li class="nav-item">        
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/html/gestionePrenotaUtente.jsp"><i class="fas fa-file-signature text-muted mr-3 nav-size"></i>Gestione Prenotazioni</a>
                        </li>
                      </ul>

                    <!-- nav icons -->
                    <ul class="navbar-nav icons align-items-center">
                        <li class="nav-item mr-5">
                            <a class="navbar-brand py-3 stile" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">
                                <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                    alt="Logo" style="width:40px;" />
                               <%="BENVENUTO:"+u.getNome()%>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link stile" data-toggle="modal" data-target="#sign-out" href="<%=request.getContextPath() %>/ServletLogout">
                                <i class="fa fa-sign-out"></i> Logout
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
                    class="col-lg-3 col-xl-2 d-none d-lg-flex sidebar align-items-center justify-content-center right-padding max-viewport">
                    <ul class="navbar-nav flex-column">
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-home text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Torna alla Home</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">Gestione Profilo</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazione">Prenota film</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-file-signature text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/html/gestionePrenotaUtente.jsp">Gestione Prenotazioni</a></div>
                        </li>

                </nav>
                <!-- fine side bar -->
                <div class="col-lg-9 col-xl-10 py-5 bg-dark">
                    <!-- titolo dashboard -->
                    <div class="row">
                        <div class="col-12">
                            <div>
                            <h3>
                                <span class="text-uppercase text-danger stile">Dashboard /</span><span
                                    class="text-muted small stile"> Gestione Prenotazioni Film</span>
                            </h3>
                            </div>
                    
                    <!-- fine titolo dashboard -->
                    <!-- inizio funzioni pannello -->
                    <div class="row text-center text-uppercase bg-warning">
                        <div class="col-12 m-0 p-0 text-center">
                            <h1 class="text-dark stile">Film prenotati</h1>
                        </div>

                       
                            <!--Mettere nome attuale dell'utente: -->
                            <table class="table table-hover table-dark">
                                <thead>
                                  <tr>
                                    <th scope="col stile">Titolo film</th>
                                    <th scope="col stile">Locandina</th>
                                    <th scope="col stile">Orario e data / Codice biglietto</th>
                                    <th scope="col stile">Posti prenotati</th>
                                    <th scope="col stile">Prezzo totale</th>
                                    <th scope="col stile">Modifica Prenotazione</th>
                                    <th scope="col stile">Cancella Prenotazione</th>
                                  </tr>
                                </thead>
                               
								
									
                                <tbody>
                                 <% 
                                	List<Prenotazione> listaPreno = (List<Prenotazione>)request.getAttribute("listaPreno");
                                	for(Prenotazione p : listaPreno){
                                	if(request.getAttribute("pDaModificare") == null || !request.getAttribute("pDaModificare").equals(p)){
                                	
                                %>
                                	
                                  <tr>
                                  	<form action="ServletLeggiPrenotazioneById" method="POST">
										<input type="hidden" name="id_prenotazione" value="<%=p.getIdPrenotazione() %>">
                                    
                                    <th scope="row" class="stile"><%=p.getProiezione().getFilm().getTitolo() %></th>
                                    <td><img class="immagine" src="<%=p.getProiezione().getFilm().getLocandina() %>"></td>
                                    <td class="stile"><%= p.getProiezione().getDataOra() %>
                                    
                                    <br>
                                    
                                    codice biglietto???</td>
                                    <td class="stile"><%=p.getPostiPrenotati() %></td>
                                    <td class="stile"><%=p.getCosto_totale() %></td>
                                    <td><button type="submit" class="btn btn-outline-warning stile">Modifica</button></td>
                                    </form>
                                    
                                    
                                    
                                    <form action="ServletCancellaPrenotazione" method="POST">
                                    <input type="hidden" name="id_prenotazione" value="<%=p.getIdPrenotazione() %>">
                                    <td><button type="submit" onclick="history.back()" class="btn btn-outline-danger">Cancella</button></td>
                                 	</form>
                                 	</tr>
                                 	<%}else{ %>
                                 	<tr>
                                 	<form action="ServletModificaPrenotazione" method="POST">
                                 	<input type="hidden" name="id_prenotazione" value="<%=p.getIdPrenotazione() %>">
                                 	
                                 	<% 
                                 		int postiDisponibili = p.getProiezione().getPostiMax();
											for(Prenotazione y : listaPreno){
	                                    	  	if(y.getProiezione().equals(p.getProiezione()))
	                                    			postiDisponibili -= y.getPostiPrenotati(); 
	                                    	}
											postiDisponibili += p.getPostiPrenotati();
                                     %>   	
                                    <!-- Se clicca su modifica si apre questa riga: -->
                                    <th scope="row"><%=p.getProiezione().getFilm().getTitolo() %></th>
                                    <td><img class="immagine" src="<%=p.getProiezione().getFilm().getLocandina() %>"></td>
                                   <td><%= p.getProiezione().getDataOra() %></td>
                                    <td><select name="postiModificati" class="mdb-select md-form colorful-select dropdown-warning">
                                       <% for(int i=1; i <= postiDisponibili; i++){ %>
											<option value="<%= i %>">
												<%= i %>
											</option>
											<%} %>
                                        
                                      </select>
                                    </td>
                                    <td><%=p.getCosto_totale() %></td>
                                    <td><button type="submit" class="btn btn-outline-warning stile">Conferma</button></td>
                                 
                                    
                                    <td><a href="ServletLeggiPrenotazioneUtente"><button type="button" onclick="history.back()" class="btn btn-outline-danger stile">Torna indietro</button></a></td>
                                 </form>
                                  </tr>
                                  
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

        
        <script src="/ProgettoFinaleJava18Gruppo1/js/script.js"></script>
        <script src="/ProgettoFinaleJava18Gruppo1/js/profiloUtente.js"></script>
    </body>
</html>