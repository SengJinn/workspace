
public class Car {
	String color;
	int speed;
	int gear;
	
	Car(){}
	
	Car(String color, int speed, int gear) {
		this.color = color;
		this.speed = speed;
		this.gear = gear;
	}
	
	void speedUp(){
		this.speed = speed + 10;
	}
	
	void speedDown(){
		this.speed = speed - 10;
	}
	
	String showInfo() {
		return "Car [color="+this.color+", speed=" + this.speed + ", gear=" + this.gear +" ]"; 
	}	
}

