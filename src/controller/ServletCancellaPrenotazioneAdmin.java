package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilities.UtilitiesDbPrenotazione;


@WebServlet("/ServletCancellaPrenotazioneAdmin")
public class ServletCancellaPrenotazioneAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ServletCancellaPrenotazioneAdmin() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idPrenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		UtilitiesDbPrenotazione.rimuoviPrenotazione(idPrenotazione);
	
		response.sendRedirect("ServletLeggiPrenotazioneAdmin");
	}

}
