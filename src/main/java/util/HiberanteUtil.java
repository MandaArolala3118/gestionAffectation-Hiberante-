package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.*;

public class HiberanteUtil {
	public static SessionFactory sessionFactory = null;
	
	static {
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		}catch(Throwable ex) {
			System.err.println("Creation de sessionFactory echouer. "+ ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
	
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}
