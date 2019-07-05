package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.StoreDto;
import spring.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	
	@RequestMapping("/storeData.do")
	public ModelAndView getData(@RequestParam int idx) 
	{
		ModelAndView model=new ModelAndView();
		
		StoreDto dto=service.getData(idx);
		
		model.addObject("dto",dto);
		model.setViewName("/store/storeData");
		return model;
	}

	@RequestMapping("/storelist.do")
	public ModelAndView getlist()

	{
		ModelAndView model=new ModelAndView();


		int totalCount=service.getTotalCount();

		List<StoreDto> list=service.getList();
		
		System.out.println("이거 찍히냐");
		
		//3. 페이징에 필요한 변수들 request에 저장		
		model.addObject("list", list);
		model.addObject("totalCount",totalCount);
		model.setViewName("/store/storeList");
		
		return model;
	}
}
