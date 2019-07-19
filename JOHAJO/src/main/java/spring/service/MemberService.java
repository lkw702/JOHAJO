package spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MemberDao;
import spring.data.MemberDto;
@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public void memberInsert(MemberDto dto) {
		dao.memberInsert(dto);
	}
	
	//join form id check
	public int memberIdCheck(String id) {
		return dao.memberIdCheck(id);
	}

	public MemberDto userLoginByIdandPW(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.userLoginByIdandPW(map);
	}

	
	public MemberDto selectUserId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectUserId(map);
	}

	public MemberDto selectUserPw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.selectUserPw(map);
	}

	

	public MemberDto getUserInfoByPass(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.userInfoByPass(map);
	}

	public int getUserCheckCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.getUserCheckCount(map);
	}

	public void memberUpdate(MemberDto dto) {
		dao.memberUpdate(dto);
	}

	public int usePoint(int idx) {
		return dao.usePoint(idx);
	}
	public int getUserIdx(String id){
		return dao.getUserIdx(id);
	}
}
