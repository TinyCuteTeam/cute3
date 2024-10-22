package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.WorkDTO;


public interface ProductionStatusService {
	
	public List StatusListService();
	public WorkDTO StatusOne(String workId);
}
