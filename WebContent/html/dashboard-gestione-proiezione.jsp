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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<%
              						  HttpSession s=request.getSession(false);    
										//session.getAttribute("utentelog")
                               			//String mail = (String) s.getAttribute("mailLog");
                						//String pssw = (String) session.getAttribute("psswLog");
                						Utente u = (Utente)s.getAttribute("uLog");
                						//Utente u=UtilitiesDbUtente.leggiUtenteById(2);
                						
                	
                %>
<style type="text/css">
<%@ include file="../css/style-dash.css"%>
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
			<button class="navbar-toggler btn-danger" type="button"
				data-toggle="collapse" data-target="#myNavbar"
				aria-controls="myNavbar" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links collapse -->

			<div class="collapse navbar-collapse justify-content-end"
				id="myNavbar">
				<ul class="navbar-nav links d-flex d-xl-none">
					<li class="nav-item d-flex my-3"><i
						class="fas fa-folder-open text-muted mr-3 nav-size col-2"></i> <a
						class="nav-link col-10" href="#">Torna Al Sito</a></li>
					<li class="nav-item d-flex my-3"><i
						class="fa fa-home text-muted mr-3 nav-size col-2"></i> <a
						class="nav-link active1 col-10" href="#">Dashboard</a></li>
					<li class="nav-item d-flex my-3"><i
						class="fas fa-user text-muted mr-3 nav-size col-2"></i> <a
						class="nav-link active2 col-10" href="#">Gestione Profilo</a></li>
					<li class="nav-item d-flex align-items-center my-3">
						<div class="col-3">
							<i class="fas fa-video text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-9 ml-3">
							<a class="nav-link active3" href="#">Gestisci Prenotazioni</a>
						</div>
					</li>
					<li class="nav-item d-flex my-3"><i
						class="fas fa-film text-muted mr-3 nav-size col-2"></i> <a
						class="nav-link active4 col-10" href="#">Gestione Film</a></li>
					<li class="nav-item d-flex my-3"><i
						class="fas fas fa-calendar-alt text-muted mr-3 nav-size col-2"></i>
						<a class="nav-link active5 col-10" href="#">Gestione
							Proiezioni</a></li>
					<li class="nav-item d-flex my-3"><i
						class="fas fa-users text-muted mr-3 nav-size col-2 ml-0"></i> <a
						class="nav-link active6 col-10" href="#">Gestione Utenti</a>></li>
				</ul>

				<!-- nav icons -->
				<ul class="navbar-nav icons d-xl-flex d-none align-items-center">
					<li class="nav-item"><a class="navbar-brand" href="#"> <img
							src="../src/logocinema.png"
							class="img-fluid rounded-circle img-thumbnail mr-3" alt="Logo"
							style="width: 40px;" /> <%="BENVENUTO:"+u.getNome() %>
					</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal"
						data-target="#sign-out" href="#"> <i
							class="fas fa-sign-out-alt mr-2"></i>Sign Out
					</a></li>
				</ul>

				<ul class="navbar-nav icons d-flex d-xl-none justify-content-end">
					<li class="nav-item"><a class="navbar-brand col-2" href="#">
							<img src="../src/logocinema.png"
							class="img-fluid rounded-circle img-thumbnail mr-3" alt="Logo"
							style="width: 40px;" /> <span class="col-10"><%=u.getNome() %></span>
					</a></li>
					<li class="nav-item"><a class="nav-link col-10 offset-col-2"
						data-toggle="modal" data-target="#sign-out" href="#"> <i
							class="fas fa-sign-out-alt mr-2"></i> <span>Sign Out </span>
					</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<!-- fine nav -->

	<!-- main content -->

	<div class="container-fluid main-bg-dorato">
		<div class="row">

			<!-- Inizio Sidebar sinistra -->

			<nav
				class="col-xl-2 d-none d-xl-flex sidebar justify-content-center max-viewport">
				<ul class="navbar-nav flex-column list-side-height">
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fas fa-folder-open text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link" href="#">Torna Al Sito</a>
						</div>
					</li>
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fa fa-home text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link active1" href="#">Dashboard</a>
						</div>
					</li>
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fas fa-user text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link active2" href="#">Gestione Profilo</a>
						</div>
					</li>
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fas fa-video text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link active3" href="#">Gestisci Prenotazioni</a>
						</div>
					</li>
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fas fa-film text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link active4" href="#">Gestione Film</a>
						</div>
					</li>
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fas fa-calendar-alt text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link active5" href="#">Gestione Proiezioni</a>
						</div>
					</li>
					<li
						class="nav-item d-flex justify-content-around align-items-center my-3">
						<div class="col-2 m-0">
							<i class="fas fa-users text-muted mr-3 nav-size"></i>
						</div>
						<div class="col-6 m-0">
							<a class="nav-link active6" href="#">Gestione Utenti</a>
						</div>
					</li>
				</ul>
			</nav>
			<!-- fine sidebar -->

			<!-- Inizio main destra -->

			<div class="col-xl-10 col-12 py-3 max-viewport">

				<!-- inizio funzioni main -->
                
 <!-- inizio gestione proiezione -->
				<!-- come sopra, sono sempre due, uno parte dallo schermo medio, l'altro dal piccolo -->


				<div
					class="container-fluid m-0 p-0 d-none funzione-menu gestione-proiezione">


					<div class="row text-uppercase text-center d-none d-md-flex">
						<div class="col-12 p-0">
							<div class="mb-3 align-items-center justify-content-center">
								<h1 class="mb-2">Gestione Programmazione</h1>
								<p>
									<a data-toggle="modal" data-target=".aggiungi-film-proiezione"
										href=""> <i class="fas fa-plus aggiungi-custom">Aggiungi
											Film Alla Proiezione</i>
									</a>
								</p>
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
										<td
											class="col-2 bordo-trasparente text-capitalize colore-icone-scuro">
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
										<td class="col-2 bordo-trasparente"><a
											data-toggle="modal" data-target=".modifica-film-proiezione"
											href=""> <i
												class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
										</a></td>

										<td class="col-2 bordo-trasparente">
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
								<h1 class="d-inline mr-3">Gestione Proiezione</h1>
								<p>
									<a data-toggle="modal" data-target=".aggiungi-film-proiezione"
										href=""> <i class="fas fa-plus aggiungi-custom">Aggiungi
											Film Alla Proiezione</i>
									</a>
								</p>
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
										<td
											class="col-4 bordo-trasparente text-capitalize colore-icone-scuro">
											<img class="img-fluid film-custom-height mb-3"
											src="<%= p.getFilm().getLocandina() %>" alt="">
											<p><%= p.getFilm().getTitolo() %></p>
										</td>
										<td class="col-4 bordo-trasparente colore-icone-scuro">
											<p>Data E Ora:</p>
											<p class="p-0 m-0"><%= p.getDataOra() %></p>
											<p>Intervallo:</p>
											<p><%= p.getIntervallo() %></p>
											<p>N. Posti:</p>
											<p><%= p.getPostiMax() %></p>	
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
				</div>
				<!-- fine gestione proiezione -->



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
						&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">Premi logout per uscire.</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						Rimani</button>
					<button
						onclick="location.href='http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLogout';"
						type="button" class="btn btn-danger" data-dismiss="modal">
						Esci</button>
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
									<th class="col-md-2 col-3"><label>N� Posti</label></th>
									<td class="col-md-10 col-9"><input class="col-8 mx-auto"
										type="number" name="posti"></td>
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