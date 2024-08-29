package com.bitc.common.advice;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect // AOP annotation 기반의 Advice class 임을 명시
@Component	// 로그 출력하는 걸 확인한 뒤 지우고 싶다면 Component만 주석처리 해주면 됨
public class BoardAdvice {

	public BoardAdvice() {
		log.info("logger Board Advice");
	}
	
	// 문자열에 지정된 패턴에 따라서 Target, JoinPoints 지정
	@Before("execution(* com.bitc.*.service.*.*(..))")
	public void startLog(JoinPoint jp) {
		log.info("=============================================");
		log.info("============== Start Log =================");
		// com.bitc.board.service.BoardServiceImpl
		log.info("target : " + jp.getTarget());
		// method constructor
		log.info("type : " + jp.getKind());
		// 실행된 method 이름
		log.info("name : " + jp.getSignature().getName());
		// 매개변수에 전달되는 인자값
		Object[] args = jp.getArgs();
		log.info("arguments : " + Arrays.toString(args));
		log.info("=========== END  Start Log ===============");
	}
	
	// BoardVO read(int bno)
	@After("execution(com.bitc.board.vo.BoardVO com.bitc.board.service.BoardServiceImpl.read(int))")
	public void endReadLog(JoinPoint jp) {
		log.info("===============END AFTER LOG================");
		log.info("name : " + jp.getTarget() + jp.getSignature().getName());
		log.info("==============END AFTER LOG=================");
	}
	
	
}









