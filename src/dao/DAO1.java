package dao;

import java.sql.Connection;
import java.sql.DriverManager;

// Lop cha cua moi DAO: tao 1 ket noi CSDL dung chung
public class DAO1 {
	public static Connection con;

	public DAO1() {
		if (con == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				// sua user/password cho dung voi MySQL tren may
				con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/garaman?useSSL=false&allowPublicKeyRetrieval=true&characterEncoding=UTF-8",
						"root", "1234");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
