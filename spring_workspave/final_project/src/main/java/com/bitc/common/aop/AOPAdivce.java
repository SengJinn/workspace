package com.bitc.common.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

// 사용 후 컴포넌트 주석처리 하기 
@Aspect
@Component
@Slf4j
public class AOPAdivce {

	@Around("execution(* com.bitc.FP.*.controller.*.*(..))")
	public Object controllerLog(ProceedingJoinPoint pjp) throws Throwable {
		log.info("-----------------------------------------------");
		log.info("---------- Around Controller START ------------");
		log.info("Around Controller Target : " + pjp.getTarget());
		log.info("Around method name : " + pjp.getSignature().getName());
		log.info("Around Arguments : " + Arrays.toString(pjp.getArgs()));
		// 실행 시점을 직접 제어할 수 있다
		// target class의 pointcut method 호출
		Object obj = pjp.proceed();

		if (obj != null) {
			log.info("Around return Object : " + obj);
		}

		log.info("---------- Around Controller END ------------");

		return obj; // 결과 반환 후 후처리 종료
	}

	@Around("execution(* com.bitc.FP.*.service.*.*(..))")
	public Object serviceLog(ProceedingJoinPoint pjp) throws Throwable {
		log.info("-----------------------------------------------");
		log.info("---------- Around Service START ------------");
		log.info("Around Service Target : " + pjp.getTarget());
		log.info("Around method name : " + pjp.getSignature().getName());
		log.info("Around Arguments : " + Arrays.toString(pjp.getArgs()));
		// 실행 시점을 직접 제어할 수 있다
		// target class의 pointcut method 호출
		Object obj = pjp.proceed();

		if (obj != null) {
			log.info("Around return Object : " + obj);
		}

		log.info("---------- Around Service END ------------");

		return obj; // 결과 반환 후 후처리 종료
	}

} // end AOPAdivce class
