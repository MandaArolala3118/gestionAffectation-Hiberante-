package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.AffectatinManager;
import util.HiberanteUtil;

/**
 * Servlet implementation class AjoutEffectation
 */
@WebServlet("/AjoutEffectation")
public class AjoutEffectation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutEffectation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date = request.getParameter("date");

		System.out.println("ajou affectation");
		System.out.println(date);
        int codeEmpl =  Integer.parseInt(request.getParameter("codeEmpl"));
		int codeLieu = Integer.parseInt(request.getParameter("codeLieu"));
		AffectatinManager af = new AffectatinManager();
		
		af.ajoutAffectation(codeEmpl, codeLieu, date);
		HiberanteUtil.sessionFactory.close();

        response.sendRedirect("affectation.jsp"); 
	}

}
