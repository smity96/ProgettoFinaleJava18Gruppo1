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

@WebServlet("/ServletCancellaUtente")
public class ServletCancellaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	List<Utente>listaU;
	Utente u;
    public ServletCancellaUtente() {
        super();
  
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println(request.getParameter("canc"));
     	u=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("canc")));
    	if(request.getParameter("canc")!=null) {
    		System.out.println("sono nell if");
    		UtilitiesDbUtente.cancUtente(u);
    		listaU=UtilitiesDbUtente.listaUtenti();
    		response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/dashboard-staff.jsp");
    	}

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	doGet(request, response);
    }

}

