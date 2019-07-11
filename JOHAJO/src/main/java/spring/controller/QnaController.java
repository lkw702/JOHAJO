package spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.data.QnaDto;
import spring.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService service;
	
	@RequestMapping(value="/myqnaList.do",method=RequestMethod.GET)
	public ModelAndView myqnaList(@RequestParam int idx) {
		ModelAndView model = new ModelAndView();
		
		int totalCount;
		totalCount = service.QnaTotalCount();
		List<QnaDto> list = service.QnaSelectList(idx);
		
		model.addObject("list", list);
		model.addObject("totalCount",totalCount);
		model.setViewName("/member/myqnaList");
		return model;
	} 
	
	@RequestMapping("/myqnaForm.do")
	public String qnaForm() {
		return "/member/myqnaForm";
	}
	
	@RequestMapping(value = "/myqnaInsert.do", method = RequestMethod.POST)
	public String myqnaInsert(@ModelAttribute QnaDto dto, HttpServletResponse response) {

		int fid = dto.getMem_f();
		
		int max = service.qnaMaxIdx();
		max +=1;
		
		dto.setIdx(max);
		dto.setGrp(max);
		
		service.myqnaInsert(dto);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>");
			out.println("alert('문의완료되었습니다.');");
			out.println("</script>");
			// out.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:myqnaList.do?idx=" + fid;
	}
		
		
	@RequestMapping(value = "/myqnaInsert2.do", method = RequestMethod.POST)
	public ModelAndView myqnaInsert2(@ModelAttribute QnaDto dto, HttpServletResponse response) {
		ModelAndView model=new ModelAndView();
		int stp = dto.getStp();
		int lv = dto.getLv();
		String title="문의답변입니다.";
		
		if(dto.getGrp()>0) {
			stp+=1;
			lv+=1;
		}
			
			dto.setTitle(title);
			
			
			int	max = service.qnaMaxIdx();
			
			if(max > 0) {
				max +=1;
			}
			
			dto.setIdx(max);
			
			dto.setStp(stp);
			dto.setLv(lv);
			
			service.myqnaInsert(dto);
			
			model.addObject("dto",dto);
			model.setViewName("/member/myqnaData");
			
			return model;	
	}
	
}
