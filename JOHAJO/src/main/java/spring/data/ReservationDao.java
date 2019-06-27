package spring.data;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
@Repository
public class ReservationDao extends SqlSessionDaoSupport {

	@RequestMapping("reslist.do")
	public String getReservationList() {
		// TODO Auto-generated method stub
		return "res/reservationList";
	}

}
