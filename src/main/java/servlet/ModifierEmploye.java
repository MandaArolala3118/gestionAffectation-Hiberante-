package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.EmployeManager;
import util.HiberanteUtil;

/**
 * Servlet implementation class ModifierEmploye
 */
@WebServlet("/ModifierEmploye")
public class ModifierEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifierEmploye() {
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

		String idEmploye = request.getParameter("id");
		String nomEmploye = request.getParameter("nom");
		String prenomEmploye = request.getParameter("prenom");
		String posteEmploye = request.getParameter("poste");
		System.out.println(idEmploye);
		System.out.println(nomEmploye);
		System.out.println(prenomEmploye);
		System.out.println(posteEmploye);
		EmployeManager employe = new EmployeManager();
		employe.modifEmploye(Integer.parseInt(idEmploye), nomEmploye, prenomEmploye, posteEmploye);
		HiberanteUtil.sessionFactory.close();

        response.sendRedirect("index.jsp"); 
	}

}
