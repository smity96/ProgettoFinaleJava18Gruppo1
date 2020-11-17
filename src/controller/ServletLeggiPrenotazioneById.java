package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prenotazione;
import utilities.UtilitiesDbPrenotazione;

@WebServlet("/ServletLeggiPrenotazioneById")

public class ServletLeggiPrenotazioneById extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServletLeggiPrenotazioneById() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id_prenotazione = Integer.parseInt(request.getParameter("id_prenotazione"));
		Prenotazione prenotazione = UtilitiesDbPrenotazione.leggiPrenotazioneById(id_prenotazione);
		request.setAttribute("pDaModificare", prenotazione);

		request.getRequestDispatcher("ServletLeggiPrenotazioneUtente").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
