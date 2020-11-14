package utilities;

import java.io.*;
import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

@WebServlet("/InvioEmail")
public class InvioEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InvioEmail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		inviaMail();
		response.sendRedirect("provaFilm.jsp");
	}
	
	public static void inviaMail() {
		String to = "iannucci.federico@gmail.com";
	    String subject = "subject";
	    String msg ="Ciao Federico";
	    String from ="progettofinalejrm18gruppo1@gmail.com";
	    String password ="Qwerty123!";

	    Properties props = new Properties();  
	    props.setProperty("mail.transport.protocol", "smtp");     
	    props.setProperty("mail.host", "smtp.gmail.com");  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.port", "465");  
	    props.put("mail.debug", "true");  
	    props.put("mail.smtp.socketFactory.port", "465");  
	    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
	    props.put("mail.smtp.socketFactory.fallback", "false");  
	    Session session = Session.getDefaultInstance(props,  
	    new javax.mail.Authenticator() {
	       protected PasswordAuthentication getPasswordAuthentication() {  
	       return new PasswordAuthentication(from,password);   
	   }  
	   });  

	   //session.setDebug(true);  
	   try {
		   Transport transport = session.getTransport();  
		   InternetAddress addressFrom = new InternetAddress(from);  

		   MimeMessage message = new MimeMessage(session);  
		   message.setSender(addressFrom);  
		   message.setSubject(subject);  
		   message.setContent(msg, "text/plain");  
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  
		   
		   transport.connect();  
		   Transport.send(message);  
		   transport.close();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	}
	
	//overload del metodo di invio mail
	public static void inviaMail(Utente u, int a, String pssw) {
		//mi prendo le prenotazioni dall'utente
		List<Prenotazione> prenotAll=null;
		try {
			prenotAll=u.getPrenotazioni();
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		//creo un numero casuale di 10 cifre per il biglietto
		int n = (int)((Math.random() * (2147483646 - 1000000000)) + 1000000000);
		//destinatario preso dalla mail di registrazione/recupero
		String to = u.getEmail();
		//creo le stringhe vuote per l'oggetto e il messaggio
		String subject=null;
		String msg=null;
		//creo uno switch per gestire i vari messaggi
		switch (a) {
		//messaggio di benvenuto 
		case 1:
			subject = "Benvenuto";
		    msg ="Gentile utente, \n"+
		    	"\n Ti ringrazio per la tua iscrizione al cinema Sorrento, per favore attendi che l'amministratore confermi la tua richiesta e ti abiliti alla prenotazione dei biglietti. \n"+
		    	"Cordiali saluti. \n"+
		    	"Lo Staff del cinema Sorrento.";
			break;
		//approvazione della registrazione
		case 2:
			subject = "Ora sei abilitato";
		    msg ="Gentile utente, \n"+
		    	"\n L'amministratore ha approvato la tua registrazione, ora puoi iniziare ad effettuare le tue prenotazioni!"+
		    	"Cordiali saluti. \n"+
		    	"Lo Staff del cinema Sorrento.";
			break;
		//recupero password
		case 3:
			subject = "Dettagli account";
			msg ="Gentile utente, \n"+
				"\n Questa mail ti e' stata inviata perche' hai scordato i tuoi dati di accesso, i tuoi dati di accesso sono: \n"+
				"Email: "+u.getEmail()+" \n"+
				"Password: "+pssw+" \n"+
				"Cordiali saluti. \n"+
		    	"Lo Staff del cinema Sorrento.";
			break;
		//conferma prenotazione
		case 4:
			subject = "Dettagli prenotazione";
			msg ="Gentile utente, \n"+
				"\n In seguito i dettagli della prenotazione da te effettuata: \n";
			//creo un complicato sistema di concat e un controllo per avere tutte le prenotazioni in una stringa
			if(prenotAll!=null) {
				for(Prenotazione p:prenotAll) {
					//per ogni prenotazione mi serve un numero diverso
					n = (int)((Math.random() * (2147483646 - 1000000000)) + 1000000000);
					//inserisco tutti i dati della prenotazione
					msg=msg.concat("Titolo: "+p.getProiezione().getFilm().getTitolo()+"\n");
					msg=msg.concat("Posti prenotati: "+p.getPostiPrenotati()+"\n");
					msg=msg.concat("Costo totale: "+p.getCosto_totale()+"\n");
					msg=msg.concat("Codice prenotazione (da esibire in cassa al momento dell'acquisto): \n"+
					n+"\n");
				}
			}
			msg=msg.concat("Ti aspettiamo! \n"+
							"Lo Staff del cinema Sorrento.");
			break;
		default:
			System.out.println("se sei qui c'e' un errore");
			break;
		}
	    
	    String from ="progettofinalejrm18gruppo1@gmail.com";
	    String password ="Qwerty123!";

	    Properties props = new Properties();  
	    props.setProperty("mail.transport.protocol", "smtp");     
	    props.setProperty("mail.host", "smtp.gmail.com");  
	    props.put("mail.smtp.auth", "true");  
	    props.put("mail.smtp.port", "465");  
	    props.put("mail.debug", "true");  
	    props.put("mail.smtp.socketFactory.port", "465");  
	    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
	    props.put("mail.smtp.socketFactory.fallback", "false");  
	    Session session = Session.getDefaultInstance(props,  
	    new javax.mail.Authenticator() {
	       protected PasswordAuthentication getPasswordAuthentication() {  
	       return new PasswordAuthentication(from,password);   
	   }  
	   });  

	   //session.setDebug(true);  
	   try {
		   Transport transport = session.getTransport();  
		   InternetAddress addressFrom = new InternetAddress(from);  

		   MimeMessage message = new MimeMessage(session);  
		   message.setSender(addressFrom);  
		   message.setSubject(subject);  
		   message.setContent(msg, "text/plain");  
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  
		   
		   transport.connect();  
		   Transport.send(message);  
		   transport.close();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	}
}

