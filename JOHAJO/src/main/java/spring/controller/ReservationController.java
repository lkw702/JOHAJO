package spring.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.FoodDto;
import spring.data.ReservationDto;
import spring.data.StoreDto;
import spring.data.TableDto;
import spring.service.FoodService;
import spring.service.MemberService;
import spring.service.StoreService;
import spring.service.TableService;

import javax.servlet.http.HttpSession;

@Controller
public class ReservationController {
	  @Autowired
	  private StoreService service;
	  @Autowired
	  private FoodService fservice;
	  @Autowired
	  private TableService tservice;
	  @Autowired
	  private MemberService mservice;
	  int year2=0;
	  int n=0;
      List<FoodDto> list2=new ArrayList<FoodDto>();
      
	  
      
   @RequestMapping("/reslist.do")
   public ModelAndView ReservationList() {
      ModelAndView model = new ModelAndView();
      List<StoreDto> list=new ArrayList<StoreDto>();
      list=service.getList();
      model.addObject("list",list);
      model.setViewName("/res/reservationList");
      return model;
   }
   @RequestMapping(value="/reslist2.do",method=RequestMethod.GET)
   public ModelAndView ReservationList2(HttpServletRequest req,@RequestParam int month)throws Exception {
	   Calendar cal=Calendar.getInstance();
	   int currentMonth=cal.get(Calendar.MONTH);
	   int year=cal.get(Calendar.YEAR);
	   if(n==0){
		   year2=cal.get(Calendar.YEAR);
		   n++;
	   }
	   int today=0;
	   today=cal.get(Calendar.DATE);
	   int week=cal.get(Calendar.DAY_OF_WEEK);
	   cal.set(year2, currentMonth, today+90);
	   
	   int lastmonth=cal.get(Calendar.MONTH);
	   int lastmday=cal.get(Calendar.DATE);
	   
	   System.out.println("마지막달"+cal.get(Calendar.MONTH));
	   System.out.println("마지막날"+cal.get(Calendar.DATE));
	   int mon=month;
	   
	   System.out.println(year2);
	   ModelAndView model = new ModelAndView();
	  //month++;
      if(mon<0){
    	  mon=11;
    	  year2--;
      }
	  if(mon>11){
    	  mon=0;
    	  year2++;
      }
//      for(int i=1;i<=lastday;i++){
//    	  day.add(i);
//      }
//      model.addObject("day",day);
      cal.set(year2,mon,1);
      week=cal.get(Calendar.DAY_OF_WEEK);
      int lastday=cal.getActualMaximum(cal.DAY_OF_MONTH);
      System.out.println(week);
      cal.set(year2, mon, 0);
      System.out.println(year2);
      System.out.println(lastday);
      model.addObject("lastmonth",lastmonth);
      model.addObject("lastmday",lastmday);
      model.addObject("currentMonth",currentMonth+1);
      model.addObject("currentyear",year);
      model.addObject("year",year2);
      model.addObject("today",today);
      model.addObject("lastday",lastday);
      model.addObject("month",mon+1);
      model.addObject("week",week);
      model.setViewName("/res/resCal");
      return model;
      
   }
   @RequestMapping(value="/resAppetizer.do",method=RequestMethod.GET)
   public ModelAndView app(@RequestParam int kind)
   {
      ModelAndView model=new ModelAndView();
      List<FoodDto> list=null;
      System.out.println("kind="+kind);
      list=fservice.getKindFood(kind);
      model.addObject("list",list);
      model.setViewName("/res/resApp");
      System.out.println("데이터 2");
      return model;
   }
   @RequestMapping("/resAppetizer2.do")
   public ModelAndView app2(@RequestParam int idx,@RequestParam String name,HttpServletRequest req)throws Exception
   {
	  System.out.println("이곳1");
      ModelAndView model=new ModelAndView();
      FoodDto dto=new FoodDto();
      dto=fservice.getOneFood(idx);
      //System.out.println(count);
      
      //if(count==1){
    	 // model.addObject("count", count+1);
    	  //System.out.println("이곳3");
      list2.add(dto);
      //}
      model.addObject("list",list2);
      model.setViewName("/res/resApp");
      return model;
   }
   @RequestMapping(value="/resAppetizer3.do",method=RequestMethod.GET)
   public ModelAndView app3(@RequestParam int idx,HttpServletRequest req)throws Exception
   {
	
	  System.out.println(idx);
      ModelAndView model=new ModelAndView();
      list2.remove(idx);
      
      System.out.println("3");
      int size = list2.size();
      System.out.println(size);
      if(size==0){
    	  req.setAttribute("size", size);
    	  model.setViewName("redirect:/reslist.do");
      }else{
    	  req.setAttribute("size", size);
    	  model.addObject("list",list2);
    	  model.setViewName("/res/resApp");
      }
      return model;
   }
   @RequestMapping("/resAppetizer4.do")
   public ModelAndView app4(){
	   ModelAndView model=new ModelAndView();
	   model.addObject("list",list2);
	   model.setViewName("/res/resApp");
	   
	   return model;
   }
   @RequestMapping("/resAppetizer5.do")
   public ModelAndView app5(HttpSession session,@RequestParam int hmonth,@RequestParam int hday,
		   @RequestParam(value="hstore") String hstore,@RequestParam(value="htime") String htime,@RequestParam(value="hsit") String hsit,
		   @RequestParam(value="hfname", required=true) String hfname,@RequestParam int hprice,@RequestParam(value="hcourse", required=true,defaultValue ="0") String hcourse){
	   ModelAndView model=new ModelAndView();
	   list2.clear();
	   System.out.println(hmonth+" "+hday);
	   System.out.println(hstore+" "+htime);
	   System.out.println(hsit+" "+hday);
	   System.out.println(hfname);
	   System.out.println(hprice);
	  
	   System.out.println(hcourse);
	   model.addObject("hmonth",hmonth);
	   model.addObject("hday",hday);
	   model.addObject("hstore",hstore);
	   model.addObject("htime",htime);
	   model.addObject("hsit",hsit);
	   model.addObject("hfname",hfname);
	   model.addObject("hprice",hprice);
	   model.addObject("hcourse",hcourse);
	   int id=(Integer) session.getAttribute("log_idx");
	   System.out.println("idx="+id);
	   //int sid=Integer.parseInt(id);
	   int point = mservice.usePoint(id);
	   System.out.println("point="+point);
	   model.addObject("point",point);
	   model.setViewName("/res/reservationResult");
	   return model;
	   
	   
	   
   }
  
