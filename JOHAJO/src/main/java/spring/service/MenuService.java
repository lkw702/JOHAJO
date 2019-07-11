package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.MenuDao;
import spring.data.MenuDto;

@Service
public class MenuService {
	@Autowired
	private MenuDao dao;
	
	
	public List<MenuDto> getData()
	{
		return dao.getData();
	}
	
	public List<MenuDto> getDataSel(int kind)
	{
		return dao.getDataSel(kind);
	}
	public List<MenuDto> getDataIdx(int idx)
	{
		return dao.getDataSel(idx);
	}
	
	public List<MenuDto> getDataList(int kind, int idx)
	{
		return dao.getDataList(kind, idx);
	}
}
