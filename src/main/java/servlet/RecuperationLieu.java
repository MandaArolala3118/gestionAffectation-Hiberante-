package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Lieu;
import manager.LieuManager;

/**
 * Servlet implementation class RecuperationLieu
 */
@WebServlet("/RecuperationLieu")
public class RecuperationLieu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperationLieu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Servlet doGet method called");
        
        LieuManager lieuManager = new LieuManager();
        List<Lieu> lieu = lieuManager.getAllLieus();

        

        // Transmettre les données à la page JSP
        request.setAttribute("lieux", lieu);

        // Rediriger vers la page JSP
        request.getRequestDispatcher("affectation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
