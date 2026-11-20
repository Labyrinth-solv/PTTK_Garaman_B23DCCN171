package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.SparePartPerService1;

public class SparePartPerServiceDAO1 extends DAO1 {

	// Lay cac phu tung (kem so luong) dung trong 1 dich vu
	public ArrayList<SparePartPerService1> getSparePartsByService(int serviceId) {
		ArrayList<SparePartPerService1> list = new ArrayList<>();
		String sql = "SELECT sps.quantity, sp.* FROM tblSparePartPerService1 sps "
				+ "JOIN tblSparePart1 sp ON sp.id = sps.tblSparePart1id "
				+ "WHERE sps.tblService1id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, serviceId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				SparePartPerService1 sps = new SparePartPerService1();
				sps.setQuantity(rs.getInt("quantity"));
				sps.setSparePart(SparePartDAO1.toSparePart(rs));
				list.add(sps);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
