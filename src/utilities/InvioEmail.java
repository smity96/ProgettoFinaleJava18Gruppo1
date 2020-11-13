package utilities;

import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
}

