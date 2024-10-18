package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;
import kr.co.mandoo.dto.ItemDTO;

public interface BOMService {

	List listBOM();
	List<BOMDTO> getBOMById(String bom_Id); 
	
	public int deleteBOM(BOMDTO bomDTO);
	public int insertBOM(BOMDTO bomDTO);
	public int updateBOM(BOMDTO bomDTO);
}
