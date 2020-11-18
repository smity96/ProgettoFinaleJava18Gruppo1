package controller;

import java.io.IOException;
import static utilities.UtilitiesDbUtente.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Proiezione;
import utilities.UtilitiesDbProiezione;

@WebServlet("/ServletCancellaProiezioneStaff")
public class ServletCancellaProiezioneStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletCancellaProiezioneStaff() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!isStaff(request)) {
			response.sendRedirect(request.getContextPath());
		}else {
			Proiezione pDaEliminare=UtilitiesDbProiezione.leggiProiezioneById(Integer.parseInt(request.getParameter("idDaEliminare")));
			UtilitiesDbProiezione.eliminaProiezione(pDaEliminare);
			response.sendRedirect("ServletLeggiProiezioniStaff");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
