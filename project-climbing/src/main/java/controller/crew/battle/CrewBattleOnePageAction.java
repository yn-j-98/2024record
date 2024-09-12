package controller.crew.battle;

import java.util.ArrayList;

import controller.common.Action;
import controller.common.ActionForward;
import controller.function.LoginCheck;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.battle_record.Battle_recordDAO;
import model.battle_record.Battle_recordDTO;

public class CrewBattleOnePageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String path = "CrewBattleContent.jsp";
		boolean flagRedirect = false;

		/*
		 * 크루전 상세 페이지 이동
		 * 뷰에게서 view_battle_num을 받아옵니다.
		 * battle_record DTO와 DAO를 생성
		 * DTO에 battle_record_battle_num을 set
		 * 크루전 내용을 위해 selectOne
		 * 컨디션은 BATTLE_RECORD_ONE_BATTLE
		 * 
		 * DTO를 따로 하나 더 파서
		 * DTO에 battle_record_battle_num을 set
		 * 크루전 참가 크루를 위해 selectAll
		 * 컨디션은 BATTLE_RECORD_ALL_PARTICIPANT_CREW
		 */
		
		// 로그인,크루 정보가 있는지 확인

		String login[] = LoginCheck.Success(request, response);
		//사용자 아이디
		String member_id = login[0];
		//사용자 크루 정보
		int crew_num = Integer.parseInt(login[1]);
		
		int view_battle_num = Integer.parseInt(request.getParameter("view_battle_num"));
		Battle_recordDTO battle_recordDTO = new Battle_recordDTO(); 
		Battle_recordDAO battle_recordDAO = new Battle_recordDAO();

		battle_recordDTO.setModel_battle_record_battle_num(view_battle_num);
		battle_recordDTO.setModel_battle_record_condition("BATTLE_RECORD_ONE_BATTLE");//크루전 내용 컨디션
		battle_recordDTO = battle_recordDAO.selectOne(battle_recordDTO);
		
		
		
		Battle_recordDTO datas = new Battle_recordDTO();
		
		datas.setModel_battle_record_battle_num(view_battle_num);
		datas.setModel_battle_record_condition("BATTLE_RECORD_ALL_PARTICIPANT_CREW");
		ArrayList<Battle_recordDTO> model_battle_record_datas = battle_recordDAO.selectAll(datas);
		
		request.setAttribute("model_battle_record_datas", model_battle_record_datas);
		request.setAttribute("model_battle_record", battle_recordDTO);
		
		
		forward.setPath(path);
        forward.setRedirect(flagRedirect);
		return forward;
	}

}
