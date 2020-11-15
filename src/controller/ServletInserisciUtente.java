package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pi = request.getParameter("P.I.");

		if (pi.trim().equals("")) {
			pi = null;
		}
		System.out.println(request.getParameter("data_di_nascita"));
		boolean reg = true;
		if (!email.trim().equals("")) {
			for (Utente ut : listaU) {
				if (email.equals(ut.getEmail())) {
					response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/login.jsp");
					break;
				}
			}
			if (!request.getParameter("password").trim().equals("") || !request.getParameter("data_di_nascita").trim().equals("")
					|| !reg) {
				utente.setEmail(email);
				utente.setPIva(pi);
				utente.setNome(request.getParameter("nome"));
				utente.setCognome(request.getParameter("cognome"));
				String pssw = request.getParameter("password");
				String encodedString = Base64.getEncoder().encodeToString(pssw.getBytes());
				utente.setPassword(encodedString);
				utente.setIndirizzo(request.getParameter("indirizzo"));
				utente.setNomeSocieta(request.getParameter("nomeSoc"));
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
				if(fileName!=null) {
					utente.setImmagine("http://127.0.0.1:8887/" + fileName);
				}else {
					utente.setImmagine("https://mpng.subpng.com/20180521/ocp/kisspng-computer-icons-user-profile-avatar-french-people-5b0365e4f1ce65.9760504415269493489905.jpg");
				}
				String dataDiNascita = (request.getParameter("data_di_nascita"));
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
				//invio la mail di attesa conferma, consultare il metodo per capire perche' ci sono 3 valori
				InvioEmail.inviaMail(utente, 1, null);
				response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/login.jsp");
			} else {
				response.sendRedirect("/ProgettoFinaleJava18Gruppo1/html/registrazione.jsp");
			}
		}
	}

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
