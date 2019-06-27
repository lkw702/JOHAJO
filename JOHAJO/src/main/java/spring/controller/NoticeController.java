package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("/noticelist.do")
	public String NoticeList() {
		return "/notice/noticeList";
	}
}
