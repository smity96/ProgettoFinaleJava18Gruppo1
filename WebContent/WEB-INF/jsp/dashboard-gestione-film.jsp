<!-- lorem ipsum -->
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

                <!-- inizio gestione film in programmazione -->
                <!-- sono due, il primo primo parte da schermo medio mentre il secondo da quello piccolo fino al medio-->


                    <div class="row text-uppercase text-center d-none d-md-flex">
                        <div class="col-12 p-0">
                            <div class="mb-2 align-items-center justify-content-center">
                                <h1 class="mb-2">Lista Film In Programmazione</h1>
                                <a data-toggle="modal" data-target=".aggiungi-film" href="">
                                    <p class="fas fa-plus aggiungi-custom">Aggiungi Film</p>
                                </a>
                            </div>
                            
                            <%List<Film> tuttiFilm=(List<Film>)request.getAttribute("tuttiFilm"); %>
                                <input class="col-4 mb-3" type="text" id="myInput" onkeyup="myFunction()" placeholder="Cerca Per Titolo">
                            <table class="table table-dark" id="myTable">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-4 scritta-dorata">Locandina</th>
                                        <th class="col-4 scritta-dorata" onclick="sortTable(1)">Titolo</th>
                                        <th class="col-2 scritta-dorata">Modifica Info Film</th>
                                        <th class="col-2 scritta-dorata">Cancella Film</th>
                                    </tr>
                                </thead>
                                <tbody>                        
                                <%for(Film f: tuttiFilm){ %>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-4 bordo-trasparente"><img class="img-fluid film-custom-height"
                                                src="<%=f.getLocandina() %>" alt=""></td>
                                        <td class="col-4 text-capitalize bordo-trasparente">
                                            <p class="scritta-dorata"><%=f.getTitolo() %></p>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletLeggiFilmToModifica?id_FilmMod=<%=f.getIdFilm() %>">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        <td class="col-2 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletCancellaFilm?id_film=<%=f.getIdFilm() %>"><i
                                                    class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                  <!-- inizio gestione film in programmazione parte 2 -->

                    <div class="row text-uppercase text-center d-flex d-md-none">
                        <div class="col-12 p-0">
                            <div class="mb-3 align-items-center justify-content-center">
                                <h1 class="mb-2 titolo-custom">Lista Film In Programmazione</h1>
                                <p><a data-toggle="modal" data-target=".aggiungi-film" href="">
                                        <i class="fas fa-plus aggiungi-custom">Aggiungi Film</i>
                                    </a></p>
                            </div>
                            <input class="col-4 mb-3" type="text" id="myInput4" onkeyup="myFunction4()" placeholder="Cerca per Titolo">
                            <table class="table table-dark" id="myTable2">
                                <thead>
                                    <tr class="d-flex justify-content-center">
                                        <th class="col-6 scritta-dorata" onclick="sortTable2(0)">Titolo</th>
                                        <th class="col-3 scritta-dorata">Modifica Info Film</th>
                                        <th class="col-3 scritta-dorata">Cancella Film</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <%for(Film f: tuttiFilm){ %>
                                    <tr class="d-flex align-items-center">
                                        <td class="col-6 text-capitalize bordo-trasparente">
                                            <img class="img-fluid film-custom-height mb-3"
                                                src="<%=f.getLocandina() %>" alt="">
                                            <p class="scritta-dorata"><%=f.getTitolo() %></p>
                                        <td class="col-3 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletLeggiFilmToModifica?id_FilmMod=<%=f.getIdFilm() %>">
                                                <i class="colore-icone-scuro icona-menu-grande fas fa-edit"></i>
                                            </a>
                                        <td class="col-3 bordo-trasparente">
                                            <a href="<%=request.getContextPath()%>/ServletCancellaFilm?id_film=<%=f.getIdFilm() %>"><i
                                                    class="colore-icone-scuro icona-menu-grande fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                <!-- fine gestione film in programmazione -->



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

    <!-- Modal Aggiungi Film -->

    <div class="modal fade aggiungi-film text-center">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body p-0 m-0">
                <form action="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletInserisciFilm" method="post" enctype="multipart/form-data">
                    <table class="table table-bordered table-hover table-dark m-0">
                        <thead>
                            <tr>
                                <th>Dati Film</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Titolo</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="titolo"
                                        placeholder="Titolo" class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Genere</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="genere" placeholder="Genere"
                                        class="text-capitalize"></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Anno di Uscita</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="annoDiUscita"
                                        placeholder="Anno">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Durata</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="text" name="durata"
                                        placeholder="Inserire i minuti complessivi senza simboli">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trailer</label></th>
                                <td class="col-md-10 col-9"><input class="col-8" type="url" name="urlTrailer" placeholder="Url del trailer">
                                </td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Trama</label></th>
                                <td class="col-md-10 col-9"><textarea class="col-8 form-control mx-auto"
                                        name="trama">Bella Chen il Malvagio</textarea></td>
                            </tr>

                            <tr class="d-flex">
                                <th class="col-md-2 col-3"><label>Locandina</label></th>
                                <td class="col-md-10 col-9"><input class="col-md-5 col-8 mr-2" type="url"
                                        name="fileUrl" placeholder="Url dell'immagine"><input class="col-md-3 col-sm-8 col-9 mt-3 mt-md-0"
                                        type="file" name="file" placeholder="Immagine"></td>
                            </tr>
                            <tr class="d-flex">
                                <td class="col-12"><button type="submit" class="btn btn-success mr-2">Aggiungi
                                        Film</button>
                                    <button type="button" class="btn btn-danger ml-2" data-dismiss="modal">
                                        Annulla Inserimento
                                    </button></td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Fine Modal Aggiungi Film -->

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
        <script src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/js/riordina.js" type="text/javascript"></script>
</body>

</html>