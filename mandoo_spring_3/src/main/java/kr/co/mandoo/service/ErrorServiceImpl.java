package kr.co.mandoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.ErrorDAO;
import kr.co.mandoo.dto.ErrorDTO;

@Service
public class ErrorServiceImpl implements ErrorService {

	@Autowired
	ErrorDAO errorDAO;
	
	@Override
	public List listError() {
		List<ErrorDTO> list = errorDAO.selectError();
		
		return list;
	}

	@Override
	public int deleteError(ErrorDTO errorDTO) {
		// TODO Auto-generated method stub
		return errorDAO.deleteError(errorDTO);
	}
}
