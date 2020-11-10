package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Prenotazione;
import model.Proiezione;
import utilities.UtilitiesDbPrenotazione;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletInserisciPrenotazione")
public class ServletInserisciPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Proiezione proiez;
	public ServletInserisciPrenotazione() {
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proiezione = Integer.parseInt(request.getParameter("proiezione"));
		int utente = Integer.parseInt(request.getParameter("utente"));
		int postiPrenotati = Integer.parseInt(request.getParameter("posti_prenotati"));
		if(request.getParameter("proiezione") != null && request.getParameter("utente") != null) {
			//settami la proiezione e l'utente con i parametri mandati
			Prenotazione pr = new Prenotazione();
			pr.setProiezione(proiezione);
			pr.setUtente(utente);
			
			//se il numeroPosti è inferiore al numero postiPrenotati 
			if(proiez.getPostiMax()<postiPrenotati) {
				//mi stampi il messaggio
				System.out.println("posti disponibili : " + proiez.getPostiMax());
			}else {//altrimenti
				//settami i posti prenotati
				pr.setPosti_prenotati(postiPrenotati);
				//postiMax = postiMax-postiPrenotati
				proiez.setPostiMax(proiez.getPostiMax() - postiPrenotati);
			}
			System.out.println(proiez.getPostiMax());
			
			
			//inserisci la prenotazione
			UtilitiesDbPrenotazione.inserisciPrenotazione(pr);
		}
		
		
	}
}

