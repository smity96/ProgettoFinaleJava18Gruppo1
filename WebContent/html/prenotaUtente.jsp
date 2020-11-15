<%@page import="model.Utente"%>
<%@page import="model.Prenotazione"%>
<%@page import="model.Proiezione"%>
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
<%
HttpSession s=request.getSession(false); 
Utente u = (Utente)s.getAttribute("uLog");
%>

<body style="font-family: 'Monserrat', sans-serif">
<!-- navbar -->

        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="navbar-brand text-uppercase" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">
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
                            <a class="navbar-brand py-3" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">
                                <img src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                    alt="Logo" style="width:40px;" >
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
                            <div >
                            <h3>
                                <span class="text-uppercase text-danger stile">Dashboard /</span><span
                                    class="text-muted small stile"> Prenotazione Film</span>
                            </h3>
                            </div>
                        
                    
                    <!-- fine titolo dashboard -->
                    
                    
                    <!-- inizio funzioni pannello -->
                    <div class="row text-center text-uppercase bg-warning">
                        <div class="col-12 m-0 p-0 text-center">
                            <h1 class="text-dark stile">Prenota film</h1>
                        </div>

                        
                            <!--Mettere nome attuale dell'utente: -->
                            <table class="table table-hover table-dark">
                                <thead>
                                  <tr>
                                    <th class="stile" scope="col">Titolo film</th>
                                    <th class="stile" scope="col">Locandina</th>
                                    <th class="stile" scope="col">Orario e data</th>
                                    <th class="stile" scope="col">Posti disponibili</th>
                                    <th class="stile" scope="col">Numero posti prenotazione</th>
                                    <th class="stile" scoper="col">Prezzo biglietto singolo</th>
                                    <th class="stile" scope="col">Prenota film</th>
                                    </tr>
                                </thead>

							<tbody>



								<%                                   
	                                  List<Proiezione> listaProiez = (List<Proiezione>) request.getAttribute("listaProiez");
	                                  List<Prenotazione> listaPreno = (List<Prenotazione>) request.getAttribute("listaPreno");
	                                  	
	                                  for(Proiezione x : listaProiez ){
	                                	  boolean prenotato = false;
	                                	  
	                                    	
	                                    	for(Prenotazione y : listaPreno){
	                                    		if(y.getProiezione().equals(x) && y.getUtente().equals(u)){
	                                    			prenotato=true;
	                                    		}
	                                    	}
                                  
                                  %>
								<form action="ServletInserisciPrenotazione" method="POST">

									<input type="hidden" name="id_utente"
										value="<%=u.getIdUtente() %>"> <input type="hidden"
										name="id_proiezione" value="<%=x.getIdProiezione() %>">
								<tr>
									<th class="stile" scope="row"><%= x.getFilm().getTitolo() %></th>
									<td><img class="immagine"
										src="<%= x.getFilm().getLocandina()%>"></td>
									<td class="stile"><%= x.getDataOra()%></td>
									<td class="stile"><%= x.getIntervallo() + x.getFilm().getDurata() %></td>
									<td class="stile">
										<%	
                                        	
											int postiDisponibili = x.getPostiMax();
											for(Prenotazione y : listaPreno){
	                                    	  	if(y.getProiezione().equals(x))
	                                    			postiDisponibili -= y.getPostiPrenotati(); 
	                                    	}
                                        	if(prenotato == false && postiDisponibili!=0){
	                                        	
	                                        	
	                                        	
	                                        	
                                        %> <select
										name="posti_prenotati"
										class="mdb-select md-form colorful-select dropdown-warning">
											<% for(int i=1; i <= postiDisponibili; i++){ %>
											<option value="<%= i %>">
												<%= i %>
											</option>
											<%} %>
									</select> 
                                        <% }else if(postiDisponibili == 0 && prenotato == false){%>
											Non disponibili 
										<%}else if(prenotato == true){ %>
											Prenotazione gi�' effettuata
											<%} %>
									</td>
									<td class="stile" ><%= x.getPrezzo() %></td>

									<% 
                                    		if(postiDisponibili!=0 && prenotato == false){ 
                                    	%>

									<td><button type="submit" onclick="history.back()"
											class="btn btn-outline-warning stile">Prenota</button></td>

									<% } else if(postiDisponibili == 0 && prenotato == false){%>

									<td><button type="submit" onclick="history.back()"
											class="btn btn-outline-warning stile" disabled>Posti
											Esauriti</button></td>

									<%} else if(prenotato == true){ %>

									<td>
										<!-- se prenotato diventa cosi: -->
										<button type="button" class="btn btn-outline-warning stile" disabled>Prenotato</button>

									</td>
									<% } %>
									
								</tr>
								</form>
								<% }%>
							</tbody>
						</table>

					</div>



				</div>
			</div>

		</div>
	</div>
	<!-- Modal -->
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
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>

	<script src="../js/script.js"></script>
	<script src="../js/profiloUtente.js"></script>
</body>
</html>