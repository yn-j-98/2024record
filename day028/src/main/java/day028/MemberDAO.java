package day028;

import java.util.ArrayList;

public class MemberDAO {

	private ArrayList<MemberDTO> datas;
	
	public MemberDAO() {
		this.datas=new ArrayList<MemberDTO>();
		System.out.println("로그");
	}

	public boolean insert(MemberDTO memberDTO) {
		// 회원가입
		this.datas.add(memberDTO);
		return true;
	}
	private boolean update(MemberDTO memberDTO) {
		return false;
	}
	private boolean delete(MemberDTO memberDTO) {
		return false;
	}
	public ArrayList<MemberDTO> selectAll(MemberDTO memberDTO){
		return this.datas;
	}
	public MemberDTO selectOne(MemberDTO memberDTO) {
		for(MemberDTO data:datas) {
			if(data.getMid().equals(memberDTO.getMid())
					&& data.getPassword().equals(memberDTO.getPassword())) {
				return data;
			}
		}
		return null;
	}


}
