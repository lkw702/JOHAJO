package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;






import spring.data.MenuDto;
import spring.service.MenuService;


@Controller
public class MenuController {
	@Autowired
	public MenuService service;
	
	
	@RequestMapping("/menulist.do")
	public ModelAndView list(){
		ModelAndView model=new ModelAndView();
		List<MenuDto> list=service.getData();
		model.addObject("list",list);
		
		model.setViewName("/menu/menuList_sel");
		return model;
	}
	
	/*@RequestMapping(value={"/menusel.do"},method={RequestMethod.GET})
	public ModelAndView MenuSelect(@RequestParam int kind)
	{
		ModelAndView model = new ModelAndView();
		List<MenuDto> list=service.getDataSel(kind);
		model.addObject("list",list);
		model.setViewName("/menu/menuList_list");
		return model;
	}*/
	
	@RequestMapping(value={"/menusel.do"},method={RequestMethod.GET})
	public ModelAndView MenuSelect(@RequestParam int kind)
	{
		ModelAndView model = new ModelAndView();
		List<MenuDto> list=service.getDataSel(kind);
		model.addObject("list",list);
		model.setViewName("/menu/menuList_list");
		return model;
	}
	@RequestMapping(value={"/menusel1.do"},method={RequestMethod.GET})
	public ModelAndView MenuSelectIdx(@RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		List<MenuDto> list=service.getDataIdx(idx);
		model.addObject("list",list);
		model.setViewName("/menu/menuList_list2");
		return model;
	}
	
	@RequestMapping(value={"/menusellist.do"},method={RequestMethod.GET})
	public ModelAndView MenuSelectList(@RequestParam int kind, @RequestParam int idx)
	{
		ModelAndView model = new ModelAndView();
		List<MenuDto> list=service.getDataList(kind, idx);
		model.addObject("list",list);
		model.setViewName("/menu/menuList_list2");
		return model;
		
	}

}
