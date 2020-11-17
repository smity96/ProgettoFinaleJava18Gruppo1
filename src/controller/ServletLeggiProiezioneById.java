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

@WebServlet("/ServletLeggiProiezioneById")
public class ServletLeggiProiezioneById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Proiezione p= UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("idDaModificare")));
		List<Film> films=UtilitiesDbFilm.leggiFilmAll();
		request.setAttribute("proiezioneDaModificare", p);
		request.setAttribute("listaFilms", films);
		request.getRequestDispatcher("/html/modifica-proiezione.jsp").forward(request, response);
	}

}
