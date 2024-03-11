package manager;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import bean.Affectation;
import bean.AffectationPrimaryKey;
import util.HiberanteUtil;

public class AffectatinManager {
	public void ajoutAffectation(int idEmpl, int idLieu, String date) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Affectation e = new Affectation();
            AffectationPrimaryKey id = new AffectationPrimaryKey();
            id.setCodeempl(idEmpl);
            id.setCodelieu(idLieu);
            e.setPrimaryKey(id);
            e.setDate(date);
            session.save(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public void supAffectation(int idEmpl, int idLieu) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Affectation e = new Affectation();
            AffectationPrimaryKey id = new AffectationPrimaryKey();
            id.setCodeempl(idEmpl);
            id.setCodelieu(idLieu);
            e.setPrimaryKey(id);
            session.delete(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public void modifAffectation(int idEmpl, int idLieu, String date) {

        System.out.println("UpDate Affectation");
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Affectation e = new Affectation();
            AffectationPrimaryKey id = new AffectationPrimaryKey();
            id.setCodeempl(idEmpl);
            id.setCodelieu(idLieu);
            e.setPrimaryKey(id);
            e.setDate(date);
            System.out.println(e.getPrimaryKey().getCodeempl());
            System.out.println(e.getPrimaryKey().getCodelieu());
            System.out.println(id.getCodeempl());
            System.out.println(id.getCodelieu());
            session.update(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public List<Object[]> getAllAffectations() {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
        	System.out.println("AFfectation");
        	
            Query query = session.createSQLQuery("SELECT Employe.codeempl as codeempl, Employe.nom as nom,Employe.prenom as prenom, Employe.poste as poste,Lieu.codelieu as codelieu, Lieu.designation as designation, Lieu.province as province, Affectation.date as date FROM  Employe, Lieu, Affectation where Employe.codeempl = Affectation.codeempl and Lieu.codelieu = Affectation.codelieu");
            System.out.println(query);
            System.out.println(query.list());
            return query.list();
        } finally {
            session.close();
        }
    }
}
