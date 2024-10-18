package kr.co.mandoo.dao;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;
import kr.co.mandoo.dto.ItemDTO;

public interface BOMDAO {
	
	//조회
	List<BOMDTO> selectBOM();
	List<BOMDTO> selectBOMById(String bom_Id);
	
	public int deleteBOM(BOMDTO bomDTO);
	public int insertBOM(BOMDTO bomDTO);
	public int updateBOM(BOMDTO bomDTO);
}
