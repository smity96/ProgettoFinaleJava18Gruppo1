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
    	String email=request.getParameter("email");
    	String pssw=request.getParameter("password");
    	boolean dentro=false;
    	for(Utente ut:listaU) {
    		System.out.println(ut.toString());
    		if(email.equals(ut.getEmail()) && pssw.equals(ut.getPassword())){
    			HttpSession session=request.getSession();
    			session.setAttribute("uLog",ut);
//    			----indirizzo alle varie pagine----
//    			if(ut.getRuolo()==3) {
//    			}
 				response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/dashboard-admin.jsp");
    				
    			dentro=true;
    		}				 
    	}
    	if(!dentro) {
    		response.sendRedirect("/registrazione.jsp");
    	}
    }

		//response.sendRedirect("/profilo.jsp");
	}


