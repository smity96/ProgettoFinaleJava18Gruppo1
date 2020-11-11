package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Proiezione;
import utilities.UtilitiesDbProiezione;


@WebServlet("/ServletLeggiIndex")
public class ServletLeggiIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ServletLeggiIndex() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Proiezione> proiezioni = UtilitiesDbProiezione.leggiProiezioni();
		request.setAttribute("proiezioni", proiezioni);
		request.getRequestDispatcher("/html/index.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}