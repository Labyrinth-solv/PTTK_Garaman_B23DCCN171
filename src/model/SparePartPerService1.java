package model;

public class SparePartPerService1 {
	private int id;
	private int quantity;
	private SparePart1 sparePart;
	private Service1 service;

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	public int getQuantity() { return quantity; }
	public void setQuantity(int quantity) { this.quantity = quantity; }
	public SparePart1 getSparePart() { return sparePart; }
	public void setSparePart(SparePart1 sparePart) { this.sparePart = sparePart; }
	public Service1 getService() { return service; }
	public void setService(Service1 service) { this.service = service; }
}
