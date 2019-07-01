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
	//로그인
	@RequestMapping("/loginform.do")
	public String login()
	{
		return "/member/memberLoginForm";
	}
	
	
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
	
	
	//멤버 insert
	@RequestMapping(value="/memberInsert.do",method=RequestMethod.POST)
	public String memberInsert(@ModelAttribute MemberDto dto,HttpServletRequest request){
	
		dto.setHp(dto.getHp1()+'-'+dto.getHp2()+'-'+dto.getHp3());
		/*
		 * System.out.println(dto.getHp1()); System.out.println(dto.getHp2());
		 * System.out.println(dto.getHp3());
		 */
		//dto.setBirth(dto.getYear()+'/'+dto.getMonth()+'/'+dto.getDay());
		
		
		
		service.memberInsert(dto);
		return "redirect:main.do";
	}
	
	
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
	
	//login action
	@RequestMapping(value="/memberlogin.do", method=RequestMethod.POST)
	public String memberLogin(
			@RequestParam String id,
			@RequestParam String pw, 
			@RequestParam (value="chkid",defaultValue="no") String chkid, 
			HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", pw);
		MemberDto dto = service.userLoginByIdandPW(map);
		if(dto.getIdx() > 0) {
			 session.setAttribute("saveok",chkid == "no"?"no":"yes"); //아이디저장
			 session.setAttribute("idok", dto.getId()); //로그인 아이디
			 session.setAttribute("loginok", "yes");//로그인 여부
			 session.setAttribute("userLogin", dto);//로그인 여부
			 
			 session.setMaxInactiveInterval(60*60*8);
			 
			 return "/member/memberLoginOk";
			 
		
		}else{
			return "redirect:loginform.do";
		}
		
	}
	
	//logout
	@RequestMapping("/userLogout.do")
	public String userLogout(HttpSession session) {
		session.removeAttribute("loginok");
		
		return "redirect:main.do";
	}
	
	@RequestMapping("/mypageform.do")
	public String myPageForm() {
		
		return "/member/myPageForm";
	}
	
}
