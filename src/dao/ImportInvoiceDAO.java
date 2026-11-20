package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;

import model.ImportInvoice1;

public class ImportInvoiceDAO extends DAO1 {

	// Luu hoa don nhap, gan id vua sinh vao doi tuong hoa don
	public boolean saveImportInvoice(ImportInvoice1 ii) {
		String sql = "INSERT INTO tblImportInvoice1(createdDate, paymentDate, status, tblSupplier1id, tblEmployee1id) "
				+ "VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setTimestamp(1, new Timestamp(ii.getCreatedDate().getTime()));
			ps.setTimestamp(2, new Timestamp(ii.getPaymentDate().getTime()));
			ps.setString(3, ii.getStatus());
			ps.setInt(4, ii.getSupplier().getId());
			ps.setInt(5, ii.getWarehouseEmployee().getId());
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				ii.setId(rs.getInt(1));
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
