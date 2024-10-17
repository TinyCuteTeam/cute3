package kr.co.mandoo.Service;

import java.util.List;

import kr.co.mandoo.dto.BOMDTO;

public interface BOMService {

	List listBOM();
	List<BOMDTO> getBOMById(String bom_Id); 
}
