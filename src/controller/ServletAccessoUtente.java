package controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
	List<Utente> listaU;

	public ServletAccessoUtente() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		listaU = UtilitiesDbUtente.listaUtenti();
		String email = request.getParameter("email").trim();
		String pssw = request.getParameter("password").trim();
		boolean dentro = false;
		for (Utente ut : listaU) {
//-----------DECRIPTO LA PASSWORD NEL DATABASE E LA PARAGONO CON QUELLA FORNITA ------			
			byte[] decodedBytes = Base64.getDecoder().decode(ut.getPassword());
			String decodedString = new String(decodedBytes);
//-----------CONTROLLO SE NEL DB � PRESENTE MAIL+PASSWORD-----------------------------
			if (email.equals(ut.getEmail()) && pssw.equals(decodedString)) {
//-----------CREO UNA SESSIONE CON L'UTENTE LOGGATO-----------------------------------				
				HttpSession session = request.getSession();
				session.setAttribute("uLog", ut);
//-----------CREO I COOKIES DELL'UTENTE-----------------------------------------------				
				if (request.getParameter("ricordami")!=null){
					Cookie accesso=new Cookie("idUtente",Integer.toString(ut.getIdUtente()));
					response.addCookie(accesso);
				}

//-----------CONTROLLO IL RUOLO E INDIRIZZO ALLE VARIE DASHBOARD----------------------
				switch (ut.getRuolo()) {
				case 0:
					//registrazione non approvata
					response.sendRedirect("/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex");
					break;
				case 1:
					//utente normale
					response.sendRedirect("/ProgettoFinaleJava18Gruppo1/ServletLeggiIndex");
					break;
				case 2:
					//staff
					request.setAttribute("listaU", listaU);
					request.getRequestDispatcher("html/dashboard-staff-messaggio-benvenuto.jsp").forward(request, response);
					break;
				case 3:
					//admin
					request.setAttribute("listaU", listaU);
					request.getRequestDispatcher("html/dashboard-messaggio-benvenuto.jsp").forward(request, response);
					break;
				default:
					System.out.println("Non dovresti essere qui");
					break;
				}
				dentro = true;
			}
		}
//------------------SE LOGIN ERRATO INDIRIZZATO ALLA REGISTRAZIONE-----------------------------		
		if (!dentro) {
			request.getRequestDispatcher("html/registrazione.jsp").forward(request, response);
		}
	
		// response.sendRedirect("/profilo.jsp");
	}	
}
