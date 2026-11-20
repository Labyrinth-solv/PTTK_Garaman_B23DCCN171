package dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import model.ImportDetail1;

public class ImportDetailDAO extends DAO1 {

	// Luu tung dong chi tiet cua hoa don nhap
	public boolean saveImportDetails(ArrayList<ImportDetail1> list) {
		String sql = "INSERT INTO tblImportDetail1(importPrice, quantity, tblImportInvoice1id, tblSparePart1id) "
				+ "VALUES (?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			for (ImportDetail1 d : list) {
				ps.setFloat(1, d.getImportPrice());
				ps.setInt(2, d.getQuantity());
				ps.setInt(3, d.getImportInvoice().getId());
				ps.setInt(4, d.getSparePart().getId());
				ps.executeUpdate();
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
