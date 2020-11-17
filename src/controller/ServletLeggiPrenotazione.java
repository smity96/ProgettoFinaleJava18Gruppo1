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

import controller.ServletLeggiProiezioniStaff.dateComparator;
import model.Prenotazione;
import model.Proiezione;
import model.Utente;
import utilities.InvioEmail;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		listaProiez = UtilitiesDbProiezione.leggiProiezioni();
		listaPreno = UtilitiesDbPrenotazione.leggiPrenotazione();
		List<Prenotazione> pren = new ArrayList<Prenotazione>();
		pren = listaPreno.stream()
				.sorted((p1, p2) -> p1.getUtente().getEmail().compareToIgnoreCase(p2.getUtente().getEmail()))
				.peek(p -> System.out.println(p)).collect(Collectors.toList());

		request.setAttribute("listaProiez", listaProiez);
		// metto qui la lista corretta
		request.setAttribute("listaPreno", pren);
		request.getRequestDispatcher("/WEB-INF/jsp/prenotaUtente.jsp").forward(request, response);

		// creo un array di appoggio per le proiezioni
		/*
		 * List<Proiezione> proiezioni=new ArrayList<Proiezione>(); //creo un array di
		 * appoggio per le prenotazioni List<Prenotazione> listaPrenoApp=new
		 * ArrayList<Prenotazione>(); //lo riempio for(Prenotazione p:listaPreno) {
		 * proiezioni.add(p.getProiezione()); } //lo ordino cronologicamente
		 * Collections.sort(proiezioni, new dateComparator()); //inizio a girare la
		 * lista delle proiezioni for(Proiezione p1:proiezioni) { //ci faccio girare le
		 * prenotazioni for(Prenotazione p:listaPreno) { //se trova un id corrispondente
		 * if(p1.getIdProiezione()==p.getProiezione().getIdProiezione()) { //aggiungo la
		 * prenotazione in ordine listaPrenoApp.add(p); } } } //per sicurezza ordino
		 * anche le proiezioni Collections.sort(listaProiez, new dateComparator());
		 */

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	class dateComparator implements Comparator<Proiezione> {
		@Override
		public int compare(Proiezione a, Proiezione b) {
			if (a.getDataOra() == null || b.getDataOra() == null) {
				return 0;
			}
			return a.getDataOra().compareTo(b.getDataOra());
		}
	}
}
