package extends5_polymorphism.methods;

// 탈것 클래스
class Vehicle{
	
	public void run() {
		System.out.println("탈것이 달립니다.");
	}
	
}

class Taxi extends Vehicle{
	@Override
	public void run() {
		System.out.println("택시가 승객을 모시고 달립니다.");
	}
	
}

class MotorCycle extends Vehicle{
	public void run() {
		System.out.println("오토바이가 두바퀴로 달립니다.");
	}
	
}


class Bus extends Vehicle{
	public void run() {
		System.out.println("버스가 다수의 승객을 태우고 달립니다.");
	}
	
}

public class VehicleExample {
	
//	public static void runVehicle(Taxi taxi) {
//		taxi.run();
//	}
//	
//	public static void runVehicle(MotorCycle mc) {
//		mc.run();
//	}
		public static void runVehicle(Vehicle vehicle) {
		vehicle.run();
	}
		
	public static void main(String[] args) {
		Vehicle taxi = new Taxi();
		runVehicle(taxi);
		Vehicle mc = new MotorCycle();
		runVehicle(mc);
		Vehicle bus = new Bus();
		runVehicle(bus); 
		// 하위 클래스로 타입 제한
		// runVehicle("자동차");
	}

}