package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.WorkDTO;

public interface WorkDAO {

	List selectWork();
	
	int insertWork(WorkDTO dto);

}
