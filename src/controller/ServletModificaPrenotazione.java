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
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
