package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
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

@WebServlet("/ServletLeggiProiezioniAdmin")
public class ServletLeggiProiezioniAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			List<Proiezione> proiezioni = UtilitiesDbProiezione.leggiProiezioni();
			List<Film> films = UtilitiesDbFilm.leggiFilmAll();
			Collections.sort(proiezioni, new dateComparator());
			request.setAttribute("proiezioni", proiezioni);
			request.setAttribute("films", films);
			request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-proiezione.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	class dateComparator implements Comparator<Proiezione> {
	    @Override
	    public int compare(Proiezione a, Proiezione b) {
	    	if(a.getDataOra()==null||b.getDataOra()==null) {
	    		return 0;
	    	}
	        return a.getDataOra().compareTo(b.getDataOra());
	    }
	}
	
}