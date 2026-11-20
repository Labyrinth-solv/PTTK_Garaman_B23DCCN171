package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Service1;

public class ServiceDAO1 extends DAO1 {

	// Tim cac dich vu co ten chua tu khoa
	public ArrayList<Service1> getServicesByName(String key) {
		ArrayList<Service1> list = new ArrayList<>();
		String sql = "SELECT * FROM tblService1 WHERE name LIKE ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + key + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(toService(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Lay chi tiet 1 dich vu theo id
	public Service1 getServiceDetail(int id) {
		String sql = "SELECT * FROM tblService1 WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return toService(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// Dong goi 1 dong ket qua thanh doi tuong Service1
	private Service1 toService(ResultSet rs) throws Exception {
		Service1 s = new Service1();
		s.setId(rs.getInt("id"));
		s.setName(rs.getString("name"));
		s.setType(rs.getString("type"));
		s.setDescription(rs.getString("description"));
		s.setPrice(rs.getFloat("price"));
		s.setDuration(rs.getInt("duration"));
		s.setTargetVehicle(rs.getString("targetVehicle"));
		return s;
	}
}
