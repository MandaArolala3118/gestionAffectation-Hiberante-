package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Affectation;
import manager.AffectatinManager;

/**
 * Servlet implementation class AfficheAffectation
 */
@WebServlet("/AfficheAffectation")
public class AfficheAffectation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficheAffectation() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Servlet doGet method called");
        
		AffectatinManager affectatinManager = new AffectatinManager();
        List<Object[]> affectation = affectatinManager.getAllAffectations();
        
        if (affectation != null) {
            System.out.println("Number of affecatation retrieved: " + affectation.size());
        } else {
            System.out.println("List of employes is null");
        }

        // Transmettre les données à la page JSP
        request.setAttribute("affectation", affectation);
        System.out.println("done");
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
