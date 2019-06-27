package spring.controller;

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
	
	@RequestMapping("/storelist.do")
	public String form()
	{
		return "/store/storeForm";
	}
	
	@RequestMapping("/storeget.do")
	public ModelAndView list(@RequestParam int num) {
		
		ModelAndView model=new ModelAndView();
	
		StoreDto dto=service.getData(num);
		  
	 	model.addObject("dto",dto);
		model.setViewName("/store/storeList");
		return model;
	}
}
