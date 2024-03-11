<%@ page import="java.util.List" %>
<%@ page import="bean.Employe" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employe</title>
    <link rel="stylesheet" href="style.css">
<script>
//Variable globale pour stocker les donn�es des employ�s
var employesData = [];

// Fonction pour r�cup�rer les donn�es lors du chargement de la page
window.onload = function() {
    loadData(); // Charge les donn�es
};

function loadData() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Mettez � jour la table avec les donn�es re�ues
            var tableBody = document.getElementById("employeTableBody");
            tableBody.innerHTML = xhr.responseText;

            // Apr�s avoir charg� les donn�es, r�cup�rez-les du tableau
            getEmployeesData();
        }
    };
    xhr.open("POST", "${pageContext.request.contextPath}/AfficheEmployeServlet", true);
    xhr.send();
}

function getEmployeesData() {
    // S�lectionner le corps du tableau
    var tableBody = document.querySelector('tbody');

    // S�lectionner toutes les lignes du tableau
    var rows = tableBody.querySelectorAll('tr');

    // Parcourir chaque ligne du tableau
    rows.forEach(function(row) {
        // S�lectionner toutes les cellules de la ligne
        var cells = row.querySelectorAll('td');
        
        // Cr�er un objet pour stocker les donn�es de l'employ� actuel
        var employe = {
            code: cells[0].textContent.trim(),
            nom: cells[1].textContent.trim(),
            prenom: cells[2].textContent.trim(),
            poste: cells[3].textContent.trim()
        };
        
        // Ajouter les donn�es de l'employ� � notre tableau d'employ�s global
        employesData.push(employe);
    });

}



</script>
</head>

<body id="employeTableBody">
    <div id="body">
        <div id="header">
            <div class="listeMenu">
                <a class="buttonMenu" href="index.jsp">Employ�</a>
                <a class="buttonMenu" href="lieuAffectation.jsp">Lieu</a>
                <a class="buttonMenu"  href="affectation.jsp">Affectation</a>
            </div>
            <div class="research">
                <input class="inputSearch" type="text" placeholder="Rechercher un employ�" id="searchInput"  onkeyup="filterTable()">
            </div>
        </div>
        <div id="employee">
            <div id="employeeContent">
                <p class="titlePage">
                    Liste des employ�s
                </p>
                <table>
                	<thead>
	                    <tr>
	                        <th class="codeTable">
	                            Code
	                        </th>
	                        <th class="nameTable">
	                            Nom
	                        </th>
	                        <th class="lastNameTable">
	                            Prenom
	                        </th>
	                        <th class="postTable">
	                            Poste
	                        </th>
	                        <th class="buttonTable">
	        
	                        </th>
	                    </tr>
                	</thead>
			        <tbody>
			            <% List<Employe> employes = (List<Employe>) request.getAttribute("employes");
			               if (employes != null) {
			                   for (Employe employe : employes) { %>
			                      <tr id="showSearck<%= employe.getCodeempl() %>">
			                        <td><%= employe.getCodeempl() %></td>
			                        <td><%= employe.getNom() %></td>
			                        <td><%= employe.getPrenom() %></td>
			                        <td><%= employe.getPoste() %></td>                    
			                        <td class="buttonTable">
			                            <button class="modifyButton" onclick="valeurModiferEmployer('<%=employe.getCodeempl()%>','<%=employe.getNom()%>','<%=employe.getPrenom()%>','<%=employe.getPoste()%>')">Modifier</button>
			                            <button class="deleteButton" onclick="supPopPup('<%=employe.getCodeempl()%>')">Supprimer</button>
			                        </td>
			                    </tr>
			                   <% }
			               } else {
			                   out.println("Aucun employ� disponible.");
			               }
			            %>
			        </tbody>
                </table>
            </div>
            <div id="addContent">
                <div class="titleAdd">Ajouter un employ�</div>
                <form class="inputLabelList"  action="${pageContext.request.contextPath}/AjoutServlet" method="post">
                    <label >Nom<span class="obligate">*</span> :</label><input placeholder="ex: Duront"  name="nom" required>
                    <label>Prenom<span class="obligate">*</span>  :</label><input placeholder="ex: David" name="prenom" required>
                    <label>Poste<span class="obligate">*</span>  :</label><input placeholder="ex: Manager" name="poste" required>
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
            <div class="titleAdd">Modifier un employ�</div>
            <div class="exit" onclick="hiddeDiv('modify')"><div class="x"></div><div class="y"></div></div>
                    <p class="codeEmployeeTitle">Code de l'employ� : <span id="idEmployeModif"></span> </p>
            <form class="buttonConfirmation" action="${pageContext.request.contextPath}/ModifierEmploye" method="post">
          		<input type="hidden" name="id" id="idToModify" > 
          		<div class="inputLabelList">
	                <label >Nom<span class="obligate">*</span> : </label><input name="nom" placeholder="ex: Duront" id="nomEmployeModif" required>
	                <label>Prenom<span class="obligate">*</span> : </label><input name="prenom" placeholder="ex: David" id="prenomEmployeModif" required>
	                <label>Poste<span class="obligate">*</span> : </label><input  name="poste" placeholder="ex: Manager" id="postEmployeModif" required>
            	</div>
          		<button class="addButton" type="submit">Modifier</button>
          	</form>
        </div>
    </div>
    <div id="deleteConfirmation">
        <div class="deleteConfirmationContent">
            <div class="exit" onclick="hiddeDiv('deleteConfirmation')"><div class="x"></div><div class="y"></div></div>
            <p>Voulez-vous supprimer r��lement <span id="afficheiD"></span>?</p>
               	<form class="buttonConfirmation" action="${pageContext.request.contextPath}/SupprimerEmployer" method="post">
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
    	function valeurModiferEmployer(id, nom, prenom, poste){
    		document.getElementById("idEmployeModif").innerText = id;
    		document.getElementById("idToModify").value = id;
    		document.getElementById("nomEmployeModif").value = nom;
    		document.getElementById("prenomEmployeModif").value = prenom;
    		document.getElementById("postEmployeModif").value = poste;
    		document.getElementById("modify").style.display = "block";  
    	}
    	function filterTable() {// R�cup�rer la valeur saisie dans le champ de recherche
    	
    	    var filterValue = document.getElementById("searchInput").value.trim().toUpperCase();
			if(filterValue === ""){
	    		for (code in employesData){
	    			console.log(employesData[code]["code"])
	    			showDiv("showSearck"+employesData[code]["code"])
	    		}
			}
			else{
	    	    // Filtrer les donn�es des employ�s en fonction de la valeur saisie
	    	     var filteredEmployees = employesData.filter(function(employe) {
			        return !(
			            employe.code.toUpperCase().includes(filterValue) || 
			            employe.nom.toUpperCase().includes(filterValue) || 
			            employe.prenom.toUpperCase().includes(filterValue) || 
			            employe.poste.toUpperCase().includes(filterValue)
			        );
			    });

	    	    // Mettre � jour le tableau avec les donn�es filtr�es
	    	    updateTable(filteredEmployees);
			}
    	}

    	function updateTable(employees) {
    		for (code in employees){
    			console.log(employees[code]["code"])
    			hiddeDiv("showSearck"+employees[code]["code"])
    		}
    	}
    </script>
</body>
</html>