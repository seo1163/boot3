package com.iu.boot3.aop;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Payment {
	
	@Around("execution(* com.iu.boot3.aop.Transfer.*())")
	public Object chekcCard(ProceedingJoinPoint joinPoint) throws Throwable {
		//join point 핵시 로직 메서드(bus, subway)
		System.out.println("탑승전 카드 체크");
		
		Object obj = joinPoint.proceed();
		
		System.out.println("하차시 카드 체크");
		
		return obj;
	}
	

	
	
	@AfterReturning("execution(* com.iu.boot3.aop.Transfer.*())")
	public void cardCheck() {
		System.out.println("======== 카드 체크 =============");
	};
	
	@Before("execution(* com.iu.boot3.board.BoardService.get*(..))")
	public void before() {
		System.out.println("==== SELECT ====");
	}
	
	@After("execution(* com.iu.boot3.board.BoardService.get*(..))")
	public void after() {
		System.out.println("AfterReturnin + afetReturning");
	}
	
	@AfterReturning("execution(* com.iu.boot3.aop.Transfer.*())")
	public void afetReturning() {
		System.out.println("afetReturning");
	};
	
	@AfterThrowing("execution(* com.iu.boot3.aop.Transfer.*())")
	public void afterThrowing() {
		System.out.println("afterThrowing");
	};
	
	/*@Around("execution(* com.iu.boot3.aop.Transfer.*())")
	public void around() {
		System.out.println("Before + Around");
	};*/

}
