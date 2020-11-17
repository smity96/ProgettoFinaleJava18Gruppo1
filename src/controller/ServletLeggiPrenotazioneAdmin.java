package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import model.Prenotazione;
import model.Utente;
import utilities.UtilitiesDbPrenotazione;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletLeggiPrenotazioneAdmin")
public class ServletLeggiPrenotazioneAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Prenotazione> listaPreno;
	
    public ServletLeggiPrenotazioneAdmin() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listaPreno = UtilitiesDbPrenotazione.leggiPrenotazione();
		//lista di appoggio
		List<Utente>allUtenti=new ArrayList<Utente>();
		//lista di appoggioPrenotazioni
		List<Prenotazione>prenoApp=new ArrayList<Prenotazione>();
		//riempio la lista di appoggio Utente
		for(Prenotazione p:listaPreno) {
			allUtenti.add(p.getUtente());
		}
		//la ordino
		Collections.sort(allUtenti, new emailComparator());
		//per ogni utente ordinato
		for(int i=0;i<allUtenti.size();i++) {
			//per ogni prenotazione non ordinata
			for(int j=0;j<listaPreno.size();j++) {
				//se l'id e' uguale all'utente ordinato
				if(allUtenti.get(i).getIdUtente()==listaPreno.get(j).getUtente().getIdUtente()) {
					//lo aggiungo
					prenoApp.add(listaPreno.get(j));
				}
			}
		}
		request.setAttribute("listaPreno", prenoApp);
		request.getRequestDispatcher("/html/dashboard-gestione-prenotazione.jsp").forward(request, response);
	}
	
	class emailComparator implements Comparator<Utente> {
	    @Override
	    public int compare(Utente a, Utente b) {
	        return a.getEmail().compareToIgnoreCase(b.getEmail());
	    }
	}

}
