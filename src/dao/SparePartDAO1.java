package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.SparePart1;

public class SparePartDAO1 extends DAO1 {

	// Tim cac phu tung co ten chua tu khoa
	public ArrayList<SparePart1> getSparePartsByName(String key) {
		ArrayList<SparePart1> list = new ArrayList<>();
		String sql = "SELECT * FROM tblSparePart1 WHERE name LIKE ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + key + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(toSparePart(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Lay chi tiet 1 phu tung theo id
	public SparePart1 getSparePartDetail(int id) {
		String sql = "SELECT * FROM tblSparePart1 WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return toSparePart(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// Dong goi 1 dong ket qua thanh doi tuong SparePart1
	public static SparePart1 toSparePart(ResultSet rs) throws Exception {
		SparePart1 sp = new SparePart1();
		sp.setId(rs.getInt("id"));
		sp.setName(rs.getString("name"));
		sp.setType(rs.getString("type"));
		sp.setBrand(rs.getString("brand"));
		sp.setOrigin(rs.getString("origin"));
		sp.setSellingPrice(rs.getFloat("sellingPrice"));
		sp.setStock(rs.getInt("stock"));
		sp.setDescription(rs.getString("description"));
		sp.setWarrantyPeriod(rs.getInt("warrantyPeriod"));
		return sp;
	}
}
