package bean; // Assurez-vous que le package est correct

import java.io.Serializable;

public class AffectationPrimaryKey implements Serializable {
    
    private int codeempl;
    private int codelieu;
    
    public AffectationPrimaryKey() {
    }
    
    // Getters and setters for codeempl
    public int getCodeempl() {
        return codeempl;
    }
    
    public void setCodeempl(int codeempl) {
        this.codeempl = codeempl;
    }
    
    // Getters and setters for codelieu
    public int getCodelieu() {
        return codelieu;
    }
    
    public void setCodelieu(int codelieu) {
        this.codelieu = codelieu;
    }
}
                          