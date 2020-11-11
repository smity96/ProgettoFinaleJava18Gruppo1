package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Proiezione;
import utilities.UtilitiesDbFilm;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletInserisciProiezione")
public class ServletInserisciProiezione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	List<Proiezione> proiezioni;
	
	//costruttore cancellalo
	
    @Override
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	proiezioni=UtilitiesDbProiezione.leggiProiezioni();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Lorenzo è bello
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono nel doPost");
		Proiezione pDaAggiungere = new Proiezione();
		String dataEora2  = request.getParameter("dataOra");
		SimpleDateFormat formatter6 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		try {
			Date dataEora = formatter6.parse(dataEora2);
			pDaAggiungere.setDataOra(dataEora);
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		pDaAggiungere.setFilm(UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("id"))));
		pDaAggiungere.setIntervallo(Integer.parseInt(request.getParameter("intervallo")));
		pDaAggiungere.setPostiMax(Integer.parseInt(request.getParameter("posti")));
		if(UtilitiesDbProiezione.slotOccupato(proiezioni, pDaAggiungere) || !UtilitiesDbProiezione.slotRegolare(pDaAggiungere)) {
			// TODO chiedere come inserire una risposta d'errore
			//provasendredirect
			//TODO controllo? jsp amministratore/staff
			System.out.println("if");
			response.sendRedirect("ServletLeggiProiezioni"); 
		}else {
			System.out.println("else");
			UtilitiesDbProiezione.aggiungiProiezione(pDaAggiungere);
			response.sendRedirect("ServletLeggiProiezioni"); 
		}
		//doGet(request, response);
	}

}
