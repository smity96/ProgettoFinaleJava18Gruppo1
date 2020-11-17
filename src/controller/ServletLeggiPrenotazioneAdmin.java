package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			listaPreno = UtilitiesDbPrenotazione.leggiPrenotazione();
			List<Prenotazione> pren=new ArrayList<Prenotazione>();
			//allUtenti.stream().peek(u->System.out.println(u)).sorted((u1,u2)->u1.getEmail().compareToIgnoreCase(u2.getEmail())).forEach(u->pren.addAll(u.getPrenotazioni()));
			pren=listaPreno.stream().sorted((p1,p2)->p1.getUtente().getEmail().compareToIgnoreCase(p2.getUtente().getEmail())).peek(p->System.out.println(p)).collect(Collectors.toList());
			request.setAttribute("listaPreno", pren);
			request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-prenotazione.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		/*//lista di appoggio
		List<Utente>allUtenti=new ArrayList<Utente>();
		//lista di appoggioPrenotazioni
		List<Prenotazione>prenoApp=new ArrayList<Prenotazione>();
		//riempio la lista di appoggio Utente
		for(Prenotazione p:listaPreno) {
			if(!allUtenti.contains(p.getUtente()))
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
		}*/
		
	}
	
	class emailComparator implements Comparator<Utente> {
	    @Override
	    public int compare(Utente a, Utente b) {
	        return a.getEmail().compareToIgnoreCase(b.getEmail());
	    }
	}

}
