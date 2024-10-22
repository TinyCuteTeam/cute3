package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ProductionStatusDAO;
import kr.co.mandoo.dto.WorkDTO;

@Service
public class ProductionStatusServiceImpl implements ProductionStatusService {
	
	@Autowired
	ProductionStatusDAO productionStatusDAO;
	
	@Override
	public List StatusListService(){
		
		List list = productionStatusDAO.StatusList();
		System.out.println("service에서 list 출력 : " + list);
		
		return list;
	}
	@Override
	public WorkDTO StatusOne(String workId) {
		WorkDTO list = productionStatusDAO.StatusOne(workId);
		System.out.println("service에서 list 출력 : " + list);
		
		return list;
		
	}

}
