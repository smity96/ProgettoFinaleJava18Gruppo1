<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="bg-dark">
  <head>
    <meta charset="ISO-8859-1" />
    
     <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 

    

    <style>
      .bottone {
        width: 12.1rem;
      }

      .informazioni {
        width: 13rem;
      }
      
      .grandezza{
        width: 20rem;
        heigth: 20rem;
        }
      
            .stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
      
    </style>
     
     <!-- Google fonts link -->
     <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
   
    

    <!--Font awesome links-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
    />

    <!--Bootstrap links-->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
  </head>

  <body class="bg-dark text-center" style="font-family: 'Monserrat', sans-serif">
  <!-- Navbar -->
      
      <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="http://localhost:8080/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 

  
<jsp:include page= "navbarNotte.jsp"></jsp:include>
 <!--Form registrazione dell'utente: -->
    <form
      action="/ProgettoFinaleJava18Gruppo1/ServletInserisciUtente"
      method="post"
      enctype="multipart/form-data"
    >

    
      <img
        class="mb-4 mt-5"
        src="/ProgettoFinaleJava18Gruppo1/src/logocinema.png"
        alt="Logo"
        width="72"
        height="72"
      />
      <p class="h3 mb-3 text-warning stile">Registrati:</p>

       
    
    
      <!--Requisiti obbligatori: -->
      
      <p >
        <input
          class="rounded stile"
          id="Nome"
          name="nome"
          type="text"
          placeholder="Nome"
          required
        />
      </p>

      <p>
        <input
          class="rounded stile"
          id="Cognome"
          name="cognome"
          type="text"
          placeholder="Cognome"
          required
        />
      </p>

      <p>
       <input
          class="rounded bottone"
          id="dataDiNascita"
          name="data_di_nascita"
          type="date"
          required
        />
      </p>

      <p>
        <input
          class="rounded stile"
          id="Email"
          name="email"
          type="email"
          placeholder="Email"
          required
        />
      </p>     

      <p>
        <input
          class="rounded stile"
          id="Password"
          name="password"
          type="password"
          placeholder="Password"
          required
        />
      </p>
      
   
      
      <!--Informazioni extra, non obbligatorie:-->

      <div
        class="container d-flex justify-content-center text-center col-4 informazioni"
      >
        <nav class="navbar navbar-dark bg-dark border-0">
          <h5 class="text-warning justify-content-end stile">
            Informazioni aggiuntive:
          </h5>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarText"
            aria-controls="navbarText"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <svg
              width="1em"
              height="1em"
              viewBox="0 0 16 16"
              class="bi bi-film"
              fill="currentColor"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                fill-rule="evenodd"
                d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm4 0h8v6H4V1zm8 8H4v6h8V9zM1 1h2v2H1V1zm2 3H1v2h2V4zM1 7h2v2H1V7zm2 3H1v2h2v-2zm-2 3h2v2H1v-2zM15 1h-2v2h2V1zm-2 3h2v2h-2V4zm2 3h-2v2h2V7zm-2 3h2v2h-2v-2zm2 3h-2v2h2v-2z"
              />
            </svg>
          </button>
          <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
              
       <li class="nav-item">
        <p>
        <input
          class="rounded text-warning bottone stile"
          name="imgP"
          type="file"
          placeholder="Scegli immagine"
          value="Scegli immagine"
        />
      </p>
      </li>
       
       <li class="nav-item"> 
       <p>    
                  <input
                    class="rounded stile"
                    id="PartitaIva"
                    name="P.I."
                    type="text"
                    placeholder="Partita Iva"
                  />
                </p>
              </li>
              
              <li class="nav-item">
                <p>
                  <input
                    class="rounded stile"
                    name="indirizzo"
                    id="Indirizzo"
                    type="text"
                    placeholder="Indirizzo"
                  />
                </p>
              </li>
              
              <li class="nav-item">
                <p>
                  <input
                    class="rounded stile"
                    name="nomeSoc"
                    type="text"
                    placeholder="Nome Societa'"
                  />
                </p>
              </li>
            </ul>
          </div>
        </nav>
      </div>
      
    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
    <label class="form-check-label text-light stile" for="exampleCheck1" required>Accetta i nostri
    <a class="text-warning style-decoration-none stile" data-toggle="modal" data-target="#exampleModal">Termini e Condizioni. </a></label>
    
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog bg-dark modal-dialog-scrollable" role="document">
    <div class="modal-content bg-dark">
      <div class="modal-header bg-dark">
        <h5 class="modal-title text-warning stile" id="exampleModalLabel">Termini e Condizioni</h5>
        <button type="button" class="close bg-dark text-warning" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body bg-dark text-warning stile">
        I nostri termini e condizioni sono in conformita' con l'articolo 13 del Regolamento UE 2016/679, che dichiara:
        
        - Articolo 13 -

