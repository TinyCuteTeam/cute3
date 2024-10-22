package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;

public interface BOMService {

	List listBOM();
	List<BOMDTO> selectBOMById(String bom_Id);
	List<String> selectGroupbyBOMId();
	
	public int deleteBOM(BOMDTO bomDTO);
	public int insertBOM(BOMDTO bomDTO);
	public int updateBOM(BOMDTO bomDTO);
}
