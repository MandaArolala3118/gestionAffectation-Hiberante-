package bean;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Employe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int codeempl;
	private String Nom;
	private String Prenom;
	private String Poste;
	
	public Employe() {
		
	}
	
	public Employe(int id, String nom, String prenom, String poste) {
		this.codeempl=id;
		this.Nom = nom;
		this.Prenom = prenom;
		this.Poste = poste;
	}

	public void setCodeempl(int id) {
		this.codeempl = id;
	}
	public void setNom(String nom) {
		this.Nom = nom;
	}
	public void setPrenom(String prenom) {
		this.Prenom = prenom;
	}
	public void setPoste(String poste) {
		this.Poste = poste;
	}

	public int getCodeempl() {
		return this.codeempl;
	}
	public String getNom() {
		return this.Nom;
	}
	public String getPrenom() {
		return this.Prenom;
	}
	public String getPoste() {
		return this.Poste;
	}
	public String toString() {
		return "Employe [codeempl = " + codeempl + ", Nom = " + Nom + ", Prenom = " + Prenom + ", Poste = " + Poste + "]";
	}

	
}
