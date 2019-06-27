package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	
	@RequestMapping("/storelist.do")
	public ModelAndView list() {
		
		ModelAndView model=new ModelAndView();
		
		int totalCount;
		
		totalCount=service.getTotalCount();
		
		model.addObject("totalCount",totalCount);
		model.setViewName("/store/storeList");
		return model;
	}
}
