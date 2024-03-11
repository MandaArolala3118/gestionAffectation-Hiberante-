<%@ page import="java.util.List" %>
<%@ page import="bean.Employe" %>
<%@ page import="manager.EmployeManager" %>
<%@ page import="java.util.ArrayList" %>

<%
    // R�cup�rer le param�tre de recherche
    String keyword = request.getParameter("keyword");
    
    EmployeManager employeManager = new EmployeManager();
    List<Employe> employes = employeManager.getAllEmployes();
    List<Employe> employees;
	
    // Si le param�tre de recherche n'est pas vide, effectuer une recherche filtr�e
    if (keyword != null && !keyword.isEmpty()) {
   	  List<Employe> result = new ArrayList<>();
         // Parcourir la liste des employ�s
         for (Employe employe : employes) {
             // V�rifier si le nom de l'employ� contient le mot-cl� de recherche (en ignorant la casse)
             if (employe.getNom().toLowerCase().contains(keyword.toLowerCase()) || employe.getPrenom().toLowerCase().contains(keyword.toLowerCase())) {
                 // Si oui, ajouter cet employ� aux r�sultats de la recherche
                 result.add(employe);
             }
         }
         employees = result;
    } else {
        // Sinon, charger tous les employ�s
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
