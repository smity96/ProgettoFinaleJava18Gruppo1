package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import model.Prenotazione;
import model.Proiezione;
import utilities.UtilitiesDbFilm;
import utilities.UtilitiesDbPrenotazione;
import utilities.UtilitiesDbProiezione;
//lorem ipsum
@WebServlet("/ServletLeggiProiezioniPalinsesto")
public class ServletLeggiProiezioniPalinsesto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Proiezione> Proiezioni = UtilitiesDbProiezione.leggiProiezioni();
		List<Film> Films = UtilitiesDbFilm.leggiFilmAll();
		List<Prenotazione> Prenotazioni=UtilitiesDbPrenotazione.leggiPrenotazione();
		request.setAttribute("Proiezioni", Proiezioni);
		request.setAttribute("Films", Films);
		request.setAttribute("Prenotazioni", Prenotazioni);
		//TODO cambiare path 
		request.getRequestDispatcher("/html/palinsestoBody.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}