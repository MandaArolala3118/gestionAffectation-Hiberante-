package manager;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import bean.Employe;
import util.HiberanteUtil;

public class EmployeManager {
    public void ajoutEmploye(String nom, String prenom, String poste) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Employe e = new Employe();
            e.setNom(nom);
            e.setPrenom(prenom);
            e.setPoste(poste);
            session.save(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public void supEmploye(int id) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Employe e = new Employe();
            e.setCodeempl(id);
            session.delete(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public void modifEmploye(int id, String nom, String prenom, String post) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Employe e = new Employe();
            e.setCodeempl(id);
            e.setNom(nom);
            e.setPrenom(prenom);
            e.setPoste(post);
            session.update(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public List<Employe> getAllEmployes() {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            Query query = session.createQuery("FROM Employe");
            System.out.println(query);
            return query.list();
        } finally {
            session.close();
        }
    }
   
}
