package spring.data;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDao  extends SqlSessionDaoSupport{

	public int QnaTotalCount() {

		return getSqlSession().selectOne("QnaTotalCount");
	}

	public List<QnaDto> QnaSelectList(int idx) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("QnaSelectList",idx);
	}

	public void myQnaInsert(QnaDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("QnaDataInsert",dto);
	}

	public int qnaMaxIdx() {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("QnaMaxNum");
	}
	
	public void myqnaDelete(int idx) {
		// TODO Auto-generated method stub
		getSqlSession().delete("QnaDataDelete",idx);
	}


}
