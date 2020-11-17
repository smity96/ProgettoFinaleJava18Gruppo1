package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import utilities.UtilitiesDbUtente;


@WebServlet("/ServletLeggiUtenteStaff")
public class ServletLeggiUtenteStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletLeggiUtenteStaff() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Utente> listaU=UtilitiesDbUtente.listaUtenti();
		request.setAttribute("listaU", listaU);
		request.getRequestDispatcher("/html/dashboard-staff-gestione-utenti.jsp").forward(request, response);
	}

}
