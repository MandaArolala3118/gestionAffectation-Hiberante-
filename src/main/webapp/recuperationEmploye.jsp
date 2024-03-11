<%@ page import="java.util.List" %>
<%@ page import="bean.Employe" %>
<%@ page import="manager.EmployeManager" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Récupérer le paramètre de recherche
    String keyword = request.getParameter("keyword");
    
    EmployeManager employeManager = new EmployeManager();
    List<Employe> employes = employeManager.getAllEmployes();
    List<Employe> employees;
	
    // Si le paramètre de recherche n'est pas vide, effectuer une recherche filtrée
    if (keyword != null && !keyword.isEmpty()) {
   	  List<Employe> result = new ArrayList<>();
         // Parcourir la liste des employés
         for (Employe employe : employes) {
             // Vérifier si le nom de l'employé contient le mot-clé de recherche (en ignorant la casse)
             if (employe.getNom().toLowerCase().contains(keyword.toLowerCase()) || employe.getPrenom().toLowerCase().contains(keyword.toLowerCase())) {
                 // Si oui, ajouter cet employé aux résultats de la recherche
                 result.add(employe);
             }
         }
         employees = result;
    } else {
        // Sinon, charger tous les employés
        employees = null;
    }
%>

<table>
	<ul>
        <% if(employees != null){ for (Employe employe : employees) { %>
            <li class="employee" data-id="<%= employe.getCodeempl() %>/<%= employe.getPrenom() %>/ <%= employe.getNom()%>">
		        <%= employe.getCodeempl()%> <%= employe.getPrenom() %> <%= employe.getNom()%>
		    </li>
        <% }} %>
    </ul>
</table>
