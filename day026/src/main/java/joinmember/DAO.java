package joinmember;

import java.util.ArrayList;

public class DAO {
	ArrayList<DTO> datas;

	public DAO() {
		this.datas = new ArrayList<DTO>();
		DTO data1 = new DTO();
		data1.setId("teemo");
		data1.setPassword("1234");
		this.datas.add(data1);
		DTO data2 = new DTO();
		data2.setId("ari");
		data2.setPassword("333");
		this.datas.add(data2);
	}

	public boolean insert(DTO dto) { // 회원가입
		DTO data = new DTO();
		data.setId(dto.getId());
		data.setPassword(dto.getPassword());
		datas.add(data);
		return true;
	}

	public DTO selectOne(DTO dto) { // 아이디 , 비밀번호 중복검사
		// ▼ 아이디 중복검사
		if(dto.getCondition().equals("IS_UNIQUE")) {
			for(DTO data:this.datas) {
				if(data.getId().equals(dto.getId())) {
					return data;
				}
			}
		}
		return null;
	}
}