   @RequestMapping("/reservation.do")
   public ModelAndView resresultview(HttpServletRequest session,@RequestParam int month,@RequestParam int day,@RequestParam String store,
		   @RequestParam String time,@RequestParam String sit,@RequestParam String fname,@RequestParam int price,@RequestParam String course){
	   ModelAndView model=new ModelAndView();
	   ReservationDto dto=new ReservationDto();
	   String id=(String)session.getAttribute("log_idx");
	   int midx=Integer.parseInt(id);
	   dto.setRem(midx);
	   String date=month+"/"+day;
	   Date d=Date.valueOf(date);
	   dto.setResdate(d);
	   dto.setStore(store);
	   dto.setRestime(time);
	   dto.setRestable(sit);
	   dto.setFsingle(fname);
	   dto.setTotalprice(price);
	   String[] cou=course.split(",");
	   
	   if(cou.length==2){
		   dto.setF1(cou[2]);
	   }else if(cou.length==1){ 
		   dto.setF1(cou[1]);
	   }
	   model.addObject("session_id",id);
	   return model;
   }
   @RequestMapping("/reservation2.do")
   public ModelAndView tableshow(@RequestParam String store){
	   ModelAndView model=new ModelAndView();
	   List<TableDto> list=new ArrayList<TableDto>();
	   int idx=service.getDataName(store);
	   System.out.println("지점idx :"+idx);
	   list=tservice.getList(idx);
//	   for(TableDto dto:list){
//		   System.out.println(dto.getTbname());
//	   }
	   model.addObject("list",list);
	   model.setViewName("/res/resTablelo");
	   return model;
   }

}
