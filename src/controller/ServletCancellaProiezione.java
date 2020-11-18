package controller;

import static utilities.UtilitiesDbUtente.isAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Proiezione;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletCancellaProiezione")
public class ServletCancellaProiezione extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletCancellaProiezione() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!isAdmin(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			Proiezione pDaEliminare=UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("idDaEliminare")));
			UtilitiesDbProiezione.eliminaProiezione(pDaEliminare);
			response.sendRedirect("ServletLeggiProiezioniAdmin");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
