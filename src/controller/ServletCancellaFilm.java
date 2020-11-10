package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Film;
import utilities.UtilitiesDbFilm;

@WebServlet("/ServletCancellaFilm")
public class ServletCancellaFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletCancellaFilm() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Film f2=UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("id_film")));
		//mi prendo la sessione del'admin
		HttpSession session = request.getSession();

		if (session.getAttribute("admin") == null) {
			System.out.println("if della sessione");
			if(f2 instanceof Film) {
				System.out.println("if dell'instance of");
				//elimino il film
				UtilitiesDbFilm.cancellaFilm(f2);
			}
		}
		response.sendRedirect("provaFilm.jsp");
	}
}

