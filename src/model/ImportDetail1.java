package model;

public class ImportDetail1 {
	private int id;
	private float importPrice;
	private int quantity;
	private SparePart1 sparePart;
	private ImportInvoice1 importInvoice;

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	public float getImportPrice() { return importPrice; }
	public void setImportPrice(float importPrice) { this.importPrice = importPrice; }
	public int getQuantity() { return quantity; }
	public void setQuantity(int quantity) { this.quantity = quantity; }
	public SparePart1 getSparePart() { return sparePart; }
	public void setSparePart(SparePart1 sparePart) { this.sparePart = sparePart; }
	public ImportInvoice1 getImportInvoice() { return importInvoice; }
	public void setImportInvoice(ImportInvoice1 importInvoice) { this.importInvoice = importInvoice; }
}
