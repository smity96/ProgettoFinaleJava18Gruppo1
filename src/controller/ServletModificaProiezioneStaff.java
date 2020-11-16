package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Film;
import model.Proiezione;
import utilities.UtilitiesDbFilm;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletModificaProiezioneStaff")
public class ServletModificaProiezioneStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	List<Proiezione> proiezioni;
	
	//costruttore cancellalo
	
    @Override
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	proiezioni=UtilitiesDbProiezione.leggiProiezioni();
    }



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean errore=false;
		
		
		Proiezione pDaModificare=UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("idDaModificare")));
		String dataEora  = request.getParameter("dataOra");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm", Locale.ITALY);
		try {
			Date dataEora2 = formatter.parse(dataEora);
			pDaModificare.setDataOra(dataEora2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		pDaModificare.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
		pDaModificare.setPostiMax(Integer.parseInt(request.getParameter("posti")));
		pDaModificare.setIntervallo(Integer.parseInt(request.getParameter("intervallo")));
		Film f=UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("film")));
		pDaModificare.setFilm(f);
		if(UtilitiesDbProiezione.slotOccupato(proiezioni, pDaModificare) || !UtilitiesDbProiezione.slotRegolare(pDaModificare)) {
			errore=true;
			request.setAttribute("errore", errore);
			request.getRequestDispatcher("ServletLeggiProiezioniStaff").forward(request, response);; 
			}else {
			errore=false;
			request.setAttribute("errore", errore);
			UtilitiesDbProiezione.modificaProiezione(pDaModificare);
			request.getRequestDispatcher("ServletLeggiProiezioniStaff").forward(request, response);; 
			}
	}

}