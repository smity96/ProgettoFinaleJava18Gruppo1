package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import utilities.UtilitiesDbFilm;
//lorem ipsum
@WebServlet("/ServletLeggiFilmToModifica")
public class ServletLeggiFilmToModifica extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletLeggiFilmToModifica() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.getContextPath()
		int id=Integer.parseInt(request.getParameter("id_FilmMod"));
		System.out.println(id);
		Film f=UtilitiesDbFilm.leggiFilm(id);
		request.setAttribute("Film", f);
		request.getRequestDispatcher("html/modifica-film.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
