package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prenotazione;
import utilities.UtilitiesDbPrenotazione;

@WebServlet("/ServletModificaPrenotazione")
public class ServletModificaPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ServletModificaPrenotazione() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//crea un oggetto con i campi mandati
		Prenotazione pr = new Prenotazione();
		//se l'id e' diverso da null entra nell'if
		if(request.getParameter("id") != null) {
			//scorri la lista e trova l'id della prenotazione 
			UtilitiesDbPrenotazione.leggiPrenotazioneById(Integer.parseInt(request.getParameter("id")));
			//setta i nuovi parametri 
			pr.setProiezione(Integer.parseInt(request.getParameter("proiezione")));
			pr.setUtente(Integer.parseInt(request.getParameter("utente")));
			//modifica con i campi passati sopra
			UtilitiesDbPrenotazione.modificaPrenotazione(pr);
		} else {//altrimenti
			//crea un oggetto nuovo 
			pr = new Prenotazione();
			pr.setProiezione(Integer.parseInt(request.getParameter("proiezione")));
			pr.setUtente(Integer.parseInt(request.getParameter("utente")));
			//inserisci alla lista
			UtilitiesDbPrenotazione.inserisciPrenotazione(pr);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
