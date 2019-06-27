package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
@Repository
public class StoreDao extends SqlSessionDaoSupport {
	
	@RequestMapping("storelist.do")
	public String getStoreList() {
		// TODO Auto-generated method stub
		return "store/storeList";
	}

	
	
	
}
