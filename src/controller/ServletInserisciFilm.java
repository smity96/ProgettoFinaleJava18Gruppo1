package controller;

import static utilities.UtilitiesDbUtente.*;

import java.io.*;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.Film;
import model.Utente;
import utilities.UtilitiesDbFilm;

@WebServlet("/ServletInserisciFilm")
@MultipartConfig
public class ServletInserisciFilm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			// mi prendo la lista completa dei film
			List<Film> allFilm = UtilitiesDbFilm.leggiFilmAll();
			boolean check = false;
			//creo un nuovo oggetto film
			Film f2 = new Film();
			//setto i primi parametri
			f2.setTitolo(request.getParameter("titolo"));
			f2.setGenere(request.getParameter("genere"));
			//
			try {
				int anno = Integer.parseInt(request.getParameter("annoDiUscita"));
				if (anno >= 2021 || anno < 1896) {
					response.sendRedirect("http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLeggiFilmToModifica?id_FilmMod="+request.getParameter("id_filmMod"));
				} else {
					f2.setAnnoDiUscita(request.getParameter("annoDiUscita"));
				}
			} catch (NumberFormatException e1) {
				response.sendRedirect("http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLeggiFilmToModifica?id_FilmMod="+request.getParameter("id_filmMod"));
				e1.printStackTrace();
			} catch (IOException e1) {
				response.sendRedirect("http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLeggiFilmToModifica?id_FilmMod="+request.getParameter("id_filmMod"));
				e1.printStackTrace();
			}
			f2.setDurata(Integer.parseInt(request.getParameter("durata")));
			f2.setUrlTrailer(request.getParameter("urlTrailer"));
			f2.setTrama(request.getParameter("trama"));
			final String path = "C:\\FotoProfiloProgettoF";
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
			if((request.getParameter("fileUrl").trim().equals("")||request.getParameter("fileUrl")==null)&&(fileName==null||fileName.trim().equals(""))) {
				f2.setLocandina("https://thumbs.dreamstime.com/b/pellicola-di-film-di-colore-di-35mm-3995550.jpg");
			}else if(fileName==null||fileName.trim().equals("")) {
				f2.setLocandina(request.getParameter("fileUrl"));
			}else if (request.getParameter("fileUrl").trim().equals("")||request.getParameter("fileUrl")==null) {
				f2.setLocandina("http://127.0.0.1:8887/" + fileName);
			}
			
			// controllo sul titolo
			for (Film f : allFilm) {
				if (f.getTitolo().equalsIgnoreCase(f2.getTitolo())) {
					System.out.println("if check falso");
					check = true;
					response.sendRedirect("http://localhost:8080/ProgettoFinaleJava18Gruppo1/ServletLeggiFilmToModifica?id_FilmMod="+request.getParameter("id_filmMod"));
				}
			}
			if (check == false) {
				System.out.println("if aggiunta film");
				// aggiungo film
				UtilitiesDbFilm.inserisciFilm(f2);
			}
			List<Film> film=UtilitiesDbFilm.leggiFilmAll();
			film.sort((f1,f3)->f1.getTitolo().compareToIgnoreCase(f3.getTitolo()));
			request.setAttribute("tuttiFilm", film);
			request.getRequestDispatcher("/WEB-INF/jsp/dashboard-gestione-film.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
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
