package bean;
import javax.persistence.*;

@Entity
public class Lieu {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int codelieu;
	private String Designation;
	private String Province;
	
	public Lieu() {
		
	}
	
	public Lieu(int codelieu, String Designation, String Province) {
		this.codelieu=codelieu;
		this.Designation = Designation;
		this.Province = Province;
	}

	public void setCodelieu(int id) {
		this.codelieu = id;
	} 
	public void setDesignation(String design) {
		this.Designation = design;
	}
	public void setProvince(String prov) {
		this.Province = prov;
	}

	public int getCodelieu() {
		return this.codelieu;
	}
	public String getDesignation() {
		return this.Designation;
	}
	public String getProvince() {
		return this.Province;
	}
}
