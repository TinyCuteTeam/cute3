package kr.co.mandoo.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mandoo.dao.WorkDAO;
import kr.co.mandoo.dto.WorkDTO;

@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	WorkDAO workDAO;
	
	@Override
	public List listWork() {

		List<WorkDTO> list = workDAO.selectWork();

		return list;
	}
	
	@Override
	public int insertWork(WorkDTO dto) {
		int result = -1;
		result = workDAO.insertWork(dto);
		return result;
	}
	
}
