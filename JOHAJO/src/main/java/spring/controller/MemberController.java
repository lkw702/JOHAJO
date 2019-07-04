package spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.MemberDto;
import spring.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
/*
 * JOIN***********************************************************
 */	
	
	//약간동의
	@RequestMapping("/joinform.do")
	public String form()
	{
		return "/member/memberJoinForm1";
	}
	
	//가입폼
	@RequestMapping("/joinform2.do")
	public String form2()
	{
		return "/member/memberJoinForm2";
	}
	

	//id check
	@ResponseBody
	@RequestMapping(value= {"member","idCheck.pop"},method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberIdCheck( 
			@RequestParam(value="id",defaultValue="") String id 
			) {
		ModelAndView model = new ModelAndView();
		int  result = service.memberIdCheck(id);
		model.addObject("result", result);
		model.addObject("id", id);
		model.setViewName("/pop/member/idCheck");
		return model;
		
	}
	
	//멤버 insert
	@RequestMapping(value="/memberInsert.do",method=RequestMethod.POST)
	public String memberInsert(@ModelAttribute MemberDto dto,HttpServletRequest request){
	
		dto.setHp(dto.getHp1()+'-'+dto.getHp2()+'-'+dto.getHp3());
		
		service.memberInsert(dto);
		return "redirect:joinSuccess.do";
	}
	
	//join success
	@RequestMapping("/joinSuccess.do")
	public String joinSuccess() {
		
		return "/member/memberJoinSuccess";
	}
	
	
/*
 * LOGIN***********************************************************
 */	
	
	//login action
	@RequestMapping(value="/memberlogin.do", method=RequestMethod.POST)
	public String memberLogin(
			@RequestParam String id,
			@RequestParam String pw, 
			@RequestParam (value="chkid",defaultValue="no") String chkid, 
			HttpSession session,Model model){
		
		
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", pw);
		MemberDto dto = service.userLoginByIdandPW(map);
		if(dto != null && dto.getId().equals(id)) {
			if(chkid.equals("no")) {
				session.setAttribute("saveok","no"); 
			}else {
				session.setAttribute("saveok","yes"); 
			}
			// session.setAttribute("saveok",chkid=="no"?"no":"yes"); //아이디저장
			 session.setAttribute("idok", dto.getId()); //로그인 아이디
			 session.setAttribute("loginok", "yes");//로그인 여부
			 session.setAttribute("userLogin", dto);//로그인 여부
			 
			 session.setMaxInactiveInterval(60*60*8);
			 
			 return "/member/memberLoginOk";
			 
		
		}else{
			
			model.addAttribute("log","false");
			return "redirect:loginform.do";
		}
		
	}
	
	//logout
	@RequestMapping("/userLogout.do")
	public String userLogout(HttpSession session) {
		session.removeAttribute("loginok");
		
		return "redirect:main.do";
	}
	
	
	//로그인
	@RequestMapping("/loginform.do")
	public String login(Model model, @RequestParam(value="log",defaultValue="") String log )
	{
		model.addAttribute("log",log);
		return "/member/memberLoginForm";
	}
	
	//아이디 찾기
	@RequestMapping("/selIdform.do")
	public String selIdform() {
		
		return "/member/selIdform";
	}
	
	//id select action
		@RequestMapping(value="/selectid.do", method=RequestMethod.POST)
		public String selectid(
				Model model, 
				@RequestParam String name,
				@RequestParam String hp,
				@RequestParam int hp2,
				@RequestParam int hp3){
			
			String tot_hp = hp+"-"+hp2+"-"+hp3;
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("hp", tot_hp);
			
			MemberDto dto = service.selectUserId(map);
			String findId ="", joindate="";
			
			if(dto == null) {
				findId = "";
				joindate = "";
				
			}else {
				 findId = dto.getId();
				 joindate = dto.getJoindate();
			}
			
			
			
			model.addAttribute("findId",findId);
			model.addAttribute("joindate",joindate);
			
			return "/member/selectIdResult";
			
		}
		
		
	//비번찾기
	@RequestMapping("/selPwform.do")
	public String selPwform() {
		
		return "/member/selPwform";
	}
	
	
	
	//pw select action
	@RequestMapping(value="/selectpw.do", method=RequestMethod.POST)
	public String selectpw(
			Model model, 
			@RequestParam String id,
			@RequestParam String hp,
			@RequestParam int hp2,
			@RequestParam int hp3){
		
		String tot_hp = hp+"-"+hp2+"-"+hp3;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("hp", tot_hp);
		
		MemberDto dto = service.selectUserPw(map);
		String findName ="", findPw = "";
		
		if(dto == null) {
			 findName = "";
			 findPw = "";
			
		}else {
			 findName = dto.getName();
			 findPw = dto.getPassword();
		}
		
		
		model.addAttribute("findName",findName);
		model.addAttribute("findPw",findPw);
		
		return "/member/selectPwResult";
		
	}
			
	
	
/*
 * MYPAGE***********************************************************
 */	
	//mygage 이동
	@RequestMapping("/mypageform.do")
	public String myPageForm() {
		
		return "/member/myPageForm";
	}
	
	
}
