package controller;

import static utilities.UtilitiesDbUtente.*;

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

import javax.mail.Session;
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
		if (!isAdmin(request) && !isStaff(request) && !isUtente(request)) {
			response.sendRedirect(request.getContextPath());
		} else {
			utente = UtilitiesDbUtente.leggiUtenteById(Integer.parseInt(request.getParameter("d")));
			// ---------GESTIONE PARTITA IVA ->UNIQUE<- -------------------------
			String pIva = request.getParameter("pIva");
			if (pIva.trim().equals("")) {
				pIva = null;
			}
			// ---------GESTIONE DATA DI NASCITA----------------------------------
			String dDn = request.getParameter("data_di_nascita");
			if (!dDn.trim().equals("")) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				LocalDate d1 = LocalDate.parse(dDn, dtf);
				System.out.println(d1);
				Date dNa = UtilitiesDbFilm.convertiLocalDate(d1);
				System.out.println(dNa);
				utente.setDataDiNascita(dNa);
			}
			// ---------GESTIONE UTENTE------------------------------------------
			utente.setNome(request.getParameter("nome"));
			utente.setCognome(request.getParameter("cognome"));
			utente.setEmail(request.getParameter("email"));
			utente.setIndirizzo(request.getParameter("indirizzo"));
			// -----------GESTIONE CRIPTAZIONE PASSWORD----------------------
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
			// ---------AGGIORNAMENTO LISTA -----------------------------------------------
			listaU = UtilitiesDbUtente.listaUtenti();
			// --------- GESTIONE REINDIRIZZAMENTO IN FUNZIONE DEL RUOLO NELLA SESSION-----
			int red = 0;
			if (request.getParameter("red") != null) {
				red = Integer.parseInt(request.getParameter("red"));
				System.out.println(red);
			}
			if (isAdmin(request)) {
				if (red == 3) {
					request.setAttribute("uLogSt", utente);
					request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-profilo.jsp").forward(request,
							response);
				} else {
					// utente admin
					request.setAttribute("listaU", listaU);
					request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-utenti.jsp").forward(request,
							response);
				}
			} else if (isStaff(request)) {
				if (red == 2) {
					System.out.println("if red");
					request.setAttribute("uLogSt", utente);
					request.getRequestDispatcher("/WEB-INF/jsp/dashboard-staff-gestione-profilo.jsp").forward(request,
							response);
				} else {
					System.out.println("if else");
					// utente staff
					request.setAttribute("listaU", listaU);
					request.getRequestDispatcher("/WEB-INF/jsp/dashboard-staff-gestione-utenti.jsp").forward(request,
							response);
				}
			} else if (isUtente(request)) {
				// utente normale
				request.setAttribute("uLogSt", utente);
				request.getRequestDispatcher("/WEB-INF/jsp/profiloUtente.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
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
