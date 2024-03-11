package bean;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Lieu_ {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codelieu;
	private String Designation;
	private String Province;
	
	public Lieu_() {
		
	}
	
	public Lieu_(int codelieu, String Designation, String Province) {
		this.codelieu=codelieu;
		this.Designation = Designation;
		this.Province = Province;
	}

	public void setCodeLieu(int id) {
		this.codelieu = id;
	}
	public void setDesignation(String design) {
		this.Designation = design;
	}
	public void setProvince(String prov) {
		this.Province = prov;
	}

	public int getCodeLieu() {
		return this.codelieu;
	}
	public String getDesignation() {
		return this.Designation;
	}
	public String getProvince() {
		return this.Province;
	}

	
}
