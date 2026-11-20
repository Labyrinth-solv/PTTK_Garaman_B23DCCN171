package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Supplier1;

public class SupplierDAO extends DAO1 {

	// Tim cac nha cung cap co ten chua tu khoa
	public ArrayList<Supplier1> getSupplierByName(String key) {
		ArrayList<Supplier1> list = new ArrayList<>();
		String sql = "SELECT * FROM tblSupplier1 WHERE name LIKE ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + key + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Supplier1 s = new Supplier1();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setAddress(rs.getString("address"));
				s.setPhoneNumber(rs.getString("phoneNumber"));
				list.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Luu nha cung cap moi, gan id vua sinh vao doi tuong
	public boolean saveNewSupplier(Supplier1 s) {
		String sql = "INSERT INTO tblSupplier1(name, address, phoneNumber, email) VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, s.getName());
			ps.setString(2, s.getAddress());
			ps.setString(3, s.getPhoneNumber());
			ps.setString(4, s.getEmail());
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				s.setId(rs.getInt(1));
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
