package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.QnaDao;
import spring.data.QnaDto;

@Service
public class QnaService {
	@Autowired
	private QnaDao dao;
	
	public int QnaTotalCount() {
		// TODO Auto-generated method stub
		return dao.QnaTotalCount();
	}

	public List<QnaDto> QnaSelectList(int idx) {
		// TODO Auto-generated method stub
		return dao.QnaSelectList(idx);
	}

	public void myqnaInsert(QnaDto dto) {
		// TODO Auto-generated method stub
		dao.myQnaInsert(dto);
	}

	public int qnaMaxIdx() {
		// TODO Auto-generated method stub
		return dao.qnaMaxIdx();
	}
}
