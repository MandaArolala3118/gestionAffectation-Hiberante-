package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.EmployeManager;
import manager.LieuManager;
import util.HiberanteUtil;

/**
 * Servlet implementation class ModificationLieu
 */
@WebServlet("/ModificationLieu")
public class ModificationLieu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificationLieu() {
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
		String codeLieuModif = request.getParameter("id");
		String Designation = request.getParameter("Designation");
		String Province = request.getParameter("Province");
		System.out.println(codeLieuModif);
		System.out.println(Designation);
		System.out.println(Province);
		LieuManager employe = new LieuManager();
		employe.modifLieu(Integer.parseInt(codeLieuModif), Designation, Province);
		HiberanteUtil.sessionFactory.close();

        response.sendRedirect("lieuAffectation.jsp"); 
	}

}
