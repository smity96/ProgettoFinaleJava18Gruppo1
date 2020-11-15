package controller;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import utilities.InvioEmail;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletRecuperoPassword")
public class ServletRecuperoPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public ServletRecuperoPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath()+"/html/emailPasswordInviata.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//mi salvo l'email
		String email=request.getParameter("email");
		//creo la stringa per la password in chiaro
		String decodedString=null;
		//mi prendo tutti gli utenti
		List<Utente>allUtenti=UtilitiesDbUtente.listaUtenti();
		//li scorro
		for(Utente u: allUtenti) {
			//se ne trovo uno con la stessa email
			if(email.equals(u.getEmail())){
				//decodifico la password
				String encodedString=u.getPassword();
				byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
				decodedString = new String(decodedBytes);
				//gliela invio via mail
				InvioEmail.inviaMail(u, 3, decodedString);
			}
		}
		doGet(request, response);
	}

}
