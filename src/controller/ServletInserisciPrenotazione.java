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
	Proiezione proiezione;
	
	public ServletInserisciPrenotazione() {
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int iDproiezione = Integer.parseInt(request.getParameter("id_proiezione"));
		int iDutente = Integer.parseInt(request.getParameter("id_utente"));
		int postiPrenotati = Integer.parseInt(request.getParameter("posti_prenotati"));
		Prenotazione pr = new Prenotazione();
	}	
}

