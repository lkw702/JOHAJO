package spring.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FoodDto;
import spring.data.ReservationDto;
import spring.service.FoodService;
@Controller
public class ReservationResultController {
	@Autowired
	private FoodService food_service;
	
	ReservationDto dto=new ReservationDto();
	@RequestMapping("/reservation.do")
	   public ModelAndView resresultview(HttpServletRequest session,@RequestParam int month,@RequestParam int day,@RequestParam String store,
			   @RequestParam String time,@RequestParam String sit,@RequestParam int fidx,@RequestParam String course,@RequestParam(required=false) String se_nmname){
		   ModelAndView model=new ModelAndView();
		   
		   String id=(String)session.getAttribute("log_idx");
		   int midx=Integer.parseInt(id);
		   Calendar cal =Calendar.getInstance();
		   int year=cal.get(Calendar.YEAR)%100;
		   
		   dto.setRem(midx);
		   String date=day+"/"+month+"/"+year;
		   dto.setResdate(date);
		   dto.setStore(store);
		   dto.setRestime(time);
		   dto.setRestable(sit);
		   dto.setFsingle(fidx);
		   
		   return model;
	   }
	@RequestMapping("/reservationfin.do")
	 public ModelAndView resfinsh(HttpServletRequest session,@RequestParam int nsid){
		ModelAndView model =new ModelAndView();
		String id=(String)session.getAttribute("nsid");
		
		return model;
	}
	
}
