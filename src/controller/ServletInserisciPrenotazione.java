package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import utilities.*;

@WebServlet("/ServletInserisciPrenotazione")
public class ServletInserisciPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Proiezione proiez;
	private Utente u;
	public ServletInserisciPrenotazione() {
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int proiezione = Integer.parseInt(request.getParameter("proiezione"));
		int utente = Integer.parseInt(request.getParameter("utente"));
		int postiPrenotati = Integer.parseInt(request.getParameter("posti_prenotati"));
		proiez=UtilitiesDbProiezione.leggiProiezioneById(proiezione);
		u=UtilitiesDbUtente.leggiUtenteById(utente);
		/*System.out.println(proiez.getPostiMax());
		System.out.println(postiPrenotati);*/
		if(request.getParameter("proiezione") != null && request.getParameter("utente") != null) {
			//settami la proiezione e l'utente con i parametri mandati
			Prenotazione pr = new Prenotazione();
			pr.setProiezione(proiezione);
			pr.setUtente(utente);
			
			//se il numeroPosti e' inferiore al numero postiPrenotati 
			if(proiez.getPostiMax()<postiPrenotati) {
				//mi stampi il messaggio
				System.out.println("posti disponibili : " + proiez.getPostiMax());
			}else {//altrimenti
				//settami i posti prenotati
				pr.setPosti_prenotati(postiPrenotati);
				//postiMax = postiMax-postiPrenotati
				proiez.setPostiMax(proiez.getPostiMax() - postiPrenotati);
				UtilitiesDbProiezione.modificaProiezione(proiez);
				//inserisci la prenotazione
				UtilitiesDbPrenotazione.inserisciPrenotazione(pr);
			}
			//System.out.println(proiez.getPostiMax());
		}
	}
}

