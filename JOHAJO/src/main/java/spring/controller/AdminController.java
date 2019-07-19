package spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.EventDto;
import spring.data.StoreDto;
import spring.service.AdminService;
import spring.service.EventService;
import spring.service.StoreService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private EventService event_service;
	@Autowired
	private StoreService store_service;

	@RequestMapping("/admain.do")
	public String admain() {
		return "admain.tiles";
	}
/*
 * mainform ************************************************************************
 */
	@RequestMapping("/ad_MainForm.do")
	public String mainForm() {
		return "/ad/admin/ad_MainForm";
	}
	
/*
 * menu ************************************************************************
 */
	@RequestMapping("/ad_MenuList.do")
	public String menuList() {
		return "/ad/admin/ad_MenuList";
	}
/*
 * store ************************************************************************
 */
	//store insert 
	//==========================================================================
	
	@RequestMapping("/ad_StoreList.do")
	public ModelAndView storeList() {
		
		ModelAndView model=new ModelAndView();
		List<StoreDto> list=service.getStore();
		
		model.addObject("list",list);
		model.setViewName("/ad/store/ad_StoreList");
		return model;
	}
	
	@RequestMapping("/storeInsert.pop")
	public String storeInsert()
	{
		return "/ad/pop/store/ad_StoreForm";
	}
	
	@RequestMapping("/storeInsert.do")
	public String s_insert(@RequestParam String name,@RequestParam String xpoint,
			@RequestParam String ypoint,@RequestParam String addr
			,@RequestParam String phone,@RequestParam String ohours
			,@RequestParam String service1)
	{
		StoreDto dto=new StoreDto();
		dto.setAddr(addr);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setXpoint(xpoint);
		dto.setYpoint(ypoint);
		dto.setOhours(ohours);
		dto.setService(service1);
		
		service.insertStore(dto);
		return "redirect:ad_StoreList.do";
	}
	
//store UPDATE 
//==========================================================================
	
	@RequestMapping("/storeUpData.pop")
	public ModelAndView storeUpData(@RequestParam int idx)
	{
		System.out.println("들어는 오나?");
		ModelAndView model=new ModelAndView();
		StoreDto dto=store_service.getData(idx);
		
		model.addObject("dto",dto);
		
		model.setViewName("/ad/pop/store/ad_StoreUpData");
		return model;
	}
	
	@RequestMapping("/storeUpdata.do")
	public String so(@RequestParam String name,@RequestParam String xpoint,
			@RequestParam String ypoint,@RequestParam String addr
			,@RequestParam String phone,@RequestParam String ohours
			,@RequestParam String service1,@RequestParam int idx)
	{
		StoreDto dto=new StoreDto();
		dto.setAddr(addr);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setXpoint(xpoint);
		dto.setYpoint(ypoint);
		dto.setOhours(ohours);
		dto.setService(service1);
		dto.setIdx(idx);
		
		service.upDataStore(dto);
		return "/ad/pop/store/ad_StoreForm";
	}
	
//store DELETE 
//==========================================================================
	
	@RequestMapping("/storeDelete.do")
	public String deleteStore(@RequestParam int idx) 
	{
		System.out.println("들어오나요"+idx);
		service.deleteStore(idx);
		return "redirect:ad_StoreList.do";
	}
/*
 * notice ************************************************************************
 */
	
	@RequestMapping("/ad_NoticeList.do")
	public String noticeList() {
		return "/ad/admin/ad_NoticeList";
	}
/*
 * member ************************************************************************
 */
	@RequestMapping("/ad_MemberList.do")
	public String memberList() {
		return "/ad/member/ad_MemberList";
	}
/*
 * Q&A ************************************************************************
 */
	@RequestMapping("/ad_QnAList.do")
	public String qnaList() {
		return "/ad/admin/ad_QnAList";
	}
/*
 * res ************************************************************************
 */
	@RequestMapping("/ad_resList.do")
	public String resList() {
		return "/ad/admin/ad_ResList";
	}
	
/*
 * event ************************************************************************
*/	
	
}
