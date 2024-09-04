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

@MultipartConfig
public class JoinAction implements Action {

	private final static String DEFAULTIMAGEPATH="default.jpg";
	private final static String PATH="D:\\KIM\\workspace02\\day039\\src\\main\\webapp\\images\\";

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String mid=request.getParameter("mid");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String imagepath=DEFAULTIMAGEPATH;

		MemberDAO memberDAO=new MemberDAO();
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setMid(mid);
		memberDTO.setPassword(password);
		memberDTO.setName(name);
		memberDTO.setImagepath(imagepath);

		Part file=null;
		try {
			file=request.getPart("imagefile");
		} catch (Exception e) {
			e.printStackTrace();
		}
		imagepath=Paths.get(file.getSubmittedFileName()).getFileName().toString();
		if(!imagepath.isEmpty()) { // 사용자가 이미지를 등록했다면,
			System.out.println("로그 : 이미지 업로드 시작");

			// 이미지 업로드 로직
			File uploadFile=new File(new File(PATH), imagepath);
			try (InputStream input = file.getInputStream();
					FileOutputStream output = new FileOutputStream(uploadFile)) {
				byte[] buffer = new byte[1024];
				int length;
				while ((length = input.read(buffer)) > 0) {
					output.write(buffer, 0, length);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}

			memberDTO.setImagepath(imagepath);

			System.out.println("로그 : 이미지 업로드 끝");
		}

		boolean flag = memberDAO.insert(memberDTO);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(flag) {
			forward.setPath("main.do");
		}
		else {
			forward.setPath("joinPage.do");
		}
		return forward;
	}

}
