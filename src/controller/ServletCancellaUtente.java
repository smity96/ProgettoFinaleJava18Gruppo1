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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		listaU=UtilitiesDbUtente.listaUtenti();
		if(request.getParameter("remove")!=null) {
			//u=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("remove")));
			//Utente u=UtilitiesDbUtente.leggiUtenteById(request.getParameter("remove"));
			UtilitiesDbUtente.cancUtente(request.getParameter("remove"));
		}
			for(Utente ut:listaU) {
				if(ut.equals(u)) {
					listaU.remove(u);
				}
			}
		doGet(request, response);
	}

}

