package controller.common;

import java.io.IOException;

import controller.board.MainAction;
import controller.member.JoinAction;
import controller.member.LoginAction;
import controller.member.LogoutAction;
import controller.page.JoinPageAction;
import controller.page.LoginPageAction;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("*.do")
// 톰캣(server)이 구동될때, xxx.do로 끝나는 요청에 대하여 FC를 호출하게됨
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	private void doAction(HttpServletRequest request, HttpServletResponse response) {
		// 1. 사용자가 무슨 요청을 했는지 추출 및 확인
		String uri = request.getRequestURI();
		String cp=request.getContextPath();
		String command=uri.substring(cp.length());
		System.out.println("command : "+command);
		
		// 2. 요청을 수행
		ActionForward forward = null;
		if(command.equals("/main.do")) {
			MainAction mainAction = new MainAction();
			forward = mainAction.execute(request, response);
			
			// main.jsp 페이지로 이동
			
		}
		else if(command.equals("/login.do")) {
			LoginAction loginAction = new LoginAction();
			forward = loginAction.execute(request, response);
			
		}
		else if(command.equals("/loginPage.do")) {
			LoginPageAction loginPageAction = new LoginPageAction();
			forward = loginPageAction.execute(request, response);
		}
		else if(command.equals("/join.do")) {
			JoinAction joinAction = new JoinAction();
			forward = joinAction.execute(request, response);
			
		}
		else if(command.equals("/joinPage.do")) {
			JoinPageAction joinPageAction = new JoinPageAction();
			forward = joinPageAction.execute(request, response);
		}
		else if(command.equals("/logout.do")) {
			LogoutAction logoutAction = new LogoutAction();
			forward = logoutAction.execute(request, response);
			
		}
		// 3. 응답(페이지 이동 등)
					// 에러의 경우 .
					// 1. 에러액션
					// 2. forward가 널인경우
				// 1) 전달할 데이터가 있니? 없니 ? == 포워드 ? 리다이렉트 ?
				// 2) 어디로 갈까? == 경로
		
		
		if(forward == null) {
			// command 요청이 없는 경우
		}
		else {
			if(forward.isRedirect()){
				try {
					response.sendRedirect(forward.getPath());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				try {
					dispatcher.forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
		}
		
		
		
		// 어떤 회사의 코드를 뜯어봐도 흐름이 저럼 코드스타일, 변수명은 다를 수는 있어도 ,,,
		
	}

}
