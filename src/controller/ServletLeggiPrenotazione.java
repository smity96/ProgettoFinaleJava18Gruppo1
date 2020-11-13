package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prenotazione;
import model.Proiezione;
import utilities.UtilitiesDbPrenotazione;
import utilities.UtilitiesDbProiezione;


@WebServlet("/ServletLeggiPrenotazione")
public class ServletLeggiPrenotazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Proiezione> listaProiez;
	List<Prenotazione> listaPreno;
    
	public ServletLeggiPrenotazione() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listaProiez = UtilitiesDbProiezione.leggiProiezioni();
		listaPreno = UtilitiesDbPrenotazione.leggiPrenotazione();
		
		request.setAttribute("listaProiez", listaProiez);
		request.setAttribute("listaPreno", listaPreno);
		
		request.getRequestDispatcher("/html/prenotaUtente.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
