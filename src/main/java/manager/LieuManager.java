package manager;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import bean.Lieu;
import util.HiberanteUtil;

public class LieuManager {
	public void ajoutLieu(String design, String province) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Lieu e = new Lieu();
            e.setDesignation(design);
            e.setProvince(province);
            session.save(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public void supLieu(int id) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Lieu e = new Lieu();
            e.setCodelieu(id);
            session.delete(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public void modifLieu(int id, String design, String province) {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Lieu e = new Lieu();
            e.setCodelieu(id);
            e.setDesignation(design);
            e.setProvince(province);
            session.update(e);
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
    public List<Lieu> getAllLieus() {
        Session session = HiberanteUtil.getSessionFactory().openSession();
        try {
            Query query = session.createQuery("FROM Lieu");
            System.out.println(query);
            return query.list();
        } finally {
            session.close();
        }
    }
}
