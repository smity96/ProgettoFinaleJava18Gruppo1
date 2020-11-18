
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="utilities.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="DashboardStaff.jsp"></jsp:include>


            <!-- Inizio main destra -->
            <%
                                      HttpSession s=request.getSession(false);    
                                        //session.getAttribute("utentelog")
                                        //String mail = (String) s.getAttribute("mailLog");
                                        //String pssw = (String) session.getAttribute("psswLog");
                                        Utente u = (Utente)s.getAttribute("uLog");
                                        //Utente u=UtilitiesDbUtente.leggiUtenteById(2);
                                        Utente b=(Utente)(request.getAttribute("d"));
                    
                                        
                    
                %>

            <div class="col-xl-10 col-12 py-3 max-viewport">

                <!-- inizio funzioni main -->

                <!-- inizio modifica utenti -->
          
                <div class="row justify-content-center text-uppercase">
                    <div class="col-12 p-0 text-center">
                        <div class="mb-4">
                            <h1 class="d-inline mr-3">Modifica Utente</h1>
                        </div>

                      <form action="/ProgettoFinaleJava18Gruppo1/ServletModificaUtente?d=<%=b.getIdUtente() %>" method="post" enctype="multipart/form-data"
                      >
                        <table class="table table-bordered table-dark">
                            <thead>
                                <tr>
                                    <th class="scritta-dorata">Dati Personali</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Nome</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="nome"
                                            value="<%=b.getNome() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Cognome</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="cognome"
                                            value="<%=b.getCognome() %>" class="text-capitalize"></td>
                                </tr>
<%SimpleDateFormat sDf=new SimpleDateFormat("yyyy-MM-dd");
String dN=sDf.format(b.getDataDiNascita());
%>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Data di Nascita'</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="date" name="data_di_nascita"
                                            value="<%=dN%>">
                                    </td>
                                </tr>
                            </tbody>
                            <thead>
                                <th class="scritta-dorata">Dati Account</th>
                            </thead>
                            <tbody></tbody>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3 scritta-dorata"><label>Email</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="email"
                                        name="email" value="<%=b.getEmail()%>"></td>
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
                                <th class="col-md-2 col-3 scritta-dorata"><label>Password</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="password" name="password"
                                        placeholder="password"></td>
                            </tr>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3 scritta-dorata"><label>Immagine Profilo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8 col-lg-5 mb-3 mb-lg-1" type="url"
                                    name="datanascita" value="" placeholder="Inserisci URL"><input class="col-8 col-lg-3 m-0"
                                    type="file" name="img" value="<%=b.getImmagine() %>"></td>
                            </tr>
                            </tbody>
                            <thead>
                                <tr>
                                    <th class="cscritta-dorata">Dati Fatturazione</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Partita Iva</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="pIva"
                                            value="<%=b.getPIva() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Indirizzo</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="indirizzo"
                                            value="<%=b.getIndirizzo() %>" class="text-capitalize"></td>
                                </tr>

                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Nome Societa'</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="nomeSoc"
                                            value="<%=b.getNomeSocieta() %>"></td>
                                </tr>
                                    <tr style="visibility: collapse;">
                                    <input type="hidden"name="red" value="<%=u.getRuolo()%>">
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
                <!-- fine modifica utenti -->

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
</body>

</html>