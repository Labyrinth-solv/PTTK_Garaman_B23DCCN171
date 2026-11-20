package model;

public class Service1 {
	private int id;
	private String name;
	private String type;
	private String description;
	private float price;
	private int duration;
	private String image;
	private String targetVehicle;

	public int getId() { return id; }
	public void setId(int id) { this.id = id; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getType() { return type; }
	public void setType(String type) { this.type = type; }
	public String getDescription() { return description; }
	public void setDescription(String description) { this.description = description; }
	public float getPrice() { return price; }
	public void setPrice(float price) { this.price = price; }
	public int getDuration() { return duration; }
	public void setDuration(int duration) { this.duration = duration; }
	public String getImage() { return image; }
	public void setImage(String image) { this.image = image; }
	public String getTargetVehicle() { return targetVehicle; }
	public void setTargetVehicle(String targetVehicle) { this.targetVehicle = targetVehicle; }
}
