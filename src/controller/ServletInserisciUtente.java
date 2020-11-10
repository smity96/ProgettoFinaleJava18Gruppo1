package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import model.Utente;
import utilities.UtilitiesDbUtente;


@WebServlet("/ServletInserisciUtente")
@MultipartConfig
public class ServletInserisciUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Utente utente=new Utente();
	List<Utente> listaU;

	public ServletInserisciUtente() {
		super();
		listaU =UtilitiesDbUtente.listaUtenti();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String pi =request.getParameter("P.I.");
		boolean reg=true;
		if(!email.equals("")) {

			for(Utente ut:listaU) {
				if(	email.equals(ut.getEmail())){
					reg=true;
					response.sendRedirect("login.jsp");
					break;
				}
			}	
			if(!request.getParameter("password").equals("") || !request.getParameter("data_di_nascita").equals("")||!reg) {
				utente.setEmail(email);
				utente.setPIva(pi);
				utente.setNome(request.getParameter("nome"));
				utente.setCognome(request.getParameter("cognome"));
				utente.setPassword(request.getParameter("password"));
				utente.setIndirizzo(request.getParameter("indirizzo"));
				utente.setNomeSocieta(request.getParameter("nomeSoc"));
				utente.setImmagine(request.getParameter("urlimmag"));
				String dataDiNascita=(request.getParameter("data_di_nascita"));
				Date dDn = null;
				try {
					dDn = new SimpleDateFormat("dd-MM-yyyy").parse(dataDiNascita);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				utente.setDataDiNascita(dDn);
				UtilitiesDbUtente.insUtente(utente);
				System.out.println(utente.getNome());
				listaU.add(utente);
			}else {
				response.sendRedirect("/registrazione.jsp");

			}
		}
	}
}
