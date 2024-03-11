<%@ page import="java.util.List" %>
<%@ page import="bean.Lieu" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lieu</title>
    <link rel="stylesheet" href="style.css">
<script>
//Variable globale pour stocker les données des employés
var lieuData = [];

// Fonction pour récupérer les données lors du chargement de la page
window.onload = function() {
    loadData(); // Charge les données
};

function loadData() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Mettez à jour la table avec les données reçues
            var tableBody = document.getElementById("lieuTableBody");
            tableBody.innerHTML = xhr.responseText;

            // Après avoir chargé les données, récupérez-les du tableau
            getLieuData();
        }
    };
    xhr.open("POST", "${pageContext.request.contextPath}/AfficheLieu", true);
    xhr.send();
}

function getLieuData() {
    // Sélectionner le corps du tableau
    var tableBody = document.querySelector('tbody');

    // Sélectionner toutes les lignes du tableau
    var rows = tableBody.querySelectorAll('tr');

    // Parcourir chaque ligne du tableau
    rows.forEach(function(row) {
        // Sélectionner toutes les cellules de la ligne
        var cells = row.querySelectorAll('td');
        
        // Créer un objet pour stocker les données de l'employé actuel
        var lieux = {
            code: cells[0].textContent.trim(),
            Designation: cells[1].textContent.trim(),
            Province: cells[2].textContent.trim(),
        };
        
        // Ajouter les données de l'employé à notre tableau d'employés global
        lieuData.push(lieux);
    });

}



</script>
</head>

