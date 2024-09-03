package controller.common;

import java.util.ArrayList;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import model.common.Crawling;
import model.dao.BoardDAO;
import model.dto.BoardDTO;

@WebListener
public class SampleListener implements ServletContextListener {
   
    public SampleListener() {
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	// 웹 서버 구동(실행)시 한번 수행될 코드 부분
    	System.out.println("로그 : 리스너에서 웹 서버 구동(실행) 을 감지함");
    	
    	// 샘플 데이터 DB에 저장하는 코드
    	ArrayList<BoardDTO> datas = Crawling.makeSample();
    	BoardDAO boardDAO = new BoardDAO();
    	/*
    	for(BoardDTO data : datas) {
    		boardDAO.insert(data);
    	}
    	*/
    }
    

    public void contextDestroyed(ServletContextEvent sce)  { 
    	// 웹 서버 종료시 한번 수행될 코드 부분
    	
    	// EX) DB 연결 해제
    }
	
}
