package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.StoreDao;

@Service
public class StoreService {
	@Autowired
	private StoreDao dao;
	
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
}
