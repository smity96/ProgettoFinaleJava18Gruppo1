package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import utilities.UtilitiesDbUtente;


@WebServlet("/ServletModificaUtente")
public class ServletModificaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Utente utente;
	List<Utente>listaU;
    public ServletModificaUtente() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("sono nel do get ModUt");

    	if(request.getParameter("data_di_nascita")!=null) {
    		Date dataDiNascita=null;
    		try {
    			dataDiNascita = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("data_di_nascita"));
    			utente.setDataDiNascita(dataDiNascita);
    		} catch (ParseException e) {
    			e.printStackTrace();
    		}
    	}

    		System.out.println("sono nell if");
    		utente=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("id")));			
    		utente.setNome(request.getParameter("nome"));
    		utente.setCognome(request.getParameter("cognome"));
    		utente.setEmail(request.getParameter("email"));
    		utente.setIndirizzo(request.getParameter("indirizzo"));
    		utente.setPassword(request.getParameter("password"));
    		utente.setNomeSocieta(request.getParameter("nomeSoc"));
    		utente.setPIva(request.getParameter("pIva"));
    		utente.setImmagine(request.getParameter("img"));
    		System.out.println(utente.toString());
    		UtilitiesDbUtente.modUtente(utente);
    		listaU=UtilitiesDbUtente.listaUtenti();
    		response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/dashboard-staff.jsp");

    		//}
    		response.getWriter().append("Served at: ").append(request.getContextPath());
    	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}

