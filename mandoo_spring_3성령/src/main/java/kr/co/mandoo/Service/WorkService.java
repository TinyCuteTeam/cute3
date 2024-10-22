package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.WorkDTO;

public interface WorkService {

	List listWork();
	
	int insertWork(WorkDTO dto);
	
}
