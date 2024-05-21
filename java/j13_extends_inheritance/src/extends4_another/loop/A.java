package extends4_another.loop;

// 순환 상속(circular inheritance) 문제
// A가 상위 인지, C가 상위인지, B가 상위인지 모호해짐.
// A class가 생성될때 C class 생성 
// C class가 생성될때 B class 생성
// B class가 생성될때 A class 생성
// A class가 생성될때 C class 생성
// 무한히 반복...
// java에서는 이런 문제가 발생하지 않도록 컴파일 시에 체크
public class A//  extends C
{

}
