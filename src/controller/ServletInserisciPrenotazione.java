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
	Utente utente;
	Proiezione proiezione;
	public ServletInserisciPrenotazione() {
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		utente = UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("id_utente")));
		proiezione = UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("id_proiezione")));
		int postiPrenotati = Integer.parseInt(request.getParameter("posti_prenotati"));
		double costoTotale= postiPrenotati*proiezione.getPrezzo();
		Prenotazione pr = new Prenotazione();
		
		pr.setUtente(utente);
		pr.setProiezione(proiezione);
		pr.setPostiPrenotati(postiPrenotati);
		pr.setCosto_totale(costoTotale);
		
		UtilitiesDbPrenotazione.inserisciPrenotazione(pr);
		
		
	}	
}

