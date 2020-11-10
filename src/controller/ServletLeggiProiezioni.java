package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import model.Proiezione;
import utilities.UtilitiesDbFilm;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletLeggiProiezioni")
public class ServletLeggiProiezioni extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Proiezione> Proiezioni = UtilitiesDbProiezione.leggiProiezioni();
		List<Film> Films = UtilitiesDbFilm.leggiFilmAll();
		request.setAttribute("Proiezioni", Proiezioni);
		request.setAttribute("Films", Films);
		//TODO cambiare path 
		request.getRequestDispatcher("/ProvaPannelloAmministratore.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
