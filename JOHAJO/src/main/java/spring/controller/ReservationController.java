package spring.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FoodDto;
import spring.data.StoreDto;
import spring.service.FoodService;
import spring.service.StoreService;

@Controller
public class ReservationController {
	  @Autowired
	  private StoreService service;
	  @Autowired
	  private FoodService fservice;
	  
	  Calendar cal=Calendar.getInstance();
      int currentMonth=cal.get(Calendar.MONTH);
      int year=cal.get(Calendar.YEAR);
      int month=(cal.get(Calendar.MONTH));
      int today=cal.get(Calendar.DATE);
      int lastday=cal.getActualMaximum(cal.DAY_OF_MONTH);
      int week=cal.get(Calendar.DAY_OF_WEEK);
      List<FoodDto> list2=new Vector<FoodDto>();
      
      
   @RequestMapping("/reslist.do")
   public ModelAndView ReservationList() {
      ModelAndView model = new ModelAndView();
      List<StoreDto> list=new ArrayList<StoreDto>();
	  list=service.getList();
	  model.addObject("list",list);
      cal.set(year,month,1);
      //System.out.println(year+"/"+month);
      //System.out.println(week);
      model.addObject("currentMonth",currentMonth);
      model.addObject("year",year);
      model.addObject("month",month+1);
      model.addObject("today",today);
      model.addObject("lastday",lastday);
      model.addObject("week",week);
      model.setViewName("/res/reservationList");
      return model;
   }
   @RequestMapping("/reslist2.do")
   public String ReservationList2(HttpServletRequest req)throws Exception {
      month++;
      if(month==11){
    	  month=1;
    	  year++;
      }
      cal.set(year,month,1);
      week=cal.get(Calendar.DAY_OF_WEEK);
      System.out.println(week);
      cal.set(year, month, 0);
      lastday=cal.getActualMaximum(cal.DAY_OF_MONTH);
      
      return "redirect:/reslist.do";
      
   }
   @RequestMapping("/reslist3.do")
   public String ReservationList3(HttpServletRequest req)throws Exception {
      month--;
      if(month<1){
    	  month=11;
    	  year--;
      }
      cal.set(year,month,1);
      week=cal.get(Calendar.DAY_OF_WEEK);
      cal.set(year, month, 0);
      lastday=cal.getActualMaximum(cal.DAY_OF_MONTH);
      return "redirect:/reslist.do";
   }
   
   @RequestMapping("/resAppetizer.do")
   public ModelAndView app(@RequestParam int kind)
   {
     System.out.println(kind+"컨트롤러");
      ModelAndView model=new ModelAndView();
      System.out.println("컨트롤러"+kind);
      List<FoodDto> list=new Vector<FoodDto>();
      list=fservice.getKindFood(kind);
      System.out.println("리스트");
      model.addObject("list",list);
      model.setViewName("/res/resApp");
      return model;
   }
   @RequestMapping("/resAppetizer2.do")
   public ModelAndView app2(@RequestParam int idx)
   {
      System.out.println("여기는 오냐"+idx);
      ModelAndView model=new ModelAndView();
      System.out.println("컨트롤러"+idx);
      FoodDto dto=new FoodDto();
      dto=fservice.getOneFood(idx);
      list2.add(dto);
      System.out.println("리스트");
      model.addObject("list",list2);
      model.setViewName("/res/resApp");
      return model;
   }
}