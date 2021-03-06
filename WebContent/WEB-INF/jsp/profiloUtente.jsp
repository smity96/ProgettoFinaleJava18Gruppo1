<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <%HttpSession s=request.getSession(false);
    	Utente u=(Utente)s.getAttribute("uLog");
    	if(request.getAttribute("uLogSt")!=null){
        	u=(Utente)request.getAttribute("uLogSt");
        }
    	if(u.getRuolo()==2){%>
    		<meta http-equiv="refresh" content="0;URL=http://localhost:8080/ProgettoFinaleJava18Gruppo1/IndieGestioneProfiloStaff">
    	<%}else if(u.getRuolo()==3){%>
    		<meta http-equiv="refresh" content="0;URL=http://localhost:8080/ProgettoFinaleJava18Gruppo1/IndieGestioneProfiloAdmin">
    	<%}%>
    
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 
   

    <style>
            .bottone{
                width: 11.8rem !important    
            }

            #imageUpload
{
    display: none;
}

#profileImage
{
    cursor: pointer;
}

#profile-container {
    width: 150px;
    height: 150px;
    overflow: hidden;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    -o-border-radius: 50%;
    border-radius: 50%;

}

#profile-container img {
    width: 150px;
    height: 150px;
}

.stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
    </style>
    
     <!-- Google fonts link -->
     <link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
   
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="http://localhost:8080/ProgettoFinaleJava18Gruppo1/css/style-dash.css">
    
</head>

<body style="font-family: 'Monserrat', sans-serif">

    <body>
    
    
        <!-- navbar -->

        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="navbar-brand text-uppercase" href="/ProgettoFinaleJava18Gruppo1/IndieProfiloUtente">
                    <h1 class="stile">Pannello di controllo</h1>
                </a>

                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler btn-warning" type="button" data-toggle="collapse" data-target="#myNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar links -->

                <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                    <ul class="navbar-nav links d-lg-none">
                        <li class="nav-item">                            
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex"><i class="fas fa-home text-muted mr-3 nav-size"></i>Torna Al Sito</a>
                        </li>
                        <li class="nav-item">       
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/IndieProfiloUtente"><i class="fas fa-user text-muted mr-3 nav-size"></i>Gestione Profilo</a>
                        </li>
                        <li class="nav-item">                            
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazione"><i class="fas fa-film text-muted mr-3 nav-size"></i>Prenota film</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazioneUtente"><i class="fas fa-video text-muted mr-3 nav-size"></i>Gestione Prenotazioni</a>
                        </li>
                    </ul>

                    <!-- nav icons -->
                    <ul class="navbar-nav icons align-items-center">
                        <li class="nav-item mr-5">
                            <a class="navbar-brand py-3" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">
                                <img src="<%=u.getImmagine() %>" class="img-fluid rounded-circle img-thumbnail mr-3"
                                    alt="Logo" style="width:40px;" >
                                <%="CIAO: "+u.getNome().toUpperCase()%>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link stile" data-toggle="modal" data-target="#sign-out" href="<%=request.getContextPath() %>/ServletLogout">
                                <i class="fa fa-sign-out-alt mr-2"></i> Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end of nav -->

        <!-- main content -->

        <div class="container-fluid p-0 bg-dark">
            <div class="row">
                <nav
                    class="col-lg-3 col-xl-2 d-none d-lg-flex sidebar align-items-center justify-content-center right-padding max-viewport">
                    <ul class="navbar-nav flex-column list-side-height">
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-home text-muted mr-3 nav-size ml-4"></i></div>

                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex">Torna alla Home</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/IndieProfiloUtente">Gestione Profilo</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazione">Prenota film</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-video text-muted mr-3 nav-size ml-4"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active stile" href="/ProgettoFinaleJava18Gruppo1/ServletLeggiPrenotazioneUtente">Gestione Prenotazioni</a></div>
                        
                        </li>
                        </ul>
                </nav>
                <!-- fine side bar -->
                <div class="col-lg-9 col-xl-10 py-5 bg-dark">
                    <!-- titolo dashboard -->
                    <div class="row">
                        <div class="col-12">
                            <div>
                            <h3>
                                <span class="text-uppercase text-danger stile">Pannello /</span><span
                                    class="text-muted small stile"> Gestione Utente</span>
                            </h3>
                        </div>
                    
                    <!-- fine titolo dashboard -->
                    <!-- inizio funzioni pannello -->
                    <div class="row text-center text-uppercase bg-warning">
                        <div class="col-12 m-0 p-0 text-center">
                            <h1 class="text-dark stile">Profilo Utente</h1>
                        </div>                   
                        

                        <!--FORM UTENTE MODIFICA DATI PROFILO-->

                        <div class="bg-dark col-12 text-left">
                             <form action="<%=request.getContextPath() %>/ServletModificaUtente" method="post" class="bg-dark" enctype="multipart/form-data">
                             <input type="hidden" name="d" value="<%=u.getIdUtente()%>">  
                             <input type="hidden" name="red" value="1">    
                             
                             <!--AVATAR UTENTE-->
                              
                             <div id="profile-container" class="mt-3 ml-3">
                                <img id="profileImage" class="img-thumbnail" src="<%=u.getImmagine() %>" >
                             
                             <input id="imageUpload" type="file" 
                                    name="img" placeholder="Photo" >
                        </div>
                        
                        <!--modifica nome-->
                                    <div class="form-gorup row mt-4">
                            <label class="col-sm-2 col-form-label text-warning stile">Nome: </label>
                            <div class="col-sm-10">
                        <input class="rounded stile" name="nome" type="text" value="<%=u.getNome()%>">
                    </div>
                 </div>
                 
                     
                 <!--modifica cognome: -->

                        <div class="form-gorup row">
                            <label class="col-sm-2 col-form-label text-warning stile">Cognome: </label>
                            <div class="col-sm-10">
                        <input class="rounded stile" name="cognome" type="text" value="<%=u.getCognome()%>">
                    </div>
                 </div>

      <%SimpleDateFormat sDf=new SimpleDateFormat("yyyy-MM-dd");
