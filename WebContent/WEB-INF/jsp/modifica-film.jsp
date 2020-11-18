
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

                <!-- inizio modifica film -->
          
                <div class="row justify-content-center text-uppercase">
                    <div class="col-12 p-0 text-center">
                        <div class="mb-4">
                            <h1 class="d-inline mr-3">Modifica Film</h1>
                        </div>
                        <%if(request.getAttribute("errore123")!=null){
                                    	%>
                                    	<p>Ahimé, le pellicole sono state inventate solo nel 1896 e purtroppo non prevediamo il futuro<p>
                                    	
                                  <%  }else if(request.getAttribute("erroreParola")!=null){
                                	  %>
                                	  <p>Non puoi inserire lettere come data</p>
                                  <% }
                                    %>

                      <form action="<%=request.getContextPath()%>/ServletModificaFilm" method="post" enctype="multipart/form-data">
                      <%Film f=(Film)request.getAttribute("Film"); %>
                      <input type="hidden" name="id_filmMod" value="<%=f.getIdFilm() %>">
                        <table class="table table-bordered table-dark m-0">
                            <thead>
                                <tr>
                                    <th class="scritta-dorata">Dati Film</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Titolo</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="titolo"
                                            value="<%=f.getTitolo() %>" class="text-capitalize"></td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Genere</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="genere" value="<%=f.getGenere() %>"
                                            class="text-capitalize"></td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Anno di Uscita</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="annoDiUscita"
                                            value="<%=f.getAnnoDiUscita()%>">
                                    </td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Durata</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="text" name="durata"
                                            value="<%=f.getDurata()%>">
                                    </td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Trailer</label></th>
                                    <td class="col-md-10 col-9"><input class="col-8" type="url" name="urlTrailer" value="<%=f.getUrlTrailer()%>">
                                    </td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Trama</label></th>
                                    <td class="col-md-10 col-9"><textarea class="col-8 form-control mx-auto" type="text"
                                            name="trama"><%=f.getTrama() %></textarea></td>
                                </tr>
    
                                <tr class="d-flex">
                                    <th class="col-md-2 col-3 scritta-dorata"><label>Locandina</label></th>
                                    <td class="col-md-10 col-9"><input class="col-md-5 col-8 mr-2" type="url"
                                            name="fileUrl" value="<%= f.getLocandina()%>"><input class="col-md-3 col-sm-8 col-9 mt-3 mt-md-0"
                                            type="file" name="file"></td>
                                </tr>
    
                                <tr class="d-flex">
                                
                                    <td class="col-12"><button type="submit" class="btn btn-success mr-2">Salva
                                            Modifica</button>
                                            <a href="<%=request.getContextPath()%>/ServletOrdinaFilm">
                                            	<button type="button" class="btn btn-danger ml-2">
                                            		Annulla Modifica
                                        		</button>	
                                            </a>
                                        </td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                    </div>
                </div>
                <!-- fine modifica film -->

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