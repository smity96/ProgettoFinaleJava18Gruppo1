<%@page import="utilities.*"%> <%@page import="model.*"%> <%@page
import="java.util.*"%> <%@ page language="java" contentType="text/html;
charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link
      rel="icon"
      href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png"
      type="image/x-icon"
    />

    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/stylemain.css"
    />
    <link
      rel="stylesheet"
      href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash-final.css"
    />
    <% HttpSession s=request.getSession(false);
    //session.getAttribute("utentelog") //String mail = (String)
    s.getAttribute("mailLog"); //String pssw = (String)
    session.getAttribute("psswLog"); Utente u = (Utente)s.getAttribute("uLog");
    //Utente u=UtilitiesDbUtente.leggiUtenteById(2); %>
   <jsp:include page="DashboardAdmin.jsp"></jsp:include>
        <!-- Inizio main destra -->

        <div class="col-xl-10 col-12 py-3 max-viewport">
          <!-- inizio funzioni main -->

          <!-- messaggio benvenuto -->

          <div
            class="row funzione-menu messaggio-benvenuto text-center align-items-center d-flex mt-5"
          >
            <div class="col-12 p-0 mb-3">
              <img
                src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png"
                class="img-fluid rounded-circle img-thumbnail foto-profilo-benvenuto mr-3"
                alt="foto profilo utente"
              />
            </div>

            <div class="col-12 p-0 mb-3">
              <h1 class="text-capitalize">
                <i class="fas fa-handshake mr-3"></i>
                Benvenuto al Pannello di Controllo di Sorrento Cinema
              </h1>
            </div>
            <div class="col-12 p-0 mb-3">
              <h2 class="text-capitalize">
                Qui potrai interagire con le funzioni di controllo dedicate
                all'Admin
              </h2>
            </div>
            <div class="col-12 p-0 mb-3">
              <h3 class="text-capitalize">
                Usa il menu a sinistra per spostarti tra le varie sezioni.
              </h3>
            </div>
            <div class="col-12 p-0 mb-3">
              <h4 class="text-capitalize">
                Se usi dispostivi con schermi piccoli, il menu verra'
                visualizzato in alto.
              </h4>
            </div>
          </div>
          <!-- fine messaggio benvenuto -->
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
            <button
              type="button"
              class="btn btn-outline-warning text-light"
              data-dismiss="modal"
            >
              Rimani
            </button>
            <button
              onclick="location.href='http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLogout';"
              type="button"
              class="btn btn-outline-danger text-light"
              data-dismiss="modal"
            >
              Logout
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Fine Modal Uscita -->

    <!-- Footer: -->
    <jsp:include page="footer.jsp"></jsp:include>

    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
      integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
      integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
