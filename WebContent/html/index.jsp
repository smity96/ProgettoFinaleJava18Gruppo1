<%@page import="utilities.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        .titolo {
            font-family:
        }
    </style>

    <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel="icon" href="/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type="image/x-icon">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">

    <!--Bootstrap links-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/stylemain.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-index.css">
</head>

<body style="font-family: 'Montserrat', sans-serif">
<% 
HttpSession s=request.getSession(false);
Utente u=(Utente)s.getAttribute("uLog");
	if(u==null||u.getRuolo()==0){  %>
    <jsp:include page="navbarNonLog.jsp"></jsp:include>
<%} else if(u.getRuolo()==3){%>
	<jsp:include page="NavbarAdmin.jsp"></jsp:include>
<%} else if(u.getRuolo()==2){%>
	<jsp:include page="NavbarStaff.jsp"></jsp:include>
<%} else if(u.getRuolo()==1){%>
	<jsp:include page="navbarNotte.jsp"></jsp:include>
<%} %>


    <header>
        <div class="container-fluid banner align-items-center">

            <div class="row justify-content-center align-items-center d-flex">
                <div class="col-12 mx-auto justify-content-center align-items-center d-flex custom-posizionamento">
                    <img class="img-fluid img-banner p-0 m-0"
                        src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/s-logo.png" alt="header-image">
                    <span class="banner-title scritta-dorata customposizionamento3">orrento</span>
                </div>
            </div>
            <div class="row justify-content-center align-items-center d-flex">
                <div class="col-12 mx-auto justify-content-center align-items-center d-flex custom-posizionamento2">
                    <h1 class="banner-title scritta-dorata"> Cinema </h1>
                </div>
            </div>
        </div>
        <!-- fine banner -->
    </header>
    <!-- fine heder -->

    <!-- sezione film -->
    <section class="pt-5 bg-grigio-scuro">
        <div class="container">

            <!-- sezione titolo -->
            <div class="row">
                <div class="col-10 mx-auto col-sm-6 mb-2 text-center">
                    <h1 class="text-capitalize scritta-dorata scritta-programmazione">ora in <strong
                            class="scritta-dorata">programmazione</strong></h1>
                </div>
            </div>
            <!-- fine sezione titolo -->
            
             

            <!-- inizio filtro -->

            <div class="col-12 mx-auto d-flex sortBtn flex-wrap">
                <div class="col-12 mx-auto d-flex sortBtn justify-content-center flex-wrap"><a
                        class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="all">
                        <h5 class="scritta-dorata scritta-click-scuro">tutti</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="animazione">
                        <h5 class="scritta-dorata scritta-click-scuro">animazione</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="azione">
                        <h5 class="scritta-dorata scritta-click-scuro">azione</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="azione">
                        <h5 class="scritta-dorata scritta-click-scuro">avventura</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="commedia">
                        <h5 class="scritta-dorata scritta-click-scuro">commedia</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase justify-content-start fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="fantasy">
                        <h5 class="scritta-dorata scritta-click-scuro">fantasy</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="fantascienza">
                        <h5 class="scritta-dorata scritta-click-scuro">fantascienza</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="guerra">
                        <h5 class="scritta-dorata scritta-click-scuro">guerra</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="horror">
                        <h5 class="scritta-dorata scritta-click-scuro">horror</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="musical">
                        <h5 class="scritta-dorata scritta-click-scuro">musical</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="romantico">
                        <h5 class="scritta-dorata scritta-click-scuro">romantico</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="storico">
                        <h5 class="scritta-dorata scritta-click-scuro">storico</h5>
                    </a></div>
                <div class="col-xl-2 col-lg-3 col-sm-4 col-6 mx-auto d-flex justify-content-center sortBtn flex-wrap">
                    <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                        data-filter="thriller">
                        <h5 class="scritta-dorata scritta-click-scuro">thriller</h5>
                    </a>
                </div>

            </div>
        </div>
        <!-- fine filtro -->
        
       <input type="text" id="ricercaTitolo" oninput="ricercaTitolo()">

        <!-- inizio lista film -->
        <div class="row d-flex text-center">

            <!-- singolo film -->
            <%  List<Proiezione> proiezioni = (List<Proiezione>)request.getAttribute("proiezioni");
              ArrayList<Film> films = new ArrayList<>();
              for(Proiezione p : proiezioni){ 
              if(films.contains(p.getFilm())){
            	  continue;
              }else{
            	  films.add(p.getFilm());
            	  %>
            <div class="col-10 col-md-6 col-lg-4 mx-auto my-3 films f.getGenere proiezione" id="<%=p.getFilm().getTitolo()%>">
                <div class="card single-film size-custom">
                    <div class="img-container size-custom">
                        <!-- il getlocandina stava qui -->
                        <%// TODO Sistemare questa parte  %>
                        <img src="<%= p.getFilm().getLocandina()%>" class=" img-custom" alt="">
                        <span class="film-item-icon mx-0 px-0">
                        	<a style="color: #000000" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLeggiProiezioniPalinsesto">
                            <div class="col-12">
                                <i class="fas fa-calendar-alt text-capitalize px-lg-2 px-1"></i>
                                	<span class="pl-lg-2 pl-1">Clicca per andare alla programmazione</span>
                            </div>
                            </a>
                        </span>
                    </div>
                </div>
            </div>
            <% }} %>
            <!-- fine singolo film -->

        </div>
        <!-- fine lista film -->
        </div>
    </section>
    <!-- fine sezione film -->
    <script type="text/javascript">
        	function ricercaTitolo(){
        		var titoloRicerca = document.getElementById("ricercaTitolo").value;
        		var titoli=new Array($('.proiezione').attr('id'));
        		//if(){
        			console.log("Sono entrato");
        			console.log(titoli);
        		//}
        	}
    </script>

    <!-- sezione prossimamente -->
    <section class="py-3 bg-grigio-scuro">
        <div class="container">

            <!-- titolo sezione -->
            <div class="row">
                <div class="col-10 col-sm-8 col-md-6 col-lg-4 mx-auto text-center">
                    <h1 class="text-capitalize"><strong class="scritta-dorata">Prossimamente</strong></h1>
                </div>
            </div>
            <!-- fine titolo sezione -->

            <!-- inizio film prossimamente -->
            <div id="carouselControls" class="carousel slide text-center justify-content-center mb-5 cpl-10"
                data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block c-image img-fluid"
                            src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png"
                            alt="First slide">
                    </div>
                    <%List<Film> allFilm=UtilitiesDbFilm.leggiFilmAll();
                  List<Film> toRemove = new ArrayList<Film>();
                  for (Proiezione p : proiezioni) {
                	  for(Film f:allFilm){
                		  if (f.getIdFilm()==p.getFilm().getIdFilm()) {
                              toRemove.add(f);
                          }
                	  }
                  }
                  allFilm.removeAll(toRemove);
                  for(Film f: allFilm){%>
                    <div class="carousel-item">
                        <img class="d-block img-fluid c-image" src="<%=f.getLocandina() %>" alt="Second slide">
                    </div>
                    <%} %>
                </div>
                <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- fine film prossimamente -->
        </div>
    </section>
    <!-- fine sezione film prossimamente -->

     <!-- Footer: -->
    <jsp:include page= "footer.jsp"></jsp:include>

    <!--Bootstrap links-->

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>