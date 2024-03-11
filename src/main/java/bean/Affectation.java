package bean;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "AFFECTATION")
public class Affectation implements Serializable {

    @EmbeddedId
    private AffectationPrimaryKey primaryKey;

    @Column(name = "date")
    private String date;

    
    public Affectation() {
    }

    public Affectation(AffectationPrimaryKey primaryKey, String date) {
        this.primaryKey = primaryKey;
        this.date = date;
    }

    // Getters and setters for primaryKey
    public AffectationPrimaryKey getPrimaryKey() {
        return primaryKey;
    }

    public String getDate() {
        return date;
    }

    

    public void setPrimaryKey(AffectationPrimaryKey primaryKey) {
        this.primaryKey = primaryKey;
    }

    // Getters and setters for date
    

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Affectation{" +
                "primaryKey=" + primaryKey +
                ", date=" + date +
                '}';
    }
}
                          