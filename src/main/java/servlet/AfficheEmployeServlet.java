package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Employe;
import manager.EmployeManager;

/**
 * Servlet implementation class AfficheEmployeServlet
 */
@WebServlet(name = "AjoutServlet", urlPatterns = "/AjoutServlet")
public class AfficheEmployeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfficheEmployeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init() throws ServletException {
        // Code à exécuter lors de l'initialisation de la servlet
        System.out.println("Servlet initialisée");
        super.init();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Servlet doGet method called");
        
        EmployeManager employeManager = new EmployeManager();
        List<Employe> employes = employeManager.getAllEmployes();

        if (employes != null) {
            System.out.println("Number of employes retrieved: " + employes.size());
        } else {
            System.out.println("List of employes is null");
        }

        // Transmettre les données à la page JSP
        request.setAttribute("employes", employes);

        // Rediriger vers la page JSP
        request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);

	}

}