String dN=sDf.format(u.getDataDiNascita());
%>          
                <!--modifica data di nascita:-->
                 <div class="form-gorup row">
                        <label class="col-sm-2 col-form-label text-warning stile">Data di Nascita: </label>
                        <div class="col-sm-10">
                    <input  class="rounded bottone" name="data_di_nascita" type="date" value="<%=dN%>" disabled>
                </div>
                </div>

                <!--modifica email NON abilitato-->
                <div class="form-gorup row">
                    <label class="col-sm-2 col-form-label text-warning stile">Email: </label>
                    <div class="col-sm-10">
                <input class="rounded stile" name="email" type="email" value="<%=u.getEmail() %>" disabled>
            </div>
            </div>

            <!--modifica password-->
            <div class="form-gorup row">
                <label class="col-sm-2 col-form-label text-warning stile">Password: </label>
                <div class="col-sm-10">
            <input  class="rounded stile" name="password" type="password" placeholder="password">
        </div>
        </div>

        <!--modifica partita iva-->
        <div class="form-gorup row">
            <label class="col-sm-2 col-form-label text-warning stile">Partita Iva: </label>
            <div class="col-sm-10">
        <input class="rounded stile" name="pIva" type="text" value="<%=u.getPIva()%>">
    </div>
    </div>
               
    <!--modifica indirizzo-->
    <div class="form-gorup row">
        <label class="col-sm-2 col-form-label text-warning stile">Indirizzo: </label>
        <div class="col-sm-10">
    <input class="rounded stile" name="indirizzo" type="text" value="<%=u.getIndirizzo()%>">
</div>
</div>
 
<!--modifica nome societ�-->
<div class="form-gorup row">
    <label class="col-sm-2 col-form-label text-warning stile">Nome societa': </label>
    <div class="col-sm-10">
<input class="rounded stile" name="societa" type="text" value="<%=u.getNomeSocieta()%>">
</div>
</div>            

<!-- bottone: -->

<br>
<div class="text-center col-6">
<button type="submit" class=" btn btn-outline-warning text-light stile">Modifica dati</button>
</div>



</form>
<br>
<br>

<div class="text-center col-6">
			
                            <a class="btn btn-outline-danger text-light" data-toggle="modal" data-target="#cancellaAccount" href="">
                              Cancella Account
                            </a>
                            </div>
                        

              </div>
                          </div>
                </div>

            </div>
        </div>
</div>
</div>

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
        
          <!-- Modal -->
        <div class="modal fade text-warning" id="cancellaAccount">
            <div class="modal-dialog bg-dark text-warning">
                <div class="modal-content bg-dark text-warning">
                    <!-- Modal Header -->
                    <div class="modal-header bg-dark text-warning">
                        <h4 class="modal-title stile text-warning">Vuoi cancellare il tuo account?</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body stile bg-dark text-warning">
                        Premi cancella per confermare.
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer stile">
                        <button type="button" class="btn btn-outline-warning text-light" data-dismiss="modal">
                            Torna Indietro
                        </button>
                        <button onclick="location.href='http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletCancellaUtente?canc=<%=u.getIdUtente() %>';" type="button" class="btn btn-outline-danger text-light" data-dismiss="modal">
                        Cancella Account
                    </button>
                    </div>
                </div>
            </div>
        </div>
        
        <br>
        <br>
        <br><br>
        
         <!-- Footer: -->
    <jsp:include page= "footer.jsp"></jsp:include>
        

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>

        <script src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/js/script.js"></script>
        

        <script src="http://localhost:8080/ProgettoFinaleJava18Gruppo1/js/profiloUtente.js"></script>
    </body>

</html>