<body id="lieuTableBody">
    <div id="body">
        <div id="header">
            <div class="listeMenu">
                <a class="buttonMenu" href="index.jsp">Employé</a>
                <a class="buttonMenu" href="lieuAffectation.jsp">Lieu</a>
                <a class="buttonMenu"  href="affectation.jsp">Affectation</a>
            </div>
            <div class="research">
                <input class="inputSearch" type="text" placeholder="Rechercher un lieu" id="searchInput"  onkeypress="filterTable()">
            </div>
        </div>
        <div id="Lieu">
            <div id="lieuContent">
                <p class="titlePage">
                    Liste des lieux d'affectation
                </p>
                <table>
                	<thead>
	                    <tr>
	                        <th class="codeTable">
	                            Code lieu
	                        </th>
	                        <th class="designTable">
	                            Designation
	                        </th>
	                        <th class="provTable">
	                            Province
	                        </th>
	                        <th></th>
	                    </tr>
                	</thead>
			        <tbody>
			            <% List<Lieu> lieux = (List<Lieu>) request.getAttribute("lieux");
			               if (lieux != null) {
			                   for (Lieu lieu : lieux) { %>
			                      <tr id="showSearck<%= lieu.getCodelieu() %>">
			                        <td><%= lieu.getCodelieu() %></td>
			                        <td><%= lieu.getDesignation() %></td>
			                        <td><%= lieu.getProvince() %></td>                 
			                        <td class="buttonTable">
			                            <button class="modifyButton" onclick="valeurModiferEmployer('<%=lieu.getCodelieu()%>','<%=lieu.getDesignation()%>','<%=lieu.getProvince()%>')">Modifier</button>
			                            <button class="deleteButton" onclick="supPopPup('<%=lieu.getCodelieu()%>')">Supprimer</button>
			                        </td>
			                    </tr>
			                   <% }
			               } else {
			                   out.println("Aucun lieu disponible.");
			               }
			            %>
			        </tbody>
                </table>
            </div>
            <div id="lieuAjout">
                <div class="titleAdd">Ajouter un lieu</div>
                <form class="inputLabelList"  action="${pageContext.request.contextPath}/AjoutLieu" method="post">
                    <label >Designation<span class="obligate">*</span> :</label><input placeholder="ex: Tanambao"  name="Designation" required><br>
                    <label>Province<span class="obligate">*</span>  :</label><input placeholder="ex: Fianarantsoa" name="Province" required>
                    <input type="submit" value="Ajouter"  class="addButton" style="width : 200%;">
                </form>
            </div>

        </div>
    </div>
    <!--div id="validationDiv">
        Lorem ipsum dolor, sit amet consectetur adipisicing elit.
    </div-->
    <div id="modify">
        <div class="modifyContent">
            <div class="titleAdd">Modifier un lieu</div>
            <div class="exit" onclick="hiddeDiv('modify')"><div class="x"></div><div class="y"></div></div>
                    <p class="codeEmployeeTitle">Code lieu : <span id="codeLieuModif"></span> </p>
            <form class="buttonConfirmation" action="${pageContext.request.contextPath}/ModificationLieu" method="post" >
          		<input type="hidden" name="id" id="codeLieuMod" > 
          		<div class="inputLabelList">
                    <label >Designation<span class="obligate">*</span> :</label><input placeholder="ex: Tanambao"  name="Designation" id="designationToModify" required>
                    <label>Province<span class="obligate">*</span>  :</label><input placeholder="ex: Fianarantsoa" name="Province" id="provinceToModify" required>
            	</div>
          		<button class="addButton" type="submit">Modifier</button>
          	</form>
        </div>
    </div>
    <div id="deleteConfirmation">
        <div class="deleteConfirmationContent">
            <div class="exit" onclick="hiddeDiv('deleteConfirmation')"><div class="x"></div><div class="y"></div></div>
            <p>Voulez-vous supprimer réèlement <span id="afficheiD"></span>?</p>
               	<form class="buttonConfirmation" action="${pageContext.request.contextPath}/LieuSuppression" method="post">
               		<input type="hidden" name="id" id="idToSup" >
                	<button class="cancelButton"  onclick="hiddeDiv('deleteConfirmation')">Annuler</button>
               		<button class="confirmeButton" type="submit">Confirmer</button>
               	</form>
        </div>
    </div>
    <script>

    	function supPopPup(id){
    		document.getElementById("afficheiD").innerText = id;
    		document.getElementById("idToSup").value = id;
    		document.getElementById("deleteConfirmation").style.display = "block";    		
    	}
    	function hiddeDiv(idDiv){
    		document.getElementById(idDiv).style.display = "none"; 
    	}
    	function showDiv(idDiv){
    		document.getElementById(idDiv).style.display = "table-row"; 
    	}
    	function valeurModiferEmployer(id, designation, province){
    		document.getElementById("codeLieuModif").innerText = id;
    		document.getElementById("codeLieuMod").value = id;
    		document.getElementById("designationToModify").value = designation;
    		document.getElementById("provinceToModify").value = province;
    		document.getElementById("modify").style.display = "block";  
    	}
    	function filterTable() {// Récupérer la valeur saisie dans le champ de recherche
    	
    	    var filterValue = document.getElementById("searchInput").value.trim().toUpperCase();
    		console.log(filterValue)
    		console.log(lieuData)
			if(filterValue === ""){
	    		for (code in lieuData){
	    			console.log(lieuData[code]["code"])
	    			showDiv("showSearck"+lieuData[code]["code"])
	    		}
			}
			else{
	    	    // Filtrer les données des employés en fonction de la valeur saisie
	    	     var filteredLieu = lieuData.filter(function(lieux) {
			        return !(
			        		lieux.code.toUpperCase().includes(filterValue) || 
			        		lieux.Designation.toUpperCase().includes(filterValue) || 
			        		lieux.Province.toUpperCase().includes(filterValue)
			        );
			    });

	    	    // Mettre à jour le tableau avec les données filtrées
	    	    updateTable(filteredLieu);
			}
    	}

    	function updateTable(lieux) {
    		for (code in lieux){
    			console.log(lieuData[code]["code"])
    			hiddeDiv("showSearck"+lieuData[code]["code"])
    		}
    	}
    </script>
</body>
</html>