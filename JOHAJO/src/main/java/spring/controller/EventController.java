package spring.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



//import com.sun.java.util.jar.pack.Package.Class.Member;
import com.sun.javafx.collections.MappingChange.Map;
import com.sun.jmx.snmp.Timestamp;

import spring.data.CouponDto;
import spring.data.EventDto;
import spring.service.CouponService;
import spring.service.EventService;
import spring.service.MemberService;

@Controller
public class EventController {
	@Autowired
	public EventService service;
	@Autowired
	public CouponService couservice;
	@Autowired
	public MemberService memservice;
	
	//공지사항
	@RequestMapping("/noticeevent.do")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1") int currentPage){
		ModelAndView model=new ModelAndView();
		
		int totalCount; //총 데이터 개수
		totalCount=service.getTotalCount();
		
		//페이징처리 복붙
			//페이징처리에 필요한 변수들 선언
			int totalPage; //총 페이지수
			int startNum; //각페이지의시작번호
			int endNum; //각페이지의끝번호
			int startPage; //블럭의 시작페이지
			int endPage; //블럭의 끝페이지
			int no;//출력할 시작번호
			int perPage=5;//한페이지당 보여질 글의갯수
			int perBlock=5;//한블럭당 보여질 페이지의 갯수
			
			totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
			
			startPage=(currentPage-1)/perBlock*perBlock+1;
			endPage=startPage+perBlock-1;
			//마지막 블럭은 끝페이지가 총 페이지수와 같아야함
			if(endPage>totalPage)
				endPage=totalPage;
	
			startNum=(currentPage-1)*perPage+1;
			endNum=startNum+perPage-1;
			//마지막 페이지의 글번호 체크하기
			if(endNum>totalCount)
				endNum=totalCount;
			
			no=totalCount-(currentPage-1)*perPage;	
			
			//전체 데이터 가져오기
			List<EventDto> list=service.getList(startNum, endNum);
			
			model.addObject("list", list);
			model.addObject("currentPage", currentPage);
			model.addObject("startPage", startPage);
			model.addObject("endPage", endPage);
			model.addObject("no", no);
			model.addObject("totalPage", totalPage);
		
		
		model.addObject("totalCount",totalCount);
		
		model.setViewName("/notice/noticeEvent");
		return model;
	}
	
	@RequestMapping("/noticeEvent_content.do")
	public String content(Model model,@RequestParam int idx, @RequestParam int pageNum)
	{	
		//데이터 가져오기
		EventDto dto=service.getData(idx);
		dto.setContent(dto.getContent().replace("\n","<br>"));
		//model에 저장
		model.addAttribute("dto",dto);
		//model.addAttribute("check",check);
		model.addAttribute("pageNum",pageNum);
		
		return "/notice/noticeEvent_content";
	}
	
	//이벤트 - 당첨자발표 ( 결과페이지에서 당첨자발표로 돌아가기 위함 )
	@RequestMapping("/event_win.do")
	public String NoticeEvent_win(){
		return "/notice/noticeEvent_win";
	}
	//이벤트 - 당첨자발표 - 결과페이지 
	@RequestMapping("/event_lotto.do")
	public String NoticeEvent_lotto(){
		return "/notice/noticeEvent_lotto";
	}
	@RequestMapping(value="/getCoupon.do",method=RequestMethod.GET)
	public ModelAndView getCoupon(@RequestParam int idx,@RequestParam(defaultValue="0") int member,HttpServletRequest request)throws Exception{ 	//이벤트 db에 idx를 받음
		ModelAndView model =new ModelAndView();
		System.out.println(idx+"/"+member);
		int check=3;
		//System.out.println(member);
		if(member>0){
			//System.out.println("member"+member);
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("event_f", idx);//event db에 idx
			map.put("member_f", member);
			//System.out.println("map"+map.size());
			check=couservice.getDataCount(map);
			System.out.println("check"+check);
			if(check==1){
			}else{
				//System.out.println(idx+"/2/"+member);
					CouponDto coudto=new CouponDto();
					EventDto evdto = service.getData(idx);
					//System.out.println("제목"+evdto.getTitle());
					coudto.setEvent_f(idx);
					coudto.setCoupon_name(evdto.getTitle());
					
					int discount=evdto.getDiscount_rate();
					//System.out.println("할인율"+discount);
					coudto.setDiscount(evdto.getDiscount_rate());
					coudto.setMember_f(member);
					Calendar cal =Calendar.getInstance();
					
					//SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
					//System.out.println("dd");
					//System.out.println(format.format(cal.getTime()));
					cal.add(Calendar.MONTH,evdto.getValidity_month());
					//System.out.println(format.format(cal.getTime()));
					
					int year=cal.get(Calendar.YEAR)%100;
					int month=cal.get(Calendar.MONTH)+1;
					int day=cal.get(Calendar.DATE);
					String date=day+"/"+month+"/"+year;
					//System.out.println(date);
					coudto.setValidity(date);
					couservice.insertCoupon(coudto);
					check=2;
			}
		}
		model.addObject("check",check);
		//model.addObject("idx",idx);
		//model.addObject("pageNum",pageNum);
		model.setViewName("/notice/addCoupon");
		return model;
		//return "redirect:/noticeEvent_content.do?check="+check+"&idx="+idx+"&pageNum="+pageNum;		
	}
}
