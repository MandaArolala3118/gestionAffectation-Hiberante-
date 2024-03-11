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
 * Servlet implementation class LieuSuppression
 */
@WebServlet("/LieuSuppression")
public class LieuSuppression extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LieuSuppression() {
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

		String idEmploye = request.getParameter("id");

		LieuManager employe = new LieuManager();
		employe.supLieu(Integer.parseInt(idEmploye));
		HiberanteUtil.sessionFactory.close();

        response.sendRedirect("lieuAffectation.jsp"); 
	}

}
