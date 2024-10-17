package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;

public interface BOMDAO {
	
	List<BOMDTO> selectBOM();
	List<BOMDTO> selectBOMById(String bom_Id);
}
