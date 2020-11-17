package utilities;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

import model.*;

public class InvioEmail {

	public InvioEmail() {

	}

	public static void inviaMail() {
		String to = "iannucci.federico@gmail.com";
		String subject = "subject";
		String msg = "Ciao Federico";
		String from = "progettofinalejrm18gruppo1@gmail.com";
		String password = "Qwerty123!";

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		// session.setDebug(true);
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// overload del metodo di invio mail
	public static void inviaMail(Utente u, int a, String pssw) {
		// destinatario preso dalla mail di registrazione/recupero
		String to = u.getEmail();
		// creo le stringhe vuote per l'oggetto e il messaggio
		String subject = null;
		String msg = null;
		// creo uno switch per gestire i vari messaggi
		switch (a) {
		// messaggio di benvenuto
		case 1:
			subject = "Benvenuto";
			msg = "Gentile utente, \n"
					+ "\nTi ringrazio per la tua iscrizione al cinema Sorrento, per favore attendi che l'amministratore confermi la tua richiesta e ti abiliti alla prenotazione dei biglietti. \n"
					+ "Cordiali saluti. \n" + "Lo Staff di Sorrento Cinema.";
			break;
		// approvazione della registrazione
		case 2:
			subject = "Ora sei abilitato";
			msg = "Gentile utente, \n"
					+ "\nL'amministratore ha approvato la tua registrazione, ora puoi iniziare ad effettuare le tue prenotazioni! \n"
					+ "Cordiali saluti. \n" + "Lo Staff di Sorrento Cinema.";
			break;
		// recupero password
		case 3:
			subject = "Dettagli account";
			msg = "Gentile utente, \n"
					+ "\nQuesta mail ti e' stata inviata perche' hai dimenticato i tuoi dati di accesso. Le tue credenziali sono: \n"
					+ "Email: " + u.getEmail() + " \n" + "Password: " + pssw + " \n" + "Cordiali saluti. \n"
					+ "Lo Staff di Sorrento Cinema.";
			break;
		// conferma prenotazione
		case 4:
			List<Prenotazione> prenotAll=UtilitiesDbPrenotazione.leggiPrenotazione();
			List<Prenotazione> prenotAllUser=new ArrayList<Prenotazione>();
			for(int i=0; i<prenotAll.size(); i++) {
				if(prenotAll.get(i).getUtente().getIdUtente()==u.getIdUtente()) {
					prenotAllUser.add(prenotAll.get(i));
				}
			}
			subject = "Dettagli prenotazione";
			msg = "Gentile utente, \n" + "\nIn seguito i dettagli della prenotazione da te effettuata: \n";
			// creo un complicato sistema di concat e un controllo per avere tutte le
			// prenotazioni in una stringa
			if (prenotAll != null) {
				System.out.println(prenotAllUser.get(prenotAllUser.size() - 1));
				// per ogni prenotazione mi serve un numero diverso(fatto su servlet inserisci
				// prenotazione)
				// n = (int)((Math.random() * (2147483646 - 1000000000)) + 1000000000);
				// inserisco tutti i dati della prenotazione
				msg = msg.concat("Titolo: " + prenotAllUser.get(prenotAllUser.size() - 1).getProiezione().getFilm().getTitolo() + "\n");
				msg = msg.concat("Posti prenotati: " + prenotAllUser.get(prenotAllUser.size() - 1).getPostiPrenotati() + "\n");
				msg = msg.concat("Costo totale: " + prenotAllUser.get(prenotAllUser.size() - 1).getCosto_totale() + "\n");
				msg = msg.concat("Codice prenotazione (da esibire in cassa al momento dell'acquisto): \n"
						+ prenotAllUser.get(prenotAllUser.size() - 1).getCodice_biglietto() + "\n \n");
			}
			msg = msg.concat("Ti aspettiamo! \n" + "Lo Staff di Sorrento Cinema.");
			break;
		default:
			System.out.println("se sei qui c'e' un errore");
			break;
		}

		String from = "progettofinalejrm18gruppo1@gmail.com";
		String password = "Qwerty123!";

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		// session.setDebug(true);
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
