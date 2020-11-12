package controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletAccessoUtente")
public class ServletAccessoUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Utente u;
	List<Utente>listaU;
    public ServletAccessoUtente() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	//request.getServletContext().getNamedDispatcher("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	listaU=UtilitiesDbUtente.listaUtenti();
    	String email=request.getParameter("email").trim();
    	String pssw=request.getParameter("password").trim();
    	boolean dentro=false;
    	for(Utente ut:listaU) {
    		System.out.println(ut.toString());
    		byte[] decodedBytes = Base64.getDecoder().decode(ut.getPassword());
    		String decodedString = new String(decodedBytes);
    		
    		if(email.equals(ut.getEmail()) && pssw.equals(decodedString)){
    			HttpSession session=request.getSession();
    			session.setAttribute("uLog",ut);
    			session.setAttribute("listaU", listaU);
//    			----indirizzo alle varie pagine----
    			switch(ut.getRuolo()) {
    			case 0:response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/profiloUtente.jsp");
    				break;
    			case 1:response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/dashboard-gestione-utenti.jsp");
    				break;
    			case 2://sendRedirect
    				break;
    			case 3://sendRedirect
    				break;
    			}
    				
    			dentro=true;
    		}				 
    	}
    	if(!dentro) {
    		response.sendRedirect("/registrazione.jsp");
    	}
    }

		//response.sendRedirect("/profilo.jsp");
	}


