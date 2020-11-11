package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prenotazione;
import model.Utente;
import utilities.UtilitiesDbPrenotazione;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletCancellaPrenotazione")

public class ServletCancellaPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ServletCancellaPrenotazione() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_utente = Integer.parseInt(request.getParameter("id_utente"));
		Utente u = UtilitiesDbUtente.leggiUtenteById(id_utente);
		int proiezione = Integer.parseInt(request.getParameter("proiezione"));
		
		//se l'id della prenotazione e' diverso da null
		
			Prenotazione p = UtilitiesDbPrenotazione.leggiPrenotazioneDaUtenteFilm(u, proiezione);
			//trovato l'id_prenotazione, richiama il metodo rimuovi
			UtilitiesDbPrenotazione.rimuoviPrenotazione(p.getIdPrenotazione());
			response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/dashboard-admin.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
