package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.StoreDao;
import spring.data.StoreDto;

@Service
public class StoreService {
	@Autowired
	private StoreDao dao;
	
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
	public StoreDto getData(int num)
	{
		return dao.getData(num);
	}
	public List<StoreDto> getList()
	{
		return dao.getList();
	}
}
