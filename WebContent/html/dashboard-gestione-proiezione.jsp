<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
   
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
	<link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/stylemain.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash-final.css">
<%
              						   HttpSession s=request.getSession(false);    
										//session.getAttribute("utentelog")
                               			//String mail = (String) s.getAttribute("mailLog");
                						//String pssw = (String) session.getAttribute("psswLog");
                						Utente u = (Utente)s.getAttribute("uLog");
                						//Utente u=UtilitiesDbUtente.leggiUtenteById(2); 
                						
                	
                %>
                
<% 
	//Lettura cookie utente
	if(u==null){
		String idUtente=null;
		Cookie cookies[]=request.getCookies();
		for(Cookie c:cookies){
			if(c.getName().equals("idUtente")){
				idUtente=c.getValue();
			}
		}
		String url=request.getRequestURI();
	}
%>
</head>
<body style="font-family: 'Monserrat', sans-serif">
	<!-- navbar in alto-->
	<nav class="navbar navbar-expand-xl">
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
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-messaggio-benvenuto.jsp"><i class="fas fa-folder-open mr-3 text-muted"></i>Dashboard</a>
                    </li>
          
                    <li class="nav-item nav-item-custom">
                      <a class="nav-link scritta-click-scuro scritta-dorata" href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-profilo.jsp"><i class="fas fa-user mr-3 text-muted"></i>Gestione Profilo</a>
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
                                href="/ProgettoFinaleJava18Gruppo1/html/dashboard-messaggio-benvenuto.jsp">Dashboard</a></div>
                    </li>
                    <li class="nav-item d-flex justify-content-around align-items-center my-3">
                        <div class="col-2 m-0"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                        <div class="col-6 m-0"><a class="nav-link scritta-dorata scritta-click-scuro"
                                href="/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-profilo.jsp">Gestione Profilo</a></div>
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

			<!-- Inizio main destra -->

			<div class="col-xl-10 col-12 py-3 max-viewport">

				<!-- inizio funzioni main -->
                
 <!-- inizio gestione proiezione -->
				<!-- come sopra, sono sempre due, uno parte dallo schermo medio, l'altro dal piccolo -->

					<div class="row text-uppercase text-center d-none d-md-flex">
						<div class="col-12 p-0">
							<div class="mb-3 align-items-center justify-content-center">
								<h1 class="mb-2">Gestione Proiezioni</h1>
								<p>
									<a data-toggle="modal" data-target=".aggiungi-film-proiezione"
										href=""> <i class="fas fa-plus aggiungi-custom">Aggiungi
											Film Alla Proiezione</i>
									</a>
								</p>
								<% 
								boolean errore=false;
								if(request.getAttribute("errore")!=null){
									 errore=(boolean)request.getAttribute("errore");
								}
								if (errore){
								%>
								<p>Attenzione! La proiezione che hai inserito o modificato va in conflitto con altre
								 proiezioni o e' antecedente alla data e ora attuale.</p>
								 <%} %>
							</div>
							<table class="table table-dark">
								<thead>
									<tr class="d-flex justify-content-center">
										<th class="col-2 scritta-dorata">Data e Ora</th>
										<th class="col-2 scritta-dorata">Film Proiettato</th>
										<th class="col-2 scritta-dorata">Intervallo</th>
										<th class="col-2 scritta-dorata">N. Posti</th>
										<th class="col-2 scritta-dorata">Costo Biglietto</th>
										<th class="col-1 scritta-dorata">Modifica Proiezione</th>
										<th class="col-1 scritta-dorata">Cancella Proiezione</th>
									</tr>
								</thead>
								<tbody>

									<%
                                List<Proiezione> proiezioni = (List<Proiezione>)request.getAttribute("proiezioni");
                                for(Proiezione p : proiezioni){ 
                                %>
									<tr class="d-flex align-items-center justify-content-center">
										<td class="col-2 bordo-trasparente scritta-dorata">
										<%
										SimpleDateFormat ita=new SimpleDateFormat("E dd MMM yyyy HH:mm",Locale.ITALY);
										String dateIta=ita.format(p.getDataOra());
										%>
											<p><%= dateIta %></p>
										</td>
										<td
											class="col-2 bordo-trasparente text-capitalize scritta-dorata">
											<img class="img-fluid film-custom-height mb-3"
											src="<%= p.getFilm().getLocandina() %>" alt="">
											<p><%= p.getFilm().getTitolo() %></p>
										</td>
										<td class="col-2 bordo-trasparente scritta-dorata">
											<p><%= p.getIntervallo() %></p>
										</td>
										<td class="col-2 bordo-trasparente scritta-dorata">
											<p><%= p.getPostiMax() %></p>
										</td>
										<td class="col-2 bordo-trasparente scritta-dorata">
											<p><%= p.getPrezzo()%></p>
										</td>
										<td class="col-1 bordo-trasparente"><form action="ServletLeggiProiezioneById" method="get">
												<input type="hidden" name="idDaModificare"
													value="<%= p.getIdProiezione() %>">
												<button type="submit" class="btn">
													<i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
												</button>
											</form></td>

										<td class="col-1 bordo-trasparente">
											<form action="ServletCancellaProiezione" method="POST">
												<input type="hidden" name="idDaEliminare"
													value="<%= p.getIdProiezione() %>">
												<button type="submit" class="btn">
													<i
														class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
												</button>
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
								<h1 class="d-inline mr-3 titolo-custom">Gestione Proiezione</h1>
								<p>
									<a data-toggle="modal" data-target=".aggiungi-film-proiezione"
										href=""> <i class="fas fa-plus aggiungi-custom">Aggiungi
											Film Alla Proiezione</i>
									</a>
								</p>
							</div>
							<table class="table table-dark">
								<thead>
									<tr class="d-flex justify-content-center">
										<th class="col-4 scritta-dorata">Film Proiettato</th>
										<th class="col-4 scritta-dorata">Info Film</th>
										<th class="col-2 scritta-dorata">Modifica Proiezione</th>
										<th class="col-2 scritta-dorata">Cancella Proiezione</th>
									</tr>
								</thead>
								<tbody>
									<%for(Proiezione p : proiezioni){  %>
									<tr class="d-flex align-items-center justify-content-center">
										<td
											class="col-4 bordo-trasparente text-capitalize scritta-dorata">
											<img class="img-fluid film-custom-height mb-3"
											src="<%= p.getFilm().getLocandina() %>" alt="">
											<p><%= p.getFilm().getTitolo() %></p>
										</td>
										<td class="col-4 bordo-trasparente scritta-dorata">
											<p>Data E Ora:</p>
											<p class="p-0 m-0"><%= p.getDataOra() %></p>
											<p>Intervallo:</p>
											<p><%= p.getIntervallo() %></p>
											<p>N. Posti:</p>
											<p><%= p.getPostiMax() %></p>
											<p>Costo Bilietto:</p>
											<p><%= p.getPrezzo() %> </p>
										</td>

										<td class="col-2 bordo-trasparente">
										<!-- TODO change get to post -->
											<form action="ServletLeggiProiezioneById" method="get">
												<input type="hidden" name="idDaModificare"
													value="<%= p.getIdProiezione() %>">
												<button type="submit" class="btn">
													<i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
												</button>
											</form>
										</td>
										<td class="col-2 bordo-trasparente">
											<form action="ServletCancellaProiezione" method="POST">
												<input type="hidden" name="idDaEliminare"
													value="<%= p.getIdProiezione() %>">
												<button type="submit" class="btn">
													<i class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
												</button>
											</form>
										</td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</div>
					</div>
				<!-- fine gestione proiezione -->



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
									<th class="col-md-2 col-3"><label>Data E Ora Di
											Inizio</label></th>
									<td class="col-md-10 col-9"><input class="col-8 mx-auto"
										type="datetime-local" name="dataOra"></td>
								</tr>
								<tr class="d-flex">
									<th class="col-md-2 col-3"><label>Titolo</label></th>
									<td class="col-md-10 col-9"><select
										class="col-8 mx-auto text-center h-100" name="id">
											<% List<Film> films=(List<Film>)request.getAttribute("films");
                                        for(Film f : films){ %>
											<option value="<%= f.getIdFilm() %>"><%= f.getTitolo() %></option>
											<%} %>
									</select></td>
								</tr>
								<tr class="d-flex">
									<th class="col-md-2 col-3"><label>Intervallo</label></th>
									<td class="col-md-10 col-9"><input class="col-8 mx-auto"
										type="number" name="intervallo"></td>
								</tr>
								<tr class="d-flex">
									<th class="col-md-2 col-3"><label>N. Posti</label></th>
									<td class="col-md-10 col-9"><input class="col-8 mx-auto"
										type="number" name="posti"></td>
										<tr class="d-flex">
									<th class="col-md-2 col-3"><label>Costo Biglietto</label></th>
									<td class="col-md-10 col-9"><input class="col-8 mx-auto"
										type="number" name="prezzo"></td>
								</tr>
								<tr class="d-flex">
									<td class="col-12"><button type="submit"
											class="btn btn-success mr-2">Aggiungi Proiezione</button>
										<button type="submit" class="btn btn-danger ml-2"
											data-dismiss="modal">Annulla Inserimento</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Fine Modal Aggiungi Film alla Proiezione -->
	
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