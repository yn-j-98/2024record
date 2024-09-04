package controller.member;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Paths;

import controller.common.Action;
import controller.common.ActionForward;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.dao.MemberDAO;
import model.dto.MemberDTO;


// 파일 업로드를 처리할 수 있도록 설정하는 어노테이션
@MultipartConfig
//메서드 강제 오버라이딩을 위해 Action 인터페이스를 구현
public class JoinAction implements Action {

	// 기본 이미지 경로
	private final static String DEFAULTIMAGEPATH="default.jpg";
	// 이미지 디렉토리 경로 상수
	private final static String PATH="C:\\YN\\workspace02\\day039\\src\\main\\webapp\\images\\";

	
	// 요청을 처리하고 ActionForward 객체를 반환하는 execute 메서드
	// implements Action
	@Override
	// 회원가입 요청을 처리하기 위한 메서드
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 사용자가 입력한 정보를 추출
		String mid=request.getParameter("mid");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		// 기본 이미지 경로 설정
		String imagepath=DEFAULTIMAGEPATH;

		// db에 저장하기 위해 객체 생성
		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		// V에서 받아온 값 객체에 저장
		memberDTO.setMid(mid);
		memberDTO.setPassword(password);
		memberDTO.setName(name);
		memberDTO.setImagepath(imagepath);

		// 파일 업로드 처리를 위한 part 객체 선언
		Part file=null; //초기화
		try {
			// V에서 사용자로부터 받아온 이미지파일 추출
			file=request.getPart("imagefile");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 업로드된 파일 이름 추출
		imagepath=Paths.get(file.getSubmittedFileName()).getFileName().toString();
		if(!imagepath.isEmpty()) { // 사용자가 이미지를 등록했다면,
			System.out.println("로그 : 이미지 업로드 시작");

			// 이미지 업로드 로직
			File uploadFile=new File(new File(PATH), imagepath);
			try (InputStream input = file.getInputStream();
					FileOutputStream output = new FileOutputStream(uploadFile)) {
				byte[] buffer = new byte[1024]; // 파일 크기는 1024로 제한
				int length;
				// 파일을 버퍼 단위로 읽고 쓰기
				while ((length = input.read(buffer)) > 0) { // 읽은 바이트가 있다면
					// buffer 배열의 시작 인덱스 0에서부터 length까지 바이트를 파일에 기록
					output.write(buffer, 0, length);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}

			// 이미지 경로를 memberDTO에 설정
			memberDTO.setImagepath(imagepath);

			System.out.println("로그 : 이미지 업로드 끝");
		}

		// 회원가입 flag
		boolean flag = memberDAO.insert(memberDTO);

		// 페이지 전환을 위한 ActionForward 객체 생성
		ActionForward forward = new ActionForward();
		// 페이지 이동을 하므로 true 반환
		forward.setRedirect(true);
		if(flag) {// 회원가입을 성공했다면
			// 메인 페이지로 이동
			forward.setPath("main.do");
		}
		else { // 실패했다면
			// 다시 회원가입 페이지로 이동
			forward.setPath("joinPage.do");
		}
		return forward;
	}

}
