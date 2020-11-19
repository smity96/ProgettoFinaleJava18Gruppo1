package controller;

import static utilities.UtilitiesDbUtente.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletCancellaUtente")
public class ServletCancellaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Utente>listaU;
	Utente u;
    public ServletCancellaUtente() {
        super();
  
    }
   

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(isAdmin(request) || isStaff(request)) {
        	if(!request.getParameter("canc").trim().equals("")||request.getParameter("canc")!=null) {
        		//creo l'utente che devo cancellare
             	u=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("canc")));
        		UtilitiesDbUtente.cancUtente(u);
        		listaU=UtilitiesDbUtente.listaUtenti();
        		if(isAdmin(request)) {
        			request.setAttribute("listaU", listaU);
        			request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-utenti.jsp").forward(request, response);
        		} 
        		if(isStaff(request)) {
        			request.setAttribute("listaU", listaU);
        			request.getRequestDispatcher("/WEB-INF/jsp/dashboard-staff-gestione-utenti.jsp").forward(request, response);
        		}
        	
        		}
    	}else if(isUtente(request)) {
    		if(!request.getParameter("canc").trim().equals("")||request.getParameter("canc")!=null) {
	        		//creo l'utente che devo cancellare
	             	u=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("canc")));
	        		UtilitiesDbUtente.cancUtente(u);
	        		listaU=UtilitiesDbUtente.listaUtenti();
	        		HttpSession session = request.getSession();
					session.setAttribute("uLog", null);
        		
        			request.setAttribute("listaU", listaU);
        			request.getRequestDispatcher("ServletLeggiIndex").forward(request, response);
        		
        		}
    	
    	} else {
    	
        	response.sendRedirect("ServletLeggiIndex");
    	}	
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }

}

