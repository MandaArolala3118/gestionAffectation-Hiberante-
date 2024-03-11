package test;
import util.HiberanteUtil;
import manager.LieuManager;

public class EmployeTest {
	public static void main(String[] args) {
		LieuManager employe = new LieuManager();
		employe.ajoutLieu("manda", "manda");
		HiberanteUtil.sessionFactory.close();
		System.out.println(employe);
	}
}