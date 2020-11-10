package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilities.UtilitiesDbPrenotazione;

@WebServlet("/ServletCancellaPrenotazione")

public class ServletCancellaPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ServletCancellaPrenotazione() {
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono nel doGet");
		int id = Integer.parseInt(request.getParameter("id_prenotazione"));
		
		//se l'id della prenotazione e' diverso da null
		if(request.getParameter("id_prenotazione") != null) {
			//trovato l'id_prenotazione, richiama il metodo rimuovi
			UtilitiesDbPrenotazione.rimuoviPrenotazione(id);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
