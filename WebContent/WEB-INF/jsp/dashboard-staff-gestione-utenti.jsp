
<%@page import="utilities.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="DashboardStaff.jsp"></jsp:include>

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

                            <input class="col-4 mb-3" type="text" id="myInput2" onkeyup="myFunction2()" placeholder="Cerca Per ID Utente">
                            <input class="col-4 mb-3" type="text" id="myInput" onkeyup="myFunction()" placeholder="Cerca Per Nome Utente">

                            <table class="table table-bordered table-hover table-dark" id="myTable">
                                <thead>
                                    <tr class="d-flex">
                                        <th class="col-3 scritta-dorata" onclick="sortTable(0)">Id Utente</th>
                                        <th class="col-3 scritta-dorata" onclick="sortTable(1)">Nome Utente</th>
                                        <th class="col-3 scritta-dorata">Cancella Utente</th>
                                        <th class="col-3 scritta-dorata">Modifica Utente</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                
                                List<Utente>lU=(List<Utente>)request.getAttribute("listaU");
                                int i=0;
                                    for(Utente g:lU){
                                    	i++;
                                %>
                                    <tr class="d-flex">
                                        <td class="col-3 scritta-dorata"><%=i %></td>
                                        <td class="col-3 scritta-dorata"><%=g.getEmail() %></td>
                                        <td class="col-3"><a href="/ProgettoFinaleJava18Gruppo1/ServletCancellaUtente?canc=<%=g.getIdUtente()%>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-trash-alt"></i></a>
                                        </td>
                                        <td class="col-3"><a href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLeggiUtenteById?d=<%=g.getIdUtente() %>"><i
                                                    class="colore-icone-scuro icona-menu-piccolo fas fa-edit"></i></a>
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
                                <h1 class="d-inline mr-3 titolo-custom">Gestione Utenti</h1>
                            </div>
                            
                            <input class="col-3 mb-3" type="text" id="myInput4" onkeyup="myFunction4()" placeholder="ID Utente">
                            <input class="col-3 mb-3" type="text" id="myInput3" onkeyup="myFunction3()" placeholder="Nome Utente">
                            <table class="table table-bordered table-dark" id="myTable2">
                                <thead>
                                    <tr class="d-flex">
                                        <th class="col-2 scritta-dorata" onclick="sortTable2(0)">Id� Utente</th>
                                        <th class="col-2 scritta-dorata" onclick="sortTable2(1)">Nome Utente</th>
                                        <th class="col-5 scritta-dorata">Gestisci Utente</th>
                                        <th class="col-3 scritta-dorata">Conferma Operazione</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                int nR=0;
                                for(Utente x:lU){
                                	nR++;
                                                    %>         
                                    <tr class="d-flex">
                                        <td class="col-2 scritta-dorata"><%=nR %></td>
                                        <td class="col-2 scritta-dorata"><%=x.getNome() %></td>
                                        <td class="col-5"><label><select class="col-12 text-center h-100"
                                                    name="gestici-utente">
                                                    <option value="cancella-utente">cancella utente</option>
                                                    <option value="modifica-utente">modifica utente</option>
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
    
    
     <!-- Footer: -->
    
    


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
        <script src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/js/script.js" type="text/javascript"></script>
        <script src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/js/riordina.js" type="text/javascript"></script>
</body>

</html>