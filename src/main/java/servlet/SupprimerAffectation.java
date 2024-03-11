package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.AffectatinManager;
import manager.EmployeManager;
import util.HiberanteUtil;

/**
 * Servlet implementation class SupprimerAffectation
 */
@WebServlet("/SupprimerAffectation")
public class SupprimerAffectation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerAffectation() {
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

		String codedlieu = request.getParameter("codedlieu");
		String codeEmpl = request.getParameter("codeEmpl");

		AffectatinManager employe = new AffectatinManager();
		employe.supAffectation(Integer.parseInt(codedlieu),Integer.parseInt(codeEmpl));
		HiberanteUtil.sessionFactory.close();

        response.sendRedirect("index.jsp"); 
	}

}
