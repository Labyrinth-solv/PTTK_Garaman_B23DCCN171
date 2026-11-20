package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.ImportDetail1;
import model.SparePart1;

public class SparePartDAO extends DAO1 {

	// Tim phu tung theo ten (dung lai ham cua module tim kiem)
	public ArrayList<SparePart1> getSparePartByName(String key) {
		return new SparePartDAO1().getSparePartsByName(key);
	}

	// Luu phu tung moi (ton kho ban dau = 0), gan id vua sinh vao doi tuong
	public boolean saveNewSparePart(SparePart1 sp) {
		String sql = "INSERT INTO tblSparePart1(name, type, brand, stock) VALUES (?, ?, ?, 0)";
		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, sp.getName());
			ps.setString(2, sp.getType());
			ps.setString(3, sp.getBrand());
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				sp.setId(rs.getInt(1));
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Cong so luong vua nhap vao ton kho cua tung phu tung
	public boolean increaseStock(ArrayList<ImportDetail1> list) {
		String sql = "UPDATE tblSparePart1 SET stock = stock + ? WHERE id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			for (ImportDetail1 d : list) {
				ps.setInt(1, d.getQuantity());
				ps.setInt(2, d.getSparePart().getId());
				ps.executeUpdate();
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
