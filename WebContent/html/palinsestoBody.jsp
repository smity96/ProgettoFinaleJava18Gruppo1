<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Film"%>
<%@page import="model.Proiezione"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <!--Titolo e logo barra ricerca-->
    <title>Sorrento Cinema</title>
    <link rel = "icon" href ="/ProgettoFinaleJava18Gruppo1/src/logocinema.png" type = "image/x-icon"> 

        <style>
     
      
      .riempi{
        overflow : hidden;
        background-size: contain;
        background-position: center;
        background-repeat: no-repeat;
        max-width: 28rem;
        max-height: 28rem;
      }

      .bottone{
        width: 8em;  height: 2em;
      }

      .trailer{
        max-width: 20rem;
        max-height: 15rem;
      }
      
      .stile{
        
        font-family: 'Montserrat', sans-serif;
        
        }
    </style>
    
     

    <link rel="stylesheet" href="/ProgettoFinaleJava18Gruppo1/css/style-dash.css">
    <!-- Google fonts link -->
     <link rel="preconnect" href="https://fonts.gstatic.com">
     <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
   
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body class="bg-dark" style="font-family: 'Monserrat', sans-serif">
<jsp:include page= "navbarNotte.jsp"></jsp:include>
  <br>
  <br>

  <div class="container bg-dark">
      <!--Palinsesto titolo fisso-->
      <div>
        <h2 class="text-warning text-center font-weight-bold stile">Palinsesto</h2>
      </div>
	<%
	List<Proiezione> proiezioni = (List<Proiezione>)request.getAttribute("Proiezioni");
	ArrayList <Film> arrayFilm = new ArrayList<>();
	for(Proiezione p:proiezioni){
		ArrayList <Date> arrayDateOre=new ArrayList<>();
		if(arrayFilm.contains(p.getFilm())){
			continue;
		}else{
			arrayFilm.add(p.getFilm());
			for(Proiezione p2:proiezioni){
				if(p.getFilm().equals(p2.getFilm())){
					arrayDateOre.add(p2.getDataOra());
				}
			}	
		}
		ArrayList<String> stringDateOre=new ArrayList<>();
		for(Date d:arrayDateOre){
	        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
	        String strDate = dateFormat.format(d);  
	        stringDateOre.add(strDate);
		}
		Collections.sort(stringDateOre);
		
		String formattedString = stringDateOre.toString().replace("[", "").replace("]", "");
		
		int Durata=p.getIntervallo()+p.getFilm().getDurata();
		int DurataH=Durata/60;
		int DurataM=Durata-(DurataH*60);
	    
	%>
      <!--Immagine della locandina film e informazioni relative al film che cambiano di film in film :-->
      <div class="row text-warning ">
          
        <div class="col-lg-4 col-md-4 col-sm-4 riempi" style="background-image: url('<%=p.getFilm().getLocandina()%>');">
        </div>
        

      <div class="container-fluid col-xl-8 col-md-9">
        <div class="col-12 d-flex">
        <p class="text-light text-left mt-4 font-weight-bold mr-2 stile">Titolo - 
          <p class="text-light text-left mt-4 stile"><%= p.getFilm().getTitolo() %></p>
        </p>
      </div>


      
      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2 stile">Genere -  
          <p class="text-light text-left stile"><%= p.getFilm().getGenere() %></p>
        </p>
      </div>


      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2 stile">Anno di uscita - </p>
        <p class="text-light text-left stile"><%= p.getFilm().getAnnoDiUscita() %></p>
      </div>

      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2 stile">Durata - </p>
        <p class="text-light text-left stile"><%if(DurataH!=0){%><%=DurataH%>h<%}%><%=DurataM%>'</p>
      </div>

      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mt-1 mr-2 stile">Trailer:</p> 

 
          <!--Trailer film MODIFICATO-->
          
     <a class="btn btn-warning btn-outline-warning bottone p-0 text-light text-decoration-none mt-1 stile" href="<%=p.getFilm().getUrlTrailer() %>" target="_blank">Vai al Trailer</a>
                  
      </div>
      
      
      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2 stile">Data e ora: </p>
       	<p class="text-light text-left stile"><%= formattedString %></p> 
       </div>    
       
       <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-1 stile">Trama: </p>
        <p class="text-light stile"><%=p.getFilm().getTrama() %></p>
      </div>

      </div>

      </div>
 <hr>
 <%} %>

 
    <!--SECONDO ESEMPIO, SENZA MODAL, SOLO TRAILER IN PICCOLO-->


      <!--Immagine della locandina film e informazioni relative al film che cambiano di film in film :-->
      <!-- <div class="row text-warning ">
        <div class="col-xl-4 col-md-3">
          <img class="image mt-2" src="../src/captainMarvel.jpg">
      </div>

      <div class="container-fluid col-xl-8 col-md-9">
        <div class="col-12 d-flex">
        <p class="text-light text-left mt-4 font-weight-bold mr-2">Titolo -
          <p class="text-light text-left mt-4">Captain America</p>
        </p>
      </div>


      
      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2">Genere: 
          <p class="text-light text-left">Avventura</p>
        </p>
      </div>


      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2">Anno di uscita:</p>
        <p class="text-light text-left">2019</p>
      </div>

      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2">Durata:</p>
        <p class="text-light text-left">124'</p>
      </div>

      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mt-1 mr-2">Trailer:</p> 

    Trailer film
    <div class="trailer embed-responsive embed-responsive-16by9">
      <iframe class=" embed-responsive"  src="https://www.youtube.com/embed/jLMBLuGJTsA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> 
    </div>   
      </div>

      <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-2">Data e ora: </p>
        <p class="text-light text-left">Giovedi ore 16.00</p> 
       </div>    
       
       <div class="col-12 d-flex">
        <p class="text-light text-left font-weight-bold mr-1">Trama: </p>
        <p class="text-light">film bello. 
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid, facere quaerat quae amet natus culpa. 
          Id unde vel voluptatum accusamus libero, molestiae quasi architecto in excepturi accusantium maxime illum veniam?</p>
      </div>

        </div>

      </div>
 <hr> -->



  <!--CHIUSURA DIV CONTAINER-->
    
  </div>
    

    <!--Bootstrap links-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
  </body>
</html>