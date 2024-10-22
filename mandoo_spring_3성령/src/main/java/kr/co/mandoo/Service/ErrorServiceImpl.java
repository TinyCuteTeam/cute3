package kr.co.mandoo.Service;

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
		int result = -1;
		result = errorDAO.deleteError(errorDTO);
		return result;
	}

	@Override //insert 
	public int insertError(ErrorDTO errorDTO) {
		int result = -1;
		result = errorDAO.insertError(errorDTO);
		return result;
	}

	@Override
	public int updateError(ErrorDTO errorDTO) {
		int result = -1;
		result = errorDAO.updateError(errorDTO);
		return result;
	}
}
