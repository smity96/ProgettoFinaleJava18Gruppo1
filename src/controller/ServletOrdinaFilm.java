package controller;

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
import utilities.UtilitiesDbFilm;
//lorem ipsum
@WebServlet("/ServletOrdinaFilm")
public class ServletOrdinaFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletOrdinaFilm() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Film> tuttiFilm=UtilitiesDbFilm.leggiFilmAll();
		Collections.sort(tuttiFilm, new titleComparator());
		request.setAttribute("tuttiFilm", tuttiFilm);
		request.getRequestDispatcher("html/dashboard-gestione-film.jsp").forward(request, response);
	}
	
	class titleComparator implements Comparator<Film> {
	    @Override
	    public int compare(Film a, Film b) {
	        return a.getTitolo().compareToIgnoreCase(b.getTitolo());
	    }
	}
}
