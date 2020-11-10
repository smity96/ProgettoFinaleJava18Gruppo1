<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>cancella</h1>
	<form action="ServletCancellaFilm" method="post">
		<input type="text" name="id_film" placeholder="id">
		<input type="submit" name="conferma"> 
	</form>
	<br>
	<h1>inserisci</h1>
	<form action="ServletInserisciFilm" method="post" enctype="multipart/form-data">
		<input type="text" name="titolo" placeholder="titolo">
		<input type="text" name="genere" placeholder="genere">
		<input type="text" name="annoDiUscita" placeholder="anno">
		<input type="text" name="durata" placeholder="durata">
		<input type="text" name="urlTrailer" placeholder="url">
		<input type="text" name="trama" placeholder="trama">
		<input type="file" name="file" placeholder="locandina">
		<input type="submit" name="conferma" placeholder="conferma"> 
	</form>
	<br>
	<h1>modifica</h1>
	<form action="ServletModificaFilm" method="post" enctype="multipart/form-data">
		<input type="text" name="id_filmMod" placeholder="id">
		<input type="text" name="titolo" placeholder="titolo">
		<input type="text" name="genere" placeholder="genere">
		<input type="text" name="annoDiUscita" placeholder="anno">
		<input type="text" name="durata" placeholder="durata">
		<input type="text" name="urlTrailer" placeholder="url">
		<input type="text" name="trama" placeholder="trama">
		<input type="file" name="file" placeholder="locandina">
		<input type="submit" name="conferma" placeholder="conferma"> 
	</form>
	<h1>test mail</h1>
	<form action="InvioEmail" method="post">
		<input type="submit" name="invia">
	</form>
</body>
</html>