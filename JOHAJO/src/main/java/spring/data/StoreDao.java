package spring.data;


import java.util.ArrayList;
import java.util.List;

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
	public List<StoreDto> getAllData()
	{
		List<StoreDto> list=new ArrayList<StoreDto>();
		list=getSqlSession().selectList("storeGetAllData");
		return list;
	}
}
