package spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {
	
	@RequestMapping("/reslist.do")
	public String ReservationList() {
		return "/res/reservationList";
	}
}
