package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.SendResult;

import model.Utente;
import utilities.UtilitiesDbFilm;
import utilities.InvioEmail;
import utilities.UtilitiesDbUtente;

@WebServlet("/ServletInserisciUtente")
@MultipartConfig
public class ServletInserisciUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Utente utente = new Utente();
	List<Utente> listaU;

	public ServletInserisciUtente() {
		super();
		listaU = UtilitiesDbUtente.listaUtenti();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email").trim();
		String pi =request.getParameter("P.I.").trim();
		String dDn=request.getParameter("data_di_nascita").trim();
		boolean reg=true;
//------GESTISCO LA ->PARTITA-IVA<-	---------------------
		if(pi.equals("")) {
			pi=null;
		}
//------CONTROLLO CHE NON SIA GIA' PRESENTE LA ->MAIL<- NEL DB,
//			SE PRESENTE REINDIRIZZO A login---------------------
		if(!email.equals("")) {

			for(Utente ut:listaU) {
				if(	email.equals(ut.getEmail())){
					reg=true;
					response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/login.jsp");
					break;
				}
			}	
//------CONTROLLO CHE SIANO PRESENTI ->PASSWORD/DATA.DI.NASCITA<- (REQUISITI FONDAMENTALI DELLA REGISTRAZIONE)			
			if(!request.getParameter("password").equals("") || !dDn.equals("")||!reg) {
				utente.setEmail(email);
				utente.setPIva(pi);
				utente.setNome(request.getParameter("nome"));
				utente.setCognome(request.getParameter("cognome"));
//--------GESTISCO LA CODIFICA DELLA PASSWORD-----------------------------------
				String pssw=request.getParameter("password");
				String encodedString = Base64.getEncoder().encodeToString(pssw.getBytes());
				utente.setPassword(encodedString);
				utente.setIndirizzo(request.getParameter("indirizzo"));
				utente.setNomeSocieta(request.getParameter("nomeSoc"));
//-------GESTIONE INSERIMENTO IMMAGINE DI PROFILO------------------------------------------				
				final String path = "C:\\FotoProfiloProgettoF";
		        // crea il part
		        final Part filePart = request.getPart("imgP");
		        // creiamo il file
		        System.out.println(filePart);
		        final String fileName = getFileName(filePart);
		        System.out.println("fileName: " + fileName);
		        try (OutputStream out = new FileOutputStream(new File(path + File.separator + fileName));
		                InputStream fileContent = filePart.getInputStream();) {
		            int read = 0;
		            final byte[] bytes = new byte[1024];
		            while ((read = fileContent.read(bytes)) != -1) {
		                out.write(bytes, 0, read);
		            }
		        } catch (FileNotFoundException e) {
		            System.out.println("sto nel catch");
		            e.printStackTrace();
		        }
				utente.setImmagine("http://127.0.0.1:8887/" + fileName);
//-----------FORMATTAZIONE DELLA DATA.DI.NASCITA ------------------------------------------				
//-----------CONVERTO LA DATA IN LOCALdate E VERIFICO CHE L'ETA' SIA MAGGIORE DI 16---------				
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");		
				LocalDate d1=LocalDate.parse(dDn,dtf);
				int periodo=Period.between(d1,LocalDate.now()).getYears();
				System.out.println("PERIODO:"+periodo);
				if(periodo>16) {		
				Date dNa=UtilitiesDbFilm.convertiLocalDate(d1);
				utente.setDataDiNascita(dNa);
				/*}else {
					response.sendRedirect("");
					
				}*/
//----------INSERIMENTO UETENTE NEL DATABASE-----------------------------------------------------				
				UtilitiesDbUtente.insUtente(utente);
				System.out.println(utente.toString());
//-----------AGGIORNO LA LISTA E REINDIRIZZO ALLA HOME PAGE --------------------------------------
				listaU.add(utente);
				//invio la mail di attesa conferma, consultare il metodo per capire perche' ci sono 3 valori
				InvioEmail.inviaMail(utente, 1, null);
				response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/index.jsp");
			
			}else {
				response.sendRedirect("http://localhost:8080/ProgettoFinaleJava18Gruppo1/html/registrazione.jsp");

			}
		}
	}
	}
//-----------METODO GESTIONE IMMAGINI---------------------------------------------	
	private String getFileName(final Part part) {
		System.out.println(part.getHeader("content-disposition"));
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
