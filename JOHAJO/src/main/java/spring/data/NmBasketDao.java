package spring.data;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class NmBasketDao extends SqlSessionDaoSupport{
	public int getMaxNMCount(){
		return getSqlSession().selectOne("nmMaxBasketCount");
	}
	public int getnMembercount(){
		return getSqlSession().selectOne("nmBasketCount");
	}
	public void nmemberInsert(Map<String, Integer> map){
		getSqlSession().insert("nmBasketInsert",map);
	}
	public int getnmInsertCheck(Map<String, Integer> map){
		return getSqlSession().selectOne("nmBasketCheck",map);
	}
	public void nmemberUpdate(Map<String, Integer> map){
		getSqlSession().insert("nmBasketupdate",map);
	}
	
	public int nmBasketCount(int nmidx){
		return getSqlSession().selectOne("nmBasketC",nmidx);
	}
}
