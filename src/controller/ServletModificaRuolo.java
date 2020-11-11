package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Utente;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletModificaRuolo")
public class ServletModificaRuolo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletModificaRuolo() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String idU=request.getParameter("b");
    	if(idU!=null) {
    		Integer nId=Integer.parseInt(idU);
    		Utente u=UtilitiesDbUtente.leggiUtenteById(nId);
    		u.toString();
    		u.setRuolo(1);
    		UtilitiesDbUtente.modUtente(u);

 }
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
