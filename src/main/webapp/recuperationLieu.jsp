<%@ page import="java.util.List" %>
<%@ page import="bean.Lieu" %>
<%@ page import="manager.LieuManager" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Récupérer le paramètre de recherche
    String keyword = request.getParameter("keyword");
    
	LieuManager lieuManager = new LieuManager();
    List<Lieu> lieux = lieuManager.getAllLieus();
    List<Lieu> lieus;
	
    // Si le paramètre de recherche n'est pas vide, effectuer une recherche filtrée
    if (keyword != null && !keyword.isEmpty()) {
   	  List<Lieu> result = new ArrayList<>();
         // Parcourir la liste des employés
         for (Lieu employe : lieux) {
             // Vérifier si le nom de l'employé contient le mot-clé de recherche (en ignorant la casse)
             if (employe.getDesignation().toLowerCase().contains(keyword.toLowerCase())|| employe.getProvince().toLowerCase().contains(keyword.toLowerCase())) {
                 // Si oui, ajouter cet employé aux résultats de la recherche
                 result.add(employe);
             }
         }
         lieus = result;
    } else {
        // Sinon, charger tous les employés
        lieus = null;
    }
%>

<table>
 	
    <ul>
        <% if(lieus != null){for (Lieu lieu : lieus) { %>
            <li class="lieu" data-id="<%= lieu.getCodelieu() %>/ <%= lieu.getDesignation() %> (<%= lieu.getProvince() %>)">
		        <%= lieu.getCodelieu() %> <%= lieu.getDesignation() %> (<%= lieu.getProvince() %>)
		    </li>
        <% }}%>
    </ul>
</table>
