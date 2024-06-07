package guide_answer.practice02;

import java.util.Objects;

/**
 * 국가별 수도 정보를 저장할 class
 */
public class Nation {
	
	/**
	 * 국가 이름
	 */
	private String country;
	
	/**
	 * 수도 이름
	 */
	private String capital;	
	
	
	public Nation(String country, String capital) {
		this.country = country;
		this.capital = capital;
	}
	
	public String getCountry() {
		return country;
	}

	public String getCapital() {
		return capital;
	}

	@Override
	public int hashCode() {
		return Objects.hash(capital, country);
	}

	@Override
	public boolean equals(Object obj) {
		// 매개변수로 전달된 Object obj 변수에 저장된 객체가
		// 비교할 수 있는 Nation 객체면
		// 국가 이름 정보가 일치하면 동등한 객체로 판별할 수 있도록 재정의
		if(obj instanceof Nation) {
			Nation n = (Nation)obj;
			if(this.country.equals(n.getCountry())) {
				return true;
			}
		}
		return false;
	}
}
