package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.data.CourseDao;
import spring.data.CourseDto;


@Service
public class CourseService {
	@Autowired
	private CourseDao dao;
	
	public CourseDto getData(String course_name)
	{
		return dao.getData(course_name);
	}
	
	public CourseDto getCourseData(int idx)
	{
		return dao.getCourseData(idx);
	}
	
}
