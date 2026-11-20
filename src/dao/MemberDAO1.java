package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Member1;
import model.WarehouseEmployee1;

public class MemberDAO1 extends DAO1 {

	// Kiem tra dang nhap: dung thi tra ve thanh vien, sai thi tra ve null
	public Member1 checkLogin(String username, String password) {
		String sql = "SELECT m.*, e.position FROM tblMember1 m "
				+ "LEFT JOIN tblEmployee1 e ON e.tblMember1id = m.id "
				+ "WHERE m.username = ? AND m.password = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Member1 m;
				if ("warehouse".equals(rs.getString("position"))) {
					m = new WarehouseEmployee1(); // nhan vien kho
				} else {
					m = new Member1(); // khach hang
				}
				m.setId(rs.getInt("id"));
				m.setName(rs.getString("name"));
				m.setRole(rs.getString("role"));
				return m;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
