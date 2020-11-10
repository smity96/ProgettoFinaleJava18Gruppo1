package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Prenotazione;
import utilities.UtilitiesDbPrenotazione;

@WebServlet("/ServletInserisciPrenotazione")
public class ServletInserisciPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ServletInserisciPrenotazione() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono nel doGet");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono nel doPost");
		int proiezione = Integer.parseInt(request.getParameter("proiezione"));
		int utente = Integer.parseInt(request.getParameter("utente"));
		if(request.getParameter("proiezione") != null && request.getParameter("utente") != null) {
			//settami la proiezione e l'utente con i parametri mandati
			Prenotazione pr = new Prenotazione();
			pr.setProiezione(proiezione);
			pr.setUtente(utente);
			
			//inserisci la prenotazione
			UtilitiesDbPrenotazione.inserisciPrenotazione(pr);
		}
	}
}

