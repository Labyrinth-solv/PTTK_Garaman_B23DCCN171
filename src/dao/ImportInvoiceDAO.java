package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;

import model.ImportInvoice1;

public class ImportInvoiceDAO extends DAO1 {

	// Luu hoa don nhap, gan id vua sinh vao doi tuong hoa don
	public boolean saveImportInvoice(ImportInvoice1 invoice) {
		String sql = "INSERT INTO tblImportInvoice1(createdDate, paymentDate, status, tblSupplier1id, tblEmployee1id) "
				+ "VALUES (?, ?, ?, ?, ?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setDate(1, new Date(invoice.getCreatedDate().getTime()));
			ps.setDate(2, new Date(invoice.getPaymentDate().getTime()));
			ps.setString(3, invoice.getStatus());
			ps.setInt(4, invoice.getSupplier().getId());
			ps.setInt(5, invoice.getWarehouseEmployee().getId());
			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				invoice.setId(rs.getInt(1));
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
