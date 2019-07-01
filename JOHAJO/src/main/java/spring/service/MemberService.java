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


}
