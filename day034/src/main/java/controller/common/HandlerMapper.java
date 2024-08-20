package controller.common;

import java.util.HashMap;
import java.util.Map;

import controller.board.BoardAction;
import controller.board.MainAction;
import controller.member.JoinAction;
import controller.member.LoginAction;
import controller.member.LogoutAction;
import controller.page.BoardPageAction;
import controller.page.JoinPageAction;
import controller.page.LoginPageAction;

public class HandlerMapper { //핸들러맵핑을 통해 한번의 new를 다 해놓고 불러다 쓰는것
	private Map<String,Action> mapper;
	
	public HandlerMapper() {
		this.mapper = new HashMap<String, Action>();
		
		this.mapper.put("/main.do", new MainAction());
		this.mapper.put("/board.do", new BoardAction());
		this.mapper.put("/login.do", new LoginAction());
		this.mapper.put("/logout.do", new LogoutAction());
		this.mapper.put("/join.do", new JoinAction());
		this.mapper.put("/BoardPage.do", new BoardPageAction());
		this.mapper.put("/JoinPage.do", new JoinPageAction());
		this.mapper.put("/LoginPage.do", new LoginPageAction());
	}

//	public Map<String, Action> getMapper() {
//		return mapper;
//	}
//
//	public void setMapper(Map<String, Action> mapper) {
//		this.mapper = mapper;
//	}
	public Action getAction(String command) {
		return this.mapper.get(command);
	}
	
	
}
