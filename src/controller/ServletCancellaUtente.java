package controller;

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
    	//creo sessione admin
    	HttpSession s=request.getSession(false); 
    	//creo admin
    	Utente uAdm = (Utente)s.getAttribute("uLog");
    	System.out.println(request.getParameter("canc"));
    	if(!request.getParameter("canc").trim().equals("")) {
    		//creo l'utente che devo cancellare
         	u=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("canc")));
    		System.out.println("sono nell if");
    		UtilitiesDbUtente.cancUtente(u);
    		listaU=UtilitiesDbUtente.listaUtenti();
    		request.setAttribute("listaU", listaU);
    		if(uAdm.getRuolo()==3) {
    	        request.getRequestDispatcher("html/dashboard-gestione-utenti.jsp").forward(request, response);
    		}else if(uAdm.getRuolo()==2){
    			request.getRequestDispatcher("html/dashboard-staff-gestione-utenti.jsp").forward(request, response);
    		}
    			
    	}else {
    		response.sendRedirect("html/dashboard-gestione-utenti.jsp");
    	}
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }

}

