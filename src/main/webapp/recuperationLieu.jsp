<%@ page import="java.util.List" %>
<%@ page import="bean.Lieu" %>
<%@ page import="manager.LieuManager" %>
<%@ page import="java.util.ArrayList" %>

<%
    // R�cup�rer le param�tre de recherche
    String keyword = request.getParameter("keyword");
    
	LieuManager lieuManager = new LieuManager();
    List<Lieu> lieux = lieuManager.getAllLieus();
    List<Lieu> lieus;
	
    // Si le param�tre de recherche n'est pas vide, effectuer une recherche filtr�e
    if (keyword != null && !keyword.isEmpty()) {
   	  List<Lieu> result = new ArrayList<>();
         // Parcourir la liste des employ�s
         for (Lieu employe : lieux) {
             // V�rifier si le nom de l'employ� contient le mot-cl� de recherche (en ignorant la casse)
             if (employe.getDesignation().toLowerCase().contains(keyword.toLowerCase())|| employe.getProvince().toLowerCase().contains(keyword.toLowerCase())) {
                 // Si oui, ajouter cet employ� aux r�sultats de la recherche
                 result.add(employe);
             }
         }
         lieus = result;
    } else {
        // Sinon, charger tous les employ�s
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
