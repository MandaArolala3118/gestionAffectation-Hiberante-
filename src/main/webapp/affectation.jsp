<%@ page import="java.util.List" %>
<%@ page import="bean.Affectation" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
    
    <link rel="stylesheet" href="style.css">
    <script>
    var affectationData = [];
    window.onload = function() {
    	loadEmployeeData(); // Charge les données
    	loadLieuData();
    	loadData();
    };

    function loadEmployeeData() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("employeeData").innerHTML = xhr.responseText;
            }
        };
        xhr.open("GET", "recuperationEmploye.jsp", true);
        xhr.send();
    }

    function saveEmployeeId(employeeId) {
        document.getElementById("selectedEmployeeId").value = employeeId;
    }
    function saveEmployeeData(dataEmploye) {
        document.getElementById("searchInputEmployee").value = dataEmploye;
    }

    function searchEmployee() {
        var keyword = document.getElementById("searchInputEmployee").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("employeeData").innerHTML = xhr.responseText;
            }
        };
        xhr.open("GET", "recuperationEmploye.jsp?keyword=" + keyword, true);
        xhr.send();
    }
    function searchEmployeeModify(){
    	var keyword = document.getElementById("searchInputEmployeeModify").value;
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            document.getElementById("employeeDataModify").innerHTML = xhr.responseText;
	        }
	    };
	    xhr.open("GET", "recuperationEmploye.jsp?keyword=" + keyword, true);
	    xhr.send();
    }
    function loadLieuData() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("lieuData").innerHTML = xhr.responseText;
            }
        };
        xhr.open("GET", "recuperationLieu.jsp", true);
        xhr.send();
    }
    function saveLieuId(lieuId) {
        document.getElementById("selectedLieuId").value = lieuId;
    }
    function saveLieuData(lieuData){
        document.getElementById("searchInputLieu").value = lieuData;
    }
    function searchLieu() {
        var keyword = document.getElementById("searchInputLieu").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("lieuData").innerHTML = xhr.responseText;
            }
        };
        xhr.open("GET", "recuperationLieu.jsp?keyword=" + keyword, true);
        xhr.send();
    }
    function searchLieuModify() {
        var keyword = document.getElementById("searchInputLieuModify").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                document.getElementById("lieuDataModify").innerHTML = xhr.responseText;
            }
        };
        xhr.open("GET", "recuperationLieu.jsp?keyword=" + keyword, true);
        xhr.send();
    }
    var employesData = [];
	
	
	
	 function loadData() {
	     var xhr = new XMLHttpRequest();
	     xhr.onreadystatechange = function() {
	         if (xhr.readyState === 4 && xhr.status === 200) {
	             // Mettez à jour la table avec les données reçues
	             var tableBody = document.getElementById("affectationTableBody");
	             tableBody.innerHTML = xhr.responseText;
	
	             // Après avoir chargé les données, récupérez-les du tableau
	             getAffecationData();
	         }
	     };
	     xhr.open("POST", "${pageContext.request.contextPath}/AfficheAffectation", true);
	     xhr.send();
	 }
	
	 function getAffecationData() {
	     // Sélectionner le corps du tableau
	     var tableBody = document.querySelector('tbody');
	
	     // Sélectionner toutes les lignes du tableau
	     var rows = tableBody.querySelectorAll('tr');
	
	     // Parcourir chaque ligne du tableau
	     rows.forEach(function(row) {
	         // Sélectionner toutes les cellules de la ligne
	         var cells = row.querySelectorAll('td');
	         
	         // Créer un objet pour stocker les données de l'employé actuel
	         var employe = {
	             nom: cells[0].textContent.trim(),
	             Poste: cells[1].textContent.trim(),
	             
	             Lieu: cells[2].textContent.trim(),
	             
	             date: cells[3].textContent.trim(),
	         };
	         
	         // Ajouter les données de l'employé à notre tableau d'employés global
	         affectationData.push(employe);
	         console.log(affectationData)
	     });
	
	 }
    </script>
