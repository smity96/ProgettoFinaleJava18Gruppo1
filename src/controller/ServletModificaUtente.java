package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import utilities.UtilitiesDbUtente;


@WebServlet("/ServletModificaUtente")
public class ServletModificaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Utente utente;
	List<Utente>listaUte;
    public ServletModificaUtente() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	listaUte=UtilitiesDbUtente.listaUtenti();
		if (utente.getRuolo()==3) {
			for(Utente u:listaUte) {
				if (u.getRuolo()==0) {
					System.out.println("utente da confermare");
					request.setAttribute("utenteDaConfermare","in attesa");
				} 
			}
		
	}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

