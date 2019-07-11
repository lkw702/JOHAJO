package spring.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository //xml에 자동 등록
public class MenuDao extends SqlSessionDaoSupport {
	
	
	
	public List<MenuDto> getData()
	{
		return getSqlSession().selectList("menuSelect");
	}
	
	public List<MenuDto> getDataSel(int kind)
	{
		return getSqlSession().selectList("menuSelectList",kind);
	}
	public List<MenuDto> getDataIdx(int idx)
	{
		return getSqlSession().selectList("menuSelectIdx",idx);
	}
	
	public List<MenuDto> getDataList(int kind, int idx)
	{
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("kind", kind);
		map.put("idx", idx);
		
		return getSqlSession().selectList("menuSelectTwo",map);
	}
}
