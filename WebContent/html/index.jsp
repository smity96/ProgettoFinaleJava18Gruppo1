<%@page import="utilities.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
     <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
    
    
    <!--Bootstrap links-->
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/stylemain.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style3.css">
  
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
  <body>
  <jsp:include page= "navbarNotte.jsp"></jsp:include>

    <header>
       <div class="container-fluid banner">
        <div class="row d-flex justify-content-center">
            <div class="col-8 mx-auto mt-5 justify-content-center d-flex">
                <!--<img class="img-fluid img-banner mr-5 pr-5" src="../src/logocinema.png" alt="banner">-->
            </div>
        </div> 
        <div class="row justify-content-center">
            <div class="col-8 mx-auto justify-content-center d-flex">
                <div class="col-3 justify-content-end d-flex m-0 p-0"><img class="img-fluid img-banner p-0 m-0"
                        src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/s-logo.png" alt=""></div>
                <div class="col-5 d-flex my-0 align-items-end m-0 p-0"> <span
                        class="display-1 scritta-dorata">orrento</span>
                </div>
            </div>
        </div>
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-12 mx-auto mt-0 mb-5 px-3 justify-content-center d-flex">
                <h1 class="display-1 scritta-dorata">   Cinema   </h1>
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
                  <h1 class="text-capitalize scritta-dorata">ora in <strong
                          class="scritta-dorata">programmazione</strong></h1>
              </div>
          </div>
          <!-- fine sezione titolo -->

          <!-- inizio filtro -->

          <div class="row">
              <div class="col-12 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                  <div class="col-12 mx-auto d-flex justify-content-around sortBtn flex-wrap"><a
                          class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="all"><h5>tutti</h5></a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="animazione"><h5>animazione</h5></a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="azione"><h5>azione</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="azione"><h5>avventura</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="commedia"><h5>commedia</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="fantasy"><h5>fantasy</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="fantascienza"><h5>fantascienza</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="guerra"><h5>guerra</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="horror"><h5>horror</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="musical"><h5>musical</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="romantico"><h5>romantico</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="storico"><h5>storico</h5> </a></div>
                  <div
                      class="col-lg-2 col-md-3 col-sm-4 col-6 mx-auto d-flex justify-content-around sortBtn flex-wrap">
                      <a class="btn btn-black text-uppercase fliter-btn m-2 scritta-dorata scritta-click-scuro"
                          data-filter="thriller"><h5>thriller</h5> </a></div>

              </div>
          </div>
          <!-- fine filtro -->

          <!-- search box -->
          <div class="row">
              <div class="col-10 mx-auto col-md-6">
                  <form>
                      <div class="input-group my-4">
                          <div class="input-group-prepend">
                              <span class="input-group-text search-box bg-nero" id="search-icon">
                                  <i class="fas fa-search scritta-dorata"></i>
                              </span>
                          </div>
                          <input type="text" class="form-control bg-oro" placeholder="item..."
                              id="search-item">
                      </div>
                  </form>
              </div>
          </div>
          <!-- fine search box -->

          <!-- inizio lista film -->
          <div class="row">

              <!-- singolo film -->
              <%  List<Proiezione> proiezioni = (List<Proiezione>)request.getAttribute("proiezioni");
              ArrayList<Film> films = new ArrayList<>();
              for(Proiezione p : proiezioni){ 
              if(films.contains(p.getFilm())){
            	  continue;
              }else{
            	  films.add(p.getFilm());
            	  %>
              <div class="col-10 col-md-6 col-lg-4 mx-auto my-3 films animazione">
                  <div class="card single-film size-custom">
                      <div class="img-container size-custom">
                      <!-- il getlocandina stava qui -->
                      <%// TODO Sistemare questa parte  %>
                           <img src="<%= p.getFilm().getLocandina()%>"
                              class=" img-custom" alt="">
                          <span class="film-item-icon mx-0 px-0">
                              <div class="col-12 m-auto">
                                  <i class="fas fa-calendar-alt text-capitalize px-2"></i>
                                  <span class="pl-2">Clicca per andare alla programmazione</span>
                              </div>
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
                      <img class="d-block c-image img-fluid" src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" alt="First slide">
                  </div>
                  <%List<Film> allFilm=UtilitiesDbFilm.leggiFilmAll();
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

    <!--Bootstrap links-->
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
  </body>
</html>
    