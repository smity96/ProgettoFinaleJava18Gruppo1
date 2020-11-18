
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

                <!-- inizio modifica proiezione -->
                
                <%
                List<Film> films=(List<Film>)request.getAttribute("listaFilms");
                Proiezione pDaModificare=(Proiezione)request.getAttribute("proiezioneDaModificare");
                %>
          
                <div class="row justify-content-center text-uppercase">
                    <div class="col-12 p-0 text-center">
                        <div class="mb-4">
                            <h1 class="d-inline mr-3">Modifica Proiezione</h1>
                        </div>

                      <form action="ServletModificaProiezione" method="post">
                        <table class="table table-bordered table-dark m-0">
                            <thead>
                                <tr>
                                    <th class="scritta-dorata">Dati Proiezione</th>
                                </tr>
                            </thead>
                            <tbody>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Data E Ora Di Inizio</label>
                                    </th>
	                                    <td class="col-md-10 col-9">
	                                    <% SimpleDateFormat tFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm",Locale.ITALY);
	                                     String date= tFormat.format(pDaModificare.getDataOra());
	                                    %>
		                                    <input class="col-8 mx-auto" type="datetime-local"
		                                            name="dataOra" value="<%=date %>" >
	                                    </td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Films</label></th>
                                    
                                    <td class="col-md-10 col-9">
	                                    <select class="col-8 mx-auto" name="film" id="films">
	                                    <% for(Film f: films){
	                                    		if(f.equals(pDaModificare.getFilm())){%>
										 		<option value="<%= f.getIdFilm()%>"><%= f.getTitolo() %></option>
										  <%
	                                    		}
	                                    	} %>
	                                     <% for(Film f: films){
	                                   			if(!f.equals(pDaModificare.getFilm())){%>
										 		<option value="<%= f.getIdFilm()%>"><%= f.getTitolo() %></option>
										  <%
	                                    		}
	                                    	} %>
										</select>
                                    </td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Intervallo</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number" name="intervallo"
                                            value="<%=pDaModificare.getIntervallo()%>"></td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Num. Posti</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number"
                                            name="posti" value="<%=pDaModificare.getPostiMax()%>"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Costo Biglietto</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8 mx-auto" type="number"
                                            name="prezzo" value="<%=pDaModificare.getPrezzo()%>"></td>
                                </tr>
    							<input type="hidden" name="idDaModificare" value="<%= pDaModificare.getIdProiezione() %>">
                                <tr class="d-flex">
                                    <td class="col-12"><button type="submit" class="btn btn-success mr-2">Modifica
                                            Proiezione</button>
                                        <a href="ServletLeggiProiezioniAdmin">
	                                        <button type="button" class="btn btn-danger ml-2" data-dismiss="modal">
	                                            Annulla Inserimento
	                                        </button>
                                        </a>
                                    </td>
                                </tr>
    
                            </tbody>
                        </table>
                            </form>
                    </div>
                </div>
                <!-- fine modifica proiezione -->

            </div>
            <!-- fine main destra -->

        </div>

    </div>
    <!-- Fine Main Content -->

    <!-- Modals -->

    <!-- Modal Uscita -->
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
</body>

</html>