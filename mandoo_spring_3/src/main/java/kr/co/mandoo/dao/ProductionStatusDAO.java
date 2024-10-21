package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.ProductionstatusDTO;
import kr.co.mandoo.dto.WorkDTO;

public interface ProductionStatusDAO {
	
	public List<ProductionstatusDTO> StatusList();
	public WorkDTO StatusOne(String workId);

}
