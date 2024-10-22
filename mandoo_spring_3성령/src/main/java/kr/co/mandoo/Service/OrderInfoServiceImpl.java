package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.OrderInfoDAO;
import kr.co.mandoo.dto.OrderInfoDTO; 

@Service
public class OrderInfoServiceImpl implements OrderInfoService {

	@Autowired
	OrderInfoDAO orderInfoDAO; 

	@Override
	public List listOrderInfo() {
	
		List<OrderInfoDTO> list = orderInfoDAO.selectorderInfo(); // 메서드 이름 수정
		
		return list;
	}
}