</head>
<body id="affectationTableBody">
 <div id="body">
        <div id="header">
            <div class="listeMenu">
                <a class="buttonMenu" href="index.jsp">Employé</a>
                <a class="buttonMenu" href="lieuAffectation.jsp">Lieu</a>
                <a class="buttonMenu"  href="affectation.jsp">Affectation</a>
            </div>
            <div class="research">
                <input class="inputSearch" type="text" placeholder="Rechercher un employé" id="searchInput"  onkeyup="filterTable()">
            </div>
        </div>
        <div id="employee">
            <div id="employeeContent">
                <p class="titlePage">
                    Liste des affectation
                </p>
                <table>
                	<thead>
	                    <tr>
	                        <th class="nameTable">
	                            Employes
	                        </th>
	                        <th class="lastNameTable">
	                            Poste
	                        </th>
	                        <th class="lastNameTable">
	                            Lieux
	                        </th>
	                        <th class="postTable">
	                            Date d'affectation
	                        </th>
	                        <th class="buttonTable">
	        
	                        </th>
	                    </tr>
                	</thead>
                	 <tbody>
			            <% List<Object[]> affectations = (List<Object[]>) request.getAttribute("affectation");
			               if (affectations != null) {
			                   for (Object[] aff : affectations) { 	
			                	   String[] date = ((String) aff[7]).split("-");
			                	   %>
			                	   <tr id="showSearck<%out.print(aff[0]);%>_<%out.print(aff[4]); %>">
			                	   		<td><%out.print(aff[0]); %>-<%out.print(aff[1]); %> <%out.print(aff[2]); %></td>
			                	   		<td><%out.print(aff[3]); %></td>
			                	   		<td><%out.print(aff[4]); %>-<%out.print(aff[5]); %>(<%out.print(aff[6]); %>)</td>
			                	   		<td><%out.print(date[2] + "-" + date[1] + "-" + date[0]); %></td>
			                	   		<td class="buttonTable">
			                            <button class="modifyButton" onclick="valeurModiferAffectation('<%out.print(aff[0]); %>','<%out.print(aff[1]); %> <%out.print(aff[2]); %>','<%out.print(aff[4]); %>','<%out.print(aff[5]); %>(<%out.print(aff[6]); %>)', '<%out.print(aff[7]); %>')">Modifier</button>
			                            <button class="deleteButton" onclick="supPopPup('<%out.print(aff[0]); %>','<%out.print(aff[4]); %>')">Supprimer</button>
			                        </td>
			                	   </tr>
				                   	<%
				                   	
				                   	
			                   }
			               } else {
			                   out.println("Aucun employé disponible.");
			               }
			            %>
			        </tbody>
                </table>
            </div>
            <div id="addContent" style="width: 225px;">
                <div class="titleAdd">Ajouter une affectation</div>
  
                <form class="inputLabelList"  action="${pageContext.request.contextPath}/AjoutEffectation" method="post" style="padding: 10px;">
				    <label >Employe<span class="obligate">*</span> :<input type="text" id="searchInputEmployee" onkeyup="searchEmployee()" placeholder="Rechercher un employé..." required></label>
				    <div id="employeeData"  class="searchContent">
				        <!-- Les données des employés de employe.jsp seront chargées ici -->
				    </div>
				    <label style="margin-top:10px;">Lieu<span class="obligate">*</span>  :<input type="text" id="searchInputLieu" onkeyup="searchLieu()" placeholder="Rechercher un lieu" required></label>
				    <div id="lieuData"   class="searchContent">
				        <!-- Les données des employés de employe.jsp seront chargées ici -->
				    </div>
				    <label>Date<span class="obligate">*</span>  :<input type="date" name="date" required></label>
				    
				    <input type="hidden" id="selectedEmployeeId" placeholder="employe" name="codeEmpl" required>
				    <input type="hidden" id="selectedLieuId" name="codeLieu" required>
                    <input type="submit" value="Ajouter"  class="addButton" style="width : 200%;">
                </form>
            </div>

        </div>
    </div>
    <!--div id="validationDiv">
        Lorem ipsum dolor, sit amet consectetur adipisicing elit.
    </div-->
    <div id="modify">
        <div class="modifyContent" style="width: 250px;">
            <div class="titleAdd">Modifier une affectation</div>
            <div class="exit" onclick="hiddeDiv('modify')"><div class="x"></div><div class="y"></div></div>
            <form class="buttonConfirmation"  action="${pageContext.request.contextPath}/ModifierAffectation" method="post">
            	
			    <label >Employe<span class="obligate">*</span> :<input type="text" id="searchInputEmployeeModify" onkeyup="searchEmployeeModify()" placeholder="Rechercher un employé..." style="margin-top: 0px;" readonly></label>
			    <div id="employeeDataModify"  class="searchContent">
			        <!-- Les données des employés de employe.jsp seront chargées ici -->
			    </div>
			    <label>Lieu<span class="obligate">*</span>  :<input type="text" id="searchInputLieuModify" onkeyup="searchLieuModify()" placeholder="Rechercher un lieu" style="margin-top: 0px;" readonly></label>
			   
			    <label>Date<span class="obligate">*</span>  :<input type="date" name="date" id="dateModif" style="margin-top: 0px;" required></label>
			   
			    
			    <input type="hidden" id="selectedEmployeeIdModify" placeholder="employe" name="codeEmpl">
			    <input type="hidden" id="selectedLieuIdModify" name="codeLieu">
          		<button class="addButton" type="submit">Modifier</button>
          	</form>
        </div>
    </div>
    <div id="deleteConfirmation">
        <div class="deleteConfirmationContent">
            <div class="exit" onclick="hiddeDiv('deleteConfirmation')"><div class="x"></div><div class="y"></div></div>
            <p>Voulez-vous supprimer réèlement?</p>
               	<form class="buttonConfirmation" action="${pageContext.request.contextPath}/SupprimerAffectation" method="post">
               		<input type="hidden" name="codedlieu" id="idCodeLieuToSup" >
               		<input type="hidden" name="codeEmpl" id="idCodeEmplToSup" >
                	<button class="cancelButton"  onclick="hiddeDiv('deleteConfirmation')">Annuler</button>
               		<button class="confirmeButton" type="submit">Confirmer</button>
               	</form>
        </div>
    </div>


    <script>
		
		function supPopPup(codeempl, codelieu){
			document.getElementById("idCodeEmplToSup").value = codeempl;
			document.getElementById("idCodeLieuToSup").value = codelieu;
			document.getElementById("deleteConfirmation").style.display = "block";    		
		}
		function hiddeDiv(idDiv){
			document.getElementById(idDiv).style.display = "none"; 
		}
		function showDiv(idDiv){
			document.getElementById(idDiv).style.display = "table-row"; 
		}
		function valeurModiferAffectation(codeEmpl, nomPrenom, codelieu, desigationProv, date){

            document.getElementById("searchInputEmployeeModify").value = codeEmpl + " " + nomPrenom;
            document.getElementById("selectedEmployeeIdModify").value = codeEmpl;

            document.getElementById("searchInputLieuModify").value = codelieu +" "+ desigationProv;
            document.getElementById("selectedLieuIdModify").value = codelieu;
            
            document.getElementById("dateModif").value = date;
            
    		document.getElementById("modify").style.display = "block";  
		}
        document.addEventListener('click', function(event) {
        	var elModif = document.getElementById("modify");
        	var modifElem = window.getComputedStyle(elModif).getPropertyValue("display");
        	if (event.target && event.target.classList.contains('employee')  && modifElem === "none") {
                var dataEmployer = event.target.getAttribute('data-id');

                var tableDataEmployeRecu = dataEmployer.split("/");
                var employeeId = tableDataEmployeRecu[0]
                saveEmployeeId(employeeId);
                var textDataEmploye = tableDataEmployeRecu[0] + " " + tableDataEmployeRecu[1] + " " + tableDataEmployeRecu[2];
                
                saveEmployeeData(textDataEmploye);
                console.log(tableDataEmployeRecu);
                var keyword = null;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("employeeData").innerHTML = xhr.responseText;
                    }
                };
                xhr.open("GET", "recuperationEmploye.jsp?keyword=" + keyword, true);
                xhr.send();
            }
        	if (event.target && event.target.classList.contains('employee')  && modifElem === "block") {
                var dataEmployer = event.target.getAttribute('data-id');

                var tableDataEmployeRecu = dataEmployer.split("/");
                var employeeId = tableDataEmployeRecu[0]
                var textDataEmploye = tableDataEmployeRecu[0] + " " + tableDataEmployeRecu[1] + " " + tableDataEmployeRecu[2];

                document.getElementById("searchInputEmployeeModify").value = textDataEmploye;
                document.getElementById("selectedEmployeeIdModify").value = tableDataEmployeRecu[0];
                var keyword = null;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("employeeDataModify").innerHTML = xhr.responseText;
                    }
                };
                xhr.open("GET", "recuperationEmploye.jsp?keyword=" + keyword, true);
                xhr.send();
            }
        	if (event.target && event.target.classList.contains('lieu')  && modifElem === "none") {
       		 var dataLieu = event.target.getAttribute('data-id');

                var tableDataLieuRecu = dataLieu.split("/");
                var employeeId = tableDataLieuRecu[0]
                var lieuId = tableDataLieuRecu[0];
                saveLieuId(lieuId);
                var textDataLieu = tableDataLieuRecu[0] + " " + tableDataLieuRecu[1];
                
                saveLieuData(textDataLieu);
                var keyword = null;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("lieuData").innerHTML = xhr.responseText;
                    }
                };
                xhr.open("GET", "recuperationLieu.jsp?keyword=" + keyword, true);
                xhr.send();
           }
        	if (event.target && event.target.classList.contains('lieu')  && modifElem === "block") {
       		 var dataLieu = event.target.getAttribute('data-id');

                var tableDataLieuRecu = dataLieu.split("/");
                var employeeId = tableDataLieuRecu[0]
                var lieuId = tableDataLieuRecu[0];
                saveLieuId(lieuId);
                var textDataLieu = tableDataLieuRecu[0] + " " + tableDataLieuRecu[1];

                document.getElementById("searchInputLieuModify").value = textDataLieu;
                document.getElementById("selectedLieuIdModify").value = tableDataLieuRecu[0];
                var keyword = null;
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        document.getElementById("lieuDataModify").innerHTML = xhr.responseText;
                    }
                };
                xhr.open("GET", "recuperationLieu.jsp?keyword=" + keyword, true);
                xhr.send();
           }
        });

    	function filterTable() {// Récupérer la valeur saisie dans le champ de recherche

			console.log("filtre");
    	    var filterValue = document.getElementById("searchInput").value.trim().toUpperCase();
			if(filterValue === ""){
	    		var el = document.querySelectorAll('[id^="showSearck"]');
	    		el.forEach(function(e){
	    			e.style.display = "table-row"; 
	    		})
			}
			else{
	    	    // Filtrer les données des employés en fonction de la valeur saisie
	    	     var filteredEmployees = affectationData.filter(function(employe) {
			        return !(
			            employe.nom.toUpperCase().includes(filterValue) || 
			            employe.Poste.toUpperCase().includes(filterValue) || 
			            employe.Lieu.toUpperCase().includes(filterValue)|| 
			            employe.date.toUpperCase().includes(filterValue)
			        );
			    });

	 			console.log(affectationData)
	    	    // Mettre à jour le tableau avec les données filtrées
	    	    updateTable(filteredEmployees);
			}
    	}

    	function updateTable(employees) {
			console.log(employees)
    		for (code in employees){
    			console.log(employees[code]["code"])
    			var codeEmpl = employees[code]["nom"].split("-")[0]
    			var codeLieu = employees[code]["Lieu"].split("-")[0]
    			hiddeDiv("showSearck"+codeEmpl+"_"+codeLieu)
    		}
    	}

    	function hiddeDiv(idDiv){
    		document.getElementById(idDiv).style.display = "none"; 
    	}
    </script>
</body>
</html>
