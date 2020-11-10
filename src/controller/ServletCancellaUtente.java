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
    public ServletCancellaUtente() {
        super();
  
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utente u=UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("id")));
		listaU=UtilitiesDbUtente.listaUtenti();
		for(Utente ut:listaU) {
			if(ut.equals(u)) {
				listaU.remove(u);
			}
		}
		
		
		if(u!= null && u.getRuolo()==3){
			UtilitiesDbUtente.cancUtente(u);
	}
		
		doGet(request, response);
	}

}

