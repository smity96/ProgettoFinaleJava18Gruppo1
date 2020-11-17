package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Proiezione;
import utilities.UtilitiesDbProiezione;
//lorem ipsum
@WebServlet("/ServletCancellaProiezione")
public class ServletCancellaProiezione extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletCancellaProiezione() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Proiezione pDaEliminare=UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("idDaEliminare")));
		UtilitiesDbProiezione.eliminaProiezione(pDaEliminare);
		response.sendRedirect("ServletLeggiProiezioniAdmin");
	}

}
