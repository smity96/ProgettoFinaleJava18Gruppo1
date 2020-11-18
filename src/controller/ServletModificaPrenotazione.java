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
		int id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		Prenotazione prenotazione = UtilitiesDbPrenotazione.leggiPrenotazioneById(id_prenotazione);
		
		int postiModificati = Integer.parseInt(request.getParameter("postiModificati"));
		prenotazione.setPostiPrenotati(postiModificati);
		prenotazione.setCosto_totale(prenotazione.getProiezione().getPrezzo() * postiModificati);
		
		UtilitiesDbPrenotazione.modificaPrenotazione(prenotazione);
		
		response.sendRedirect("ServletLeggiPrenotazioneUtente");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
