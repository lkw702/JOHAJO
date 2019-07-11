package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.CourseDto;
import spring.service.CourseService;


@Controller
public class CourseController {
	@Autowired
	public CourseService service;
	
	/*@RequestMapping(value={"/menucourse.do"},method={RequestMethod.GET})
	public ModelAndView list(@RequestParam(value="course_name",defaultValue="A") String course_name){
		ModelAndView model=new ModelAndView();
		System.out.println("dd"+course_name);
		CourseDto dto=service.getData(course_name);
		model.addObject("dto",dto);
		model.setViewName("/menu/menuCourse");
		return model;
	}*/
	
	@RequestMapping(value={"/menucourse.do"},method={RequestMethod.GET})
	public ModelAndView list(@RequestParam(value="idx",defaultValue="4") int idx){
		ModelAndView model=new ModelAndView();
		CourseDto dto=service.getCourseData(idx);
		model.addObject("dto",dto);
		model.setViewName("/menu/menuCourse");
		return model;
	}
	
	
	

}
