package model;

import java.util.Date;
import java.util.ArrayList;

public class ImportInvoice1 {
	private int id;
	private Date createdDate;
	private Date paymentDate;
	private String status;
	private String note;
	private Supplier1 supplier;
	private WarehouseEmployee1 warehouseEmployee;
	private ArrayList<ImportDetail1> importDetail = new ArrayList<>();

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	public Date getCreatedDate() { return createdDate; }
	public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }
	public Date getPaymentDate() { return paymentDate; }
	public void setPaymentDate(Date paymentDate) { this.paymentDate = paymentDate; }
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	public String getNote() { return note; }
	public void setNote(String note) { this.note = note; }
	public Supplier1 getSupplier() { return supplier; }
	public void setSupplier(Supplier1 supplier) { this.supplier = supplier; }
	public WarehouseEmployee1 getWarehouseEmployee() { return warehouseEmployee; }
	public void setWarehouseEmployee(WarehouseEmployee1 warehouseEmployee) { this.warehouseEmployee = warehouseEmployee; }
	public ArrayList<ImportDetail1> getImportDetail() { return importDetail; }
	public void setImportDetail(ArrayList<ImportDetail1> importDetail) { this.importDetail = importDetail; }
}
