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
	List<Utente>listaU;
    public ServletModificaUtente() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String modifica=request.getParameter("modifica");
		if (modifica!=null) {
			utente=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("modifica")));
			UtilitiesDbUtente.modUtente(utente);
			listaU=UtilitiesDbUtente.listaUtenti();
			response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/dashboard-staff.jsp");
		
	}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

