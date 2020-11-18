
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="utilities.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
 <jsp:include page="DashboardAdmin.jsp"></jsp:include>

			<!-- Inizio main destra -->

			<div class="col-xl-10 col-12 py-3 max-viewport">

				<!-- inizio funzioni main -->

				<!-- inizio gestione prenotazione -->

				<div class="row text-uppercase text-center">
					<div class="col-12 p-0">
						<div class="mb-4">
							<h1 class="d-inline mr-3 titolo-custom">Gestione
								Prenotazione</h1>
						</div>
						<input class="col-4 mb-3" type="text" id="myInput2" onkeyup="myFunction2()" placeholder="Cerca Email">
                        <input class="col-4 mb-3" type="text" id="myInput5" onkeyup="myFunction5()" placeholder="Cerca Film o Ora">
						<table class="table table-bordered table-dark mb-0" id="myTable">
							<thead>
								<tr class="d-flex">
									<th class="col-2 scritta-dorata" onclick="sortTable(0)">Utente</th>
									<th class="col-8 scritta-dorata">Film Prenotato</th>
									<th class="col-2 scritta-dorata">Cancella Prenotazione</th>
								</tr>
							</thead>
							<tbody>
								<% 
                            	
                            	List<Prenotazione> listaPreno = (List<Prenotazione>)request.getAttribute("listaPreno");
                            	for(Prenotazione p : listaPreno){
                            		
                            %>
								<tr class="d-flex">
									<td class="col-2 scritta-dorata"><%=p.getUtente().getEmail() %></td>
									<td id="nomeFilmScelta" class="col-4"><img
										class="img-fluid film-custom-height mb-3"
										src="<%=p.getProiezione().getFilm().getLocandina() %>" alt="">
									</td>
									<td class="col-2 scritta-dorata">
										<p><%=p.getProiezione().getFilm().getTitolo() %> </p>
										
										<% 
											SimpleDateFormat dataIta = new SimpleDateFormat("dd-MM-yyyy" + "   " + "hh:mm");	
											String oraIta = dataIta.format(p.getProiezione().getDataOra());
										%>
										
										<p><%=oraIta%></p>
									</td>
									<td class="col-2">
									
										<p>N. Posti Prenotati:</p>
										<p><%=p.getPostiPrenotati() %></p>
									</td>
									<td class="col-2">
										<form action="ServletCancellaPrenotazioneAdmin" method="POST">
											<input type="hidden" name="id_prenotazione"
												value="<%=p.getIdPrenotazione() %>">
											<button class="btn align-items-center" type="submit">
												<i
													class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i>
											</button>
										</form>
									</td>
									
								</tr>
							
					
								<%} %>
						 </tbody>
						</table>
							

					</div>
				</div>
				<!-- fine gestione prenotazione -->



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
					<h4 class="modal-title stile text-warning">Vuoi fare il
						logout?</h4>
					<button type="button" class="close" data-dismiss="modal">
						&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body stile bg-dark text-warning">Premi
					logout per uscire.</div>

				<!-- Modal footer -->
				<div class="modal-footer stile">
					<button type="button" class="btn btn-outline-warning text-light"
						data-dismiss="modal">Rimani</button>
					<button
						onclick="location.href='http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLogout';"
						type="button" class="btn btn-outline-danger text-light"
						data-dismiss="modal">Logout</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Fine Modal Uscita -->

	<!-- Footer: -->
	<jsp:include page="footer.jsp"></jsp:include>



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
	<script
		src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/js/riordina.js"
		type="text/javascript"></script>
</body>

</html>