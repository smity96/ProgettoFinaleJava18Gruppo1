package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import utilities.InvioEmail;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletModificaRuolo")
public class ServletModificaRuolo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletModificaRuolo() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//---------CONFERMA REGISTRAZIONE UTENTE-----------------------
		String idU = request.getParameter("b");
		if (idU != null) {
			Integer nId = Integer.parseInt(idU);
			Utente u = UtilitiesDbUtente.leggiUtenteById(nId);
			u.setRuolo(1);
			UtilitiesDbUtente.modUtente(u);
			List<Utente> listaU = UtilitiesDbUtente.listaUtenti();
//--------INVIO MAIL CONFERMA REGISTRAZIONE -------------------			
			InvioEmail.inviaMail(u, 2, null);
			request.setAttribute("listaU", listaU);
			request.getRequestDispatcher("html/dashboard-gestione-utenti.jsp").forward(request, response);
		}
			
				
//--------CAMBIO RUOLO UTENTE->STAFF----------------------------
		String idS = request.getParameter("s");
		if (idS != null) {
			Integer nId = Integer.parseInt(idS);
			Utente u = UtilitiesDbUtente.leggiUtenteById(nId);
			u.setRuolo(2);
			UtilitiesDbUtente.modUtente(u);
			List<Utente> listaU = UtilitiesDbUtente.listaUtenti();
			request.setAttribute("listaU", listaU);
			request.getRequestDispatcher("html/dashboard-gestione-utenti.jsp").forward(request, response);
		}
				
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
