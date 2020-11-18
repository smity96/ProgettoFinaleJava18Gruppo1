package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import utilities.UtilitiesDbFilm;

@WebServlet("/ServletLeggiFilmToModifica")
public class ServletLeggiFilmToModifica extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletLeggiFilmToModifica() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Film f=new Film();
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			if(request.getAttribute("id_FilmMod")!=null) {
				System.out.println("---> "+request.getAttribute("id_FilmMod"));
				int id=Integer.parseInt((String)request.getAttribute("id_FilmMod"));
				System.out.println(id);
				f=UtilitiesDbFilm.leggiFilm(id);
			}else if(request.getParameter("id_filmMod")!=null) {
				System.out.println("---> "+request.getAttribute("id_FilmMod"));
				int id=Integer.parseInt(request.getParameter("id_filmMod"));
				System.out.println(id);
				f=UtilitiesDbFilm.leggiFilm(id);
			}
			
			request.setAttribute("Film", f);
			request.getRequestDispatcher("/WEB-INF/jsp/modifica-film.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
