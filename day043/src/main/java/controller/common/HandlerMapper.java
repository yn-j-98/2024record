package controller.common;

import java.util.HashMap;
import java.util.Map;

import controller.board.BoardAction;
import controller.board.MainAction;
import controller.member.JoinAction;
import controller.member.LoginAction;
import controller.member.LogoutAction;
import controller.page.JoinPageAction;
import controller.page.MypagePageAction;

public class HandlerMapper {
	private Map<String, Action> mapper;
	
	public HandlerMapper() {
		this.mapper = new HashMap<String,Action>();
		
		this.mapper.put("/main.do", new MainAction());
		this.mapper.put("/board.do", new BoardAction());
		this.mapper.put("/login.do", new LoginAction());
		this.mapper.put("/logout.do", new LogoutAction());
		this.mapper.put("/joinPage.do", new JoinPageAction());
		this.mapper.put("/mypagePage.do", new MypagePageAction());
		this.mapper.put("/join.do", new JoinAction());
	}

	public Action getAction(String command) {
		return mapper.get(command);
	}	
}
