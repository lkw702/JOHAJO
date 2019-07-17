package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository //xml에 자동 등록
public class AllergyDao extends SqlSessionDaoSupport {
	
	
	
	public List<AllergyDto> getData()
	{
		return getSqlSession().selectList("allergySelect");
	}
	
}
