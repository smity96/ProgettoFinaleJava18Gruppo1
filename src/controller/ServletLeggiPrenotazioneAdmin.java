package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prenotazione;
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
		
		request.setAttribute("listaPreno", listaPreno);
		
		request.getRequestDispatcher("/html/dashboard-gestione-prenotazione.jsp").forward(request, response);
	}

}
