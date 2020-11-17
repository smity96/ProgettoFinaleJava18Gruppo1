package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			boolean errore=false;
			Proiezione pDaAggiungere = new Proiezione();
			String dataEora2  = request.getParameter("dataOra");
			SimpleDateFormat formatter6 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm",Locale.ITALY);
			try {
				Date dataEora = formatter6.parse(dataEora2);
				pDaAggiungere.setDataOra(dataEora);
			} catch (ParseException e) {
				e.printStackTrace();
			}	
			pDaAggiungere.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
			pDaAggiungere.setFilm(UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("id"))));
			pDaAggiungere.setIntervallo(Integer.parseInt(request.getParameter("intervallo")));
			pDaAggiungere.setPostiMax(Integer.parseInt(request.getParameter("posti")));
			if(UtilitiesDbProiezione.slotOccupato(proiezioni, pDaAggiungere) || !UtilitiesDbProiezione.slotRegolare(pDaAggiungere)) {
				errore=true;
				request.setAttribute("errore", errore);
				request.getRequestDispatcher("ServletLeggiProiezioniAdmin").forward(request, response);; 
			}else {
				UtilitiesDbProiezione.aggiungiProiezione(pDaAggiungere);
				errore=false;
				request.setAttribute("errore", errore);
				request.getRequestDispatcher("ServletLeggiProiezioniAdmin").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
