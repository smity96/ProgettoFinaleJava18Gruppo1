package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

@WebServlet("/ServletModificaProiezione")
public class ServletModificaProiezione extends HttpServlet {
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
		Proiezione pDaModificare=UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("idDaModificare")));
		String dataEora  = request.getParameter("dataOra");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		try {
			Date dataEora2 = formatter.parse(dataEora);
			pDaModificare.setDataOra(dataEora2);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		pDaModificare.setPostiMax(Integer.parseInt(request.getParameter("posti")));
		pDaModificare.setIntervallo(Integer.parseInt(request.getParameter("intervallo")));
		Film f=UtilitiesDbFilm.leggiFilm(Integer.parseInt(request.getParameter("idFilm")));
		pDaModificare.setFilm(f);
		if(UtilitiesDbProiezione.slotOccupato(proiezioni, pDaModificare) || !UtilitiesDbProiezione.slotRegolare(pDaModificare)) {
			// TODO chiedere come inserire una risposta d'errore
			//provasendredirect
			//TODO controllo? jsp amministratore/staff
			System.out.println("if");
			response.sendRedirect("ServletLeggiProiezioni"); 
		}else {
			System.out.println("else");
			UtilitiesDbProiezione.modificaProiezione(pDaModificare);
			response.sendRedirect("ServletLeggiProiezioni"); 
		}
	}

}