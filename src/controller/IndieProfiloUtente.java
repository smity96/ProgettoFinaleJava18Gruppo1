package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static utilities.UtilitiesDbUtente.*;

@WebServlet("/IndieProfiloUtente")
public class IndieProfiloUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IndieProfiloUtente() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(isUtente(request)) {
			request.getRequestDispatcher("/WEB-INF/jsp/profiloUtente.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
