package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Film;
import utilities.UtilitiesDbFilm;

@WebServlet("/ServletModificaFilm")
@MultipartConfig
public class ServletModificaFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean check = false;

	public ServletModificaFilm() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// mi prendo la lista completa dei film
		List<Film> allFilm = UtilitiesDbFilm.leggiFilmAll();
		// mi prendo la sessione del'admin
		HttpSession session = request.getSession();
		// creo l'ogetto dalle risorse ottenute
		Film f3 = new Film();
		f3.setIdFilm(Integer.parseInt(request.getParameter("id_filmMod")));
		f3.setTitolo(request.getParameter("titolo"));
		f3.setGenere(request.getParameter("genere"));
		try {
			int anno = Integer.parseInt(request.getParameter("annoDiUscita"));
			if (anno > 2021 || anno < 1400) {
				response.getWriter().append("Anno sbagliato");
			} else {
				f3.setAnnoDiUscita(request.getParameter("annoDiUscita"));
			}
		} catch (NumberFormatException e1) {
			response.getWriter().append("Anno sbagliato");
			e1.printStackTrace();
		} 
		f3.setDurata(Integer.parseInt(request.getParameter("durata")));
		f3.setUrlTrailer(request.getParameter("urlTrailer"));
		f3.setTrama(request.getParameter("trama"));
		final String path = "C:\\Users\\Smith\\Desktop\\imgProva";
		// crea il part
		final Part filePart = request.getPart("file");
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
		if(request.getPart("file")!=null) {
			f3.setLocandina("http://127.0.0.1:8887/" + fileName);
		}else {
			f3.setLocandina(request.getParameter("fileUrl"));
		}
		// controllo se la sessione esiste
		if (session.getAttribute("admin") == null) {
			System.out.println("if della sessione");
			// per ogni film contenuto nella lista
			for (Film f : allFilm) {
				// controllami se trovi un id uguale
				if (f3.getIdFilm() == f.getIdFilm()) {
					System.out.println("if dell'id");
					// se l'id e' uguale allora cambiami il check e modifica il valore
					UtilitiesDbFilm.modificaFilm(f3);
					check = true;
					break;
				}
			}
			// se il check resta falso allora aggiungi il film
			if (check == false) {
				UtilitiesDbFilm.inserisciFilm(f3);
			}
		}
		response.sendRedirect("http://localhost:8080/ProgettoFinaleJava18Gruppo1/html/dashboard-admin.jsp");
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
