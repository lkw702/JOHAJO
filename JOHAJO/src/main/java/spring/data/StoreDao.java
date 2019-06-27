package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDao extends SqlSessionDaoSupport {
	
	public int getTotalCount() {
		int n=getSqlSession().selectOne("storeTotalCount");
		return n;
	}
	
	public StoreDto getData(int num)
	{
		StoreDto dto=getSqlSession().selectOne("storeGetData",num);
		return dto;
	}	
}
