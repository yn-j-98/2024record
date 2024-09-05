package controller.common;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;


//*.do URL 패턴에 매핑된 요청에 대해 이 필터가 적용됨
@WebFilter("*.do")
public class ValidFilter extends HttpFilter implements Filter {
      
    public ValidFilter() {
        super();
    }
    // 필터가 종료될 때 호출되는 메서드
	public void destroy() { 
		// 필터 종료 시 필요한 자원 정리 작업을 수행하는 코드 작성
	}
	
	// 요청과 응답을 처리하는 메서드
	// 필터 체인 내에서 다음 필터를 호출함
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("로그 : 필터가 호출됨");
		
		// 권한확인 로직
		// ServletRequest를 HttpServletRequest로 형변환하여 HTTP 요청의 세부 정보에 접근
		HttpServletRequest HttpRequest = (HttpServletRequest)request;
		// 요청 uri 가져오기
		String uri=HttpRequest.getRequestURI();
		// 경로 가져오기
		String cp=HttpRequest.getContextPath();
		String command=uri.substring(cp.length());
		// .do 로그 확인용
		System.out.println("command : "+command);
		
		
		// 명령어가 "/mypagePage.do"이고 세션에 로그인 정보가 없으면 예외를 발생시킴
		if(command.equals("/mypagePage.do")) { // 사용자가 /mypagePage.do 요청을 했다면
			if(HttpRequest.getSession().getAttribute("loginInfo") == null) { // 로그인을 안 했다면
				throw new NullPointerException(); // 예외 발생시키기
			}
		}
		
		
		/*
		if(사용자가 /mypagePage.do 요청을 했니?) {
			if(로그인'안'했니?) {
				에러페이지로 보내버리기
			}
		}
		*/
		
		chain.doFilter(request, response); // 다음 필터를 호출하는 역할
	}
	// 필터 초기화 메서드
	public void init(FilterConfig fConfig) throws ServletException { // 선언
	// 초기화 시 필요한 설정 작업 수행하는 코드 작성됨
	}
}
