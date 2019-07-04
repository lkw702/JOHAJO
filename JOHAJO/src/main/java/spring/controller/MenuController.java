package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MenuController {
	
	@RequestMapping("/menulist.do")
	public String MenuList(){
		return "/menu/menuList";//tiles name 반환
	}
	
	@RequestMapping("/menucourse.do")
	public String MenuCourse(){
		return "/menu/menuCourse";
	}
	
	@RequestMapping("/menuallergy.do")
	public String MenuAllergy(){
		return "/menu/menuAllergy";
	}

}
