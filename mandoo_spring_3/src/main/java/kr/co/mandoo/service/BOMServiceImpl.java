package kr.co.mandoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.BOMDAO;
import kr.co.mandoo.dto.BOMDTO;

@Service
public class BOMServiceImpl implements BOMService {

	@Autowired
	BOMDAO bomDAO;
	
	@Override
	public List listBOM() {
		List<BOMDTO> list = bomDAO.selectBOM();
		
		return list;
	}
}
