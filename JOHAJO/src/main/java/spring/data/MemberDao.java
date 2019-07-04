package spring.data;

import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDao  extends SqlSessionDaoSupport{

	public void memberInsert(MemberDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("memberInsert",dto);
	}

	public int memberIdCheck(String id) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberIdCheck",id);
	}


	public MemberDto userLoginByIdandPW(Map<String, String> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("memberLogin",map);
	}

	public MemberDto selectUserId(Map<String, String> map) {
		// TODO Auto-generated method stub
		
		return getSqlSession().selectOne("selectUserId",map);
	}

	public MemberDto selectUserPw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectUserPw",map);
	}
}
