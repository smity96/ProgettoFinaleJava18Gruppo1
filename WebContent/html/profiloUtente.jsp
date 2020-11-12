<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

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

    </style>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="..\css\fontawesome-free-5.15.0-web\css\all.min.css">
    <link rel="stylesheet" href="..\css\style-dash.css">
</head>

<body>

    <body>
        <!-- navbar -->

        <nav class="navbar navbar-expand-md">
            <div class="container-fluid">
                <!-- Brand -->
                <a class="navbar-brand text-uppercase" href="#">
                    <h1>Dashboard Utente</h1>
                </a>

                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler btn-primary" type="button" data-toggle="collapse" data-target="#myNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar links -->

                <div class="collapse navbar-collapse justify-content-end" id="myNavbar">
                    <ul class="navbar-nav links d-md-none">
                        <li class="nav-item d-flex align-items-center my-3">
                        
                        <!-- MANCA HOME -->
                            <div class="col-3"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">Torna Al Sito</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">Gestione Profilo</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/prenotaUtente.jsp">Gestione Prenotazione</a></div>
                        </li>
                    </ul>

                    <!-- nav icons -->
                    <ul class="navbar-nav icons align-items-center">
                        <li class="nav-item mr-5">
                            <a class="navbar-brand py-3" href="#">
                                <img src="../src/logocinema.png" class="img-fluid rounded-circle img-thumbnail mr-3"
                                    alt="Logo" style="width:40px;" />
                                Nome Utente
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="modal" data-target="#sign-out" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">
                                <i class="fa fa-sign-out"></i> Sign Out
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
                    class="col-md-4 col-lg-3 col-xl-2 d-none d-md-flex sidebar align-items-center justify-content-center right-padding max-viewport">
                    <ul class="navbar-nav flex-column">
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-folder-open text-muted mr-3 nav-size"></i></div>

                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/index.jsp">Torna alla Home</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-user text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp">Gestione Profilo</a></div>
                        </li>
                        <li class="nav-item d-flex align-items-center my-3">
                            <div class="col-3"><i class="fas fa-film text-muted mr-3 nav-size"></i></div>
                            <div class="col-9 ml-3"><a class="nav-link active" href="/ProgettoFinaleJava18Gruppo1/html/prenotaUtente.jsp">Gestione Prenotazioni</a></div>
                        </li>
                </nav>
                <!-- fine side bar -->
                <div class="col-md-9 col-lg-10 py-5 bg-dark">
                    <!-- titolo dashboard -->
                    <div class="row">
                        <div class="col">
                            <h3>
                                <span class="text-uppercase text-danger">Dashboard /</span><span
                                    class="text-muted small"> Gestione Utente</span>
                            </h3>
                        </div>
                    </div>
                    <!-- fine titolo dashboard -->
                    <!-- inizio funzioni pannello -->
                    <div class="row text-center text-uppercase bg-warning">
                        <div class="col-12 m-0 p-0 text-center">
                            <h1 class="text-dark">Profilo Utente</h1>
                        </div>                   
                        

                        <!--FORM UTENTE MODIFICA DATI PROFILO-->
                        <div class="container col-12 bg-dark text-left">

                        
                             <form action="#" method="#" class="bg-dark">
                                               
                             
                             <!--AVATAR UTENTE--> 
                             <div id="profile-container" class="mt-3 ml-3">
                                <image id="profileImage" class="img-thumbnail" src="/ProgettoFinaleJava18Gruppo1/src/logocinema.png" >
                             
                             <input id="imageUpload" type="file" 
                                    name="profile_photo" placeholder="Photo" required="" capture>
                        </div>
                        
                        <!--modifica nome-->
                                    <div class="form-gorup row mt-4">
                            <label class="col-sm-2 col-form-label text-warning">Nome: </label>
                            <div class="col-sm-10">
                        <input class="rounded" name="nome" type="text" value="Luigi">
                    </div>
                 </div>
                 
                     
                 <!--modifica cognome: -->

                        <div class="form-gorup row">
                            <label class="col-sm-2 col-form-label text-warning">Cognome: </label>
                            <div class="col-sm-10">
                        <input class="rounded" name="cognome" type="text" value="Rossi">
                    </div>
                 </div>

                
                <!--modifica data di nascita:-->
                 <div class="form-gorup row">
                        <label class="col-sm-2 col-form-label text-warning">Data di Nascita: </label>
                        <div class="col-sm-10">
                    <input  class="rounded bottone" name="dataNascita" type="date" value="10/07/1995">
                </div>
                </div>

                <!--modifica email NON abilitato-->
                <div class="form-gorup row">
                    <label class="col-sm-2 col-form-label text-warning">Email: </label>
                    <div class="col-sm-10">
                <input class="rounded" name="email" type="email" placeholder="ciao@gmail.com" disabled>
            </div>
            </div>

            <!--modifica password-->
            <div class="form-gorup row">
                <label class="col-sm-2 col-form-label text-warning">Password: </label>
                <div class="col-sm-10">
            <input  class="rounded" name="password" type="password" value="password">
        </div>
        </div>

        <!--modifica partita iva-->
        <div class="form-gorup row">
            <label class="col-sm-2 col-form-label text-warning">Partita Iva: </label>
            <div class="col-sm-10">
        <input class="rounded" name="partita_iva" type="text" value="Partita iva">
    </div>
    </div>
               
    <!--modifica indirizzo-->
    <div class="form-gorup row">
        <label class="col-sm-2 col-form-label text-warning">Indirizzo: </label>
        <div class="col-sm-10">
    <input class="rounded" name="indirizzo" type="text" value="Indirizzo">
</div>
</div>
 
<!--modifica nome società-->
<div class="form-gorup row">
    <label class="col-sm-2 col-form-label text-warning">Nome società: </label>
    <div class="col-sm-10">
<input class="rounded" name="societa" type="text" value="Societa'">
</div>
</div>            

<!-- bottone: -->

<br>
<div class="text-center col-6">
<button type="submit" onclick="goBack()" class=" btn btn-outline-warning text-light">Modifica dati</button>
</div>



</form>

                          </div>
                </div>

            </div>
        </div>



        <!-- Modal -->
        <div class="modal fade bg-dark" id="sign-out">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Vuoi fare il logout?</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Premi logout per uscire.
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">
                            Rimani
                        </button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">
                            Esci
                        </button>
                    </div>
                </div>
            </div>
        </div>

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

        <script src="../js/script.js"></script>
        

        <script src="../js/profiloUtente.js"></script>
    </body>

</html>