Informazioni da fornire qualora i dati personali siano raccolti presso l'interessato

1. In caso di raccolta presso l'interessato di dati che lo riguardano, il titolare del trattamento fornisce all'interessato, nel momento in cui i dati personali sono ottenuti, le seguenti informazioni:

a) l'identita' e i dati di contatto del titolare del trattamento e, ove applicabile, del suo rappresentante;

b) i dati di contatto del responsabile della protezione dei dati, ove applicabile;

c) le finalita' del trattamento cui sono destinati i dati personali nonche' la base giuridica del trattamento;

d) qualora il trattamento si basi sull'articolo 6, paragrafo 1, lettera f), i legittimi interessi perseguiti dal titolare del trattamento o da terzi;

e) gli eventuali destinatari o le eventuali categorie di destinatari dei dati personali;

f) ove applicabile, l'intenzione del titolare del trattamento di trasferire dati personali a un paese terzo o a un'organizzazione internazionale e l'esistenza o l'assenza di una decisione di adeguatezza della Commissione o, nel caso dei trasferimenti di cui all'articolo 46 o 47, o all'articolo 49, paragrafo 1, secondo comma, il riferimento alle garanzie appropriate o opportune e i mezzi per ottenere una copia di tali garanzie o il luogo dove sono state rese disponibili. (1)

2. In aggiunta alle informazioni di cui al paragrafo 1, nel momento in cui i dati personali sono ottenuti, il titolare del trattamento fornisce all'interessato le seguenti ulteriori informazioni necessarie per garantire un trattamento corretto e trasparente:

a) il periodo di conservazione dei dati personali oppure, se non e' possibile, i criteri utilizzati per determinare tale periodo;

b) l'esistenza del diritto dell'interessato di chiedere al titolare del trattamento l'accesso ai dati personali e la rettifica o la cancellazione degli stessi o la limitazione del trattamento dei dati personali che lo riguardano o di opporsi al loro trattamento, oltre al diritto alla portabilit� dei dati; (1)

c) qualora il trattamento sia basato sull'articolo 6, paragrafo 1, lettera a), oppure sull'articolo 9, paragrafo 2, lettera a), l'esistenza del diritto di revocare il consenso in qualsiasi momento senza pregiudicare la liceita' del trattamento basata sul consenso prestato prima della revoca;

d) il diritto di proporre reclamo a un'autorita' di controllo;

e) se la comunicazione di dati personali e' un obbligo legale o contrattuale oppure un requisito necessario per la conclusione di un contratto, e se l'interessato ha l'obbligo di fornire i dati personali nonche' le possibili conseguenze della mancata comunicazione di tali dati;

f) l'esistenza di un processo decisionale automatizzato, compresa la profilazione di cui all'articolo 22, paragrafi 1 e 4, e, almeno in tali casi, informazioni significative sulla logica utilizzata, nonche' l'importanza e le conseguenze previste di tale trattamento per l'interessato.

3. Qualora il titolare del trattamento intenda trattare ulteriormente i dati personali per una finalita' diversa da quella per cui essi sono stati raccolti, prima di tale ulteriore trattamento fornisce all'interessato informazioni in merito a tale diversa finalita' e ogni ulteriore informazione pertinente di cui al paragrafo 2.

4. I paragrafi 1, 2 e 3 non si applicano se e nella misura in cui l'interessato dispone gia' delle informazioni.

(1) Lettera cosi' corretta da Rettifica pubblicata nella G.U.U.E. 23 maggio 2018, n. 127 Serie L.
      </div>
      <div class="modal-footer bg-dark text-warning">
        <button type="button" class="btn btn-outline-warning text-light stile" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>
        
    
    <br>
   <br>
       
      <button
        onclick="prendiDataNascita()"
        class="btn text-light btn-outline-warning stile"
      >
        Registrati
      </button>
    </form>
      <br />
      <br />

      <!--Accedi qui se sei gi� registrato-->
      <p class="text-warning stile">Sei gia' registrato?</p>
      <a class="text-warning stile" href="/ProgettoFinaleJava18Gruppo1/html/login.jsp"
        >Accedi qui!</a
      >
    <br>
    <br>
    <br>

    <script src="../js/script.js"></script>
    <!--Bootstrap links-->
    <script
      src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
      integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
      integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
