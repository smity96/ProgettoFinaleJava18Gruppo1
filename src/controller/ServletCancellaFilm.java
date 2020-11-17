package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import utilities.UtilitiesDbFilm;

@WebServlet("/ServletCancellaFilm")
public class ServletCancellaFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletCancellaFilm() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			Film f2 = UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("id_film")));
			// elimino il film
			UtilitiesDbFilm.cancellaFilm(f2);
			List<Film> film=UtilitiesDbFilm.leggiFilmAll();
			film.sort((f1,f3)->f1.getTitolo().compareToIgnoreCase(f3.getTitolo()));
			request.setAttribute("tuttiFilm", film);
			request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-film.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
