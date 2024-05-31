package practice_04;

public class Car {
	
	String color;
	public int speed;
	int gear;
	
	void changeGear(int gear) {
		this.gear = gear;
	}

	public void speedUp() {
		this.speed += 10;
	}

	public void speedDown() {
		this.speed -= 10;
	}


	// alt + s , v
//	@Override public String toString() {return "Car[ color= "+this.color+"]";}
	
	// alt +s , s , s
	@Override
	public String toString() {
		return "Car [color=" + color + ", speed=" + speed + ", gear=" + gear + "]";
	}
	
	
	
}
