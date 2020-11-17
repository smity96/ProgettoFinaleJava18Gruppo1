package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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

import model.Utente;
import utilities.UtilitiesDbFilm;
import utilities.UtilitiesDbUtente;
//lorem ipsum
@WebServlet("/ServletModificaUtente")
@MultipartConfig
public class ServletModificaUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Utente utente;
	List<Utente> listaU;

	public ServletModificaUtente() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		utente = UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("d")));
//---------GESTIONE PARTITA IVA ->UNIQUE<-  -------------------------
		String pIva = request.getParameter("pIva");
		if (pIva.trim().equals("")) {
			pIva = null;
		}
//---------GESTIONE DATA DI NASCITA----------------------------------    	
		String dDn = request.getParameter("data_di_nascita");
		if (!dDn.trim().equals("")) {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate d1 = LocalDate.parse(dDn, dtf);
			System.out.println(d1);
			Date dNa = UtilitiesDbFilm.convertiLocalDate(d1);
			System.out.println(dNa);
			utente.setDataDiNascita(dNa);
		}
//---------GESTIONE UTENTE------------------------------------------    	
		utente.setNome(request.getParameter("nome"));
		utente.setCognome(request.getParameter("cognome"));
		utente.setEmail(request.getParameter("email"));
		utente.setIndirizzo(request.getParameter("indirizzo"));
//-----------GESTIONE CRIPTAZIONE PASSWORD----------------------    		
		String pssw = request.getParameter("password").trim();
		System.out.println("password:" + pssw);
		if (!pssw.equals("")) {
			System.out.println("sto nell if sono la ps:" + pssw + "<-fine ");
			String encodedString = Base64.getEncoder().encodeToString(pssw.getBytes());
			utente.setPassword(encodedString);
		}
		utente.setNomeSocieta(request.getParameter("nomeSoc"));
		utente.setPIva(pIva);
// -----------GESTIONE MODIFICA IMMAGINE-------------------------   		
		final String path = "C:\\FotoProfiloProgettoF";
		// crea il part
		final Part filePart = request.getPart("img");
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
		System.out.println(utente.toString());
		UtilitiesDbUtente.modUtente(utente);
//---------AGGIORNAMENTO LISTA -----------------------------------------------    		
		listaU = UtilitiesDbUtente.listaUtenti();
//--------- GESTIONE REINDIRIZZAMENTO IN FUNZIONE DEL RUOLO NELLA SESSION-----   		
		HttpSession s = request.getSession(false);
		Utente inSessione = (Utente) s.getAttribute("uLog");
		if (!request.getParameter("red").trim().equals("")) {
			int red = Integer.parseInt(request.getParameter("red"));
			if (red == 1) {
				// utente normale
				request.getRequestDispatcher("html/profiloUtente.jsp").forward(request, response);
			} else if (red == 2) {
				request.getRequestDispatcher("ServletLeggiUtenteStaff").forward(request, response);
			} else if (red == 3) {
				request.getRequestDispatcher("ServletLeggiUtenteAdmin").forward(request, response);
			} else {
				switch (inSessione.getRuolo()) {
				case 2:
					// utente staff
					request.setAttribute("listaU", listaU);
					request.getRequestDispatcher("html/dashboard-staff-gestione-utenti.jsp").forward(request, response);
					break;
				case 3:
					// utente admin
					request.setAttribute("listaU", listaU);
					request.getRequestDispatcher("html/dashboard-gestione-utenti.jsp").forward(request, response);
					break;
				}
			}
		}
	}

//------METODO PER LA GETIONE DELLE IMG----------------------------------------------------------
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
