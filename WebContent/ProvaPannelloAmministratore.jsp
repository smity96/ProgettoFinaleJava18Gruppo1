<%@page import="model.Film"%>
<%@page import="model.Proiezione"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prova Pannello Amministratore</title>
</head>
<body>

	<table>
	  <tr>
	    <th>idProiezione</th>
	    <th>Data Ora Proiezione</th>
	    <th>Titolo Film</th>
	    <th>Intervallo</th>
	    <th>Max Posti</th>
	    <th></th>
	    <th></th>
	  </tr>
	  <%
	  List<Proiezione> proiezioni = (List<Proiezione>)request.getAttribute("Proiezioni");
	  List<Film> films = (List<Film>)request.getAttribute("Films");
	  for(Proiezione p : proiezioni){
	  %>
	  <tr>
	    <td><%= proiezioni.indexOf(p)+1 %></td>
	    <td><%= p.getDataOra() %></td>
	    <td><%= p.getFilm().getTitolo() %></td>
	    <td><%= p.getIntervallo() %></td>
	    <td><%= p.getPostiMax() %></td>
	    <td>
		    <form action="ServletEliminaProiezione" method="post">
		    <input type="hidden" name="idDaEliminare" value="<%= p.getIdProiezione()%>">
		    <input type="submit" value="Cancella">
		    </form>
	    </td>
	    <td>
		    <form action="ServletModificaProiezione" method="post">
		      <input type="hidden" name="idDaModificare" value="<%= p.getIdProiezione()%>">
		      <input name="dataOra" type="datetime-local" value="<%= p.getDataOra() %>">
			  <input name="intervallo" type="number" value="<%= p.getIntervallo()%>">
			  <input name="posti" type="number" value="<%=p.getPostiMax()%>">
			  <label for="films">Choose a film:</label>
			  <select id="film" name="idFilm">
			  <%for(Film f : films){ %>
			    <option value="<%= f.getIdFilm() %>"><%= f.getTitolo() %></option>
			   <%} %>
			  </select>
		      <input type="submit" value="Modifica">
		    </form>
	    </td>
	  </tr>
	  <%} %>
	</table>
	<br>
	<br>
	<br>
	<br>
	<form action="ServletInserisciProiezione" method="post">
		  <input name="dataOra" type="datetime-local">
		  <input name="intervallo" type="number">
		  <input name="posti" type="number">
		  <label for="films">Choose a film:</label>
		  <select id="film" name="id">
		  <%for(Film f : films){ %>
		    <option value="<%= f.getIdFilm() %>"><%= f.getTitolo() %></option>
		   <%} %>
		  </select>
		  <input type="submit">
	</form>
	
	<!--proveproveprove-->

</body>
</html>