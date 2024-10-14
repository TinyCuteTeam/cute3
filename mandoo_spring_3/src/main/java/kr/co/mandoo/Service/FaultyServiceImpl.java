package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.FaultyDAO;

@Service
public class FaultyServiceImpl implements FaultyService{
	
	@Autowired
	FaultyDAO faultyDAO;
	
	@Override
	public List faultySelectService(){
		
		List list = faultyDAO.faultyselect();
		System.out.println("service에서 list 출력 : " + list);
		
		return list;
	}

